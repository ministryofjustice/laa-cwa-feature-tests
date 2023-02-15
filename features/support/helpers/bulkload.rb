require 'time'
require 'ox'

module Helpers
  module Bulkload
    require_relative './refinements/string_refinement'

    using StringRefinement

    XMLNS_XSI = "http://www.w3.org/2001/XMLSchema-instance"
    XMLNS_XSD = "http://www.w3.org/2001/XMLSchema"
    XMLNS = "http://www.legalservices.gov.uk/sms/ActivityManagement/XMLSchema/"

    FIXTURES_DIR ||= './features/support/fixtures/bulkload/'.freeze
    TMP_DIR ||= "#{FIXTURES_DIR}tmp/".freeze
    private_constant :FIXTURES_DIR

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

    def build_bulkload_xml(submission:, matter_types:, new_lines:)
      Helpers::XMLBuilder::XML.new(submission: submission, matter_types: matter_types, new_lines: new_lines).raw
    end

    def parse_bulkload_xml(file_name)
      Nokogiri::Slop(File.read(bulkload_file_path(file_name))).remove_namespaces!
    end

    def save_tmp_bulkload_xml(xml)
      file_name = tmp_bulkload_file_path("bulkload_#{Time.now.to_i}.xml")
      File.write(file_name, xml) && file_name
    end

    def table_to_hash_array(table)
      headers = table.headers.map(&:underscorize).map(&:to_sym)
      table.rows.map do |row|
        headers.zip(row).to_h
      end
    end

    def build_and_save_bulkload_file(submission, submission_header)
      file_name = tmp_bulkload_file_path("bulkload_#{Time.now.to_i}.xml")
      doc = Ox::Builder.file(file_name)
      doc.instruct('xml', {:version => '1.0'})
      doc.element('submission', {'xmlns:xsi'=> XMLNS_XSI,
        'xmlns:xsd' => XMLNS_XSD ,
        'xmlns' => XMLNS })
      doc.element('office', {'account' => submission_header['account']} )
      schedule = {'submissionPeriod' => submission_header['submission_period'],
          'areaOfLaw' => submission_header['area_of_law'],
          'scheduleNum' => submission_header['schedule_num']}
      doc.element('schedule', schedule)

      t = Time.now
      day = t.strftime('%d')
      month = t.strftime('%m')
      year = t.strftime('%y')

      submission.each_with_index {|hash, i|
        idx_plus_one = i + 1
        case_id = idx_plus_one.to_s().rjust(3, "0")
        hash[:case_id] = case_id
        hash[:ufn] = "#{day}#{month}#{year}/#{case_id}"
        hash.compact!
        doc.element('outcome', {'matterType' => hash[:matter_type]})
        hash.each {|(k,v)|
          doc.element('outcomeItem', {'name' => k.to_s.upcase})
          doc.text(v.to_s)
          doc.pop
        }
        doc.pop
      }
      doc.close
      file_name
    end
  end
end
