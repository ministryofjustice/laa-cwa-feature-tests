module Helpers
  module Bulkload
    require_relative './refinements/string_refinement'

    using StringRefinement

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
  end
end
