require_relative './refinements/string_refinement'

module Helpers
  using StringRefinement

  FIXTURES_DIR = './features/support/fixtures/bulkload/'.freeze
  TMP_DIR = "#{FIXTURES_DIR}tmp/".freeze
  private_constant :FIXTURES_DIR

  def load_submission(category_of_law)
    method_name = "#{category_of_law.underscorize}_submission"
    CWAProvider.public_send(method_name.to_sym)
  end

  def bulkload_file(category_of_law, outcome_type)
    folder_name = category_of_law.underscorize
    file_name = outcome_type.underscorize

    "#{folder_name}/#{file_name}.csv"
  end

  def bulkload_file_path(file_name)
    File.expand_path(FIXTURES_DIR + file_name)
  end

  def tmp_bulkload_file_path(file_name)
    File.expand_path(TMP_DIR + file_name)
  end

  def parse_bulkload_xml(file_name)
    Nokogiri::Slop(File.read(bulkload_file_path(file_name))).remove_namespaces!
  end

  def within_popup(original_page, trigger)
    return unless block_given?

    popup_window = window_opened_by { trigger.call }
    original_window = original_page.current_window
    within_window(popup_window) { yield }
    switch_to_window(original_window)
  end

  def with_delay(wait = 1)
    return unless block_given?

    sleep(wait) && yield
  end

  def with_retry(times, exception)
    return unless block_given?

    retried ||= 0
    with_delay { yield(retried) }
  rescue exception
    raise if retried >= times

    retried += 1
    retry
  end

  def table_to_hash_array(table)
    headers = table.headers.map(&:underscorize).map(&:to_sym)
    table.rows.map do |row|
      headers.zip(row).to_h
    end
  end

  def save_tmp_bulkload_xml(xml)
    file_name = tmp_bulkload_file_path("bulkload_#{Time.now.to_i}.xml")
    File.write(file_name, xml) && file_name
  end

  def build_bulkload_xml(submission:, matter_types:, new_lines:)
    builder = Builder::XmlMarkup.new(indent: 2)
    builder.instruct!
    builder.submission(
      xmlns: 'http://www.legalservices.gov.uk/sms/ActivityManagement/XMLSchema/',
      'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
      'xsi:schemaLocation' => 'http://www.legalservices.gov.uk/sms/ActivityManagement/XMLSchema/LSCSMSBulkLoadSchemaV5.xsd'
    ) do |s|
      s.office(account: submission.account_number) do |o|
        o.schedule(
          submissionPeriod: submission.period,
          areaOfLaw: submission.area_of_law,
          scheduleNum: submission.schedule_number
        ) do |sc|
          matter_types.each.with_index do |matter_type, i|
            new_lines.each do |new_line|
              sc.outcome(matterType: matter_type) do |o|
                o.outcomeItem(submission.schedule_ref, name: 'SCHEDULE_REF')
                new_line[:case_id] = "%03d" % (new_line[:'#'].to_i + i)
                submission.lines.each do |default_line|
                  field = default_line.name
                  value = new_line[field.downcase.to_sym]
                  value = new_line[:case_id] if field == 'CASE_ID' && value.nil?
                  if field == 'UCN' && value.nil?
                    client_dob = if new_line[:client_date_of_birth] && new_line[:client_date_of_birth] != '<default>'
                      new_line[:client_date_of_birth]
                    else
                      submission.lines.find { |d| d.name == 'CLIENT_DATE_OF_BIRTH' }&.default_value
                    end
                    client_forename = new_line[:client_forename] || submission.lines.find { |d| d.name == 'CLIENT_FORENAME' }&.default_value
                    client_surname = new_line[:client_surname] || submission.lines.find { |d| d.name == 'CLIENT_SURNAME' }&.default_value
                    value = "#{client_dob.tr('/', '')}/#{client_forename[0].upcase}/#{client_surname[0..3].upcase}"
                  end
                  value = default_line&.default_value if value.nil? || value == '<default>'
                  value = "#{value} #{new_line[:case_id]}" if field == 'CLIENT_SURNAME'
                  value = "#{new_line[:client_date_of_birth].tr('/', '')}/#{new_line[:client_surname]}" if field == 'UCN' && value.nil?
                  value = nil if value == '<blank>'
                  o.outcomeItem(value, name: field)
                end
              end
            end
          end
        end
      end
    end
  end

  def error_message(code_or_message)
    CWAProvider.errors.find do |error|
      error.code == code_or_message
    end&.message || code_or_message
  end
end

World(Helpers)
