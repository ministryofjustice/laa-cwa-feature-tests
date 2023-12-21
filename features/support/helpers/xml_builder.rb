module Helpers
  module XMLBuilder
    class XML
      XMLNS ||= 'http://www.legalservices.gov.uk/sms/ActivityManagement/XMLSchema/'.freeze
      XMLNS_XSI ||= 'http://www.w3.org/2001/XMLSchema-instance'.freeze
      XSI_SCHEMA_LOCATION ||= 'http://www.legalservices.gov.uk/sms/ActivityManagement/XMLSchema/LSCSMSBulkLoadSchemaV5.xsd'.freeze

      def initialize(submission: nil, matter_types: [], new_lines: [])
        @submission = submission
        @matter_types = matter_types
        @new_lines = new_lines

        initialise_builder
        setup_submission_data!
      end

      def raw
        @xml
      end

      def initialise_builder
        @builder = Builder::XmlMarkup.new(indent: 2)
        @builder.instruct!
      end

      def setup_submission_data!
        @xml = @builder.submission(
          xmlns: XMLNS,
          'xmlns:xsi' => XMLNS_XSI,
          'xsi:schemaLocation' => XSI_SCHEMA_LOCATION
        ) do |sub|
          sub.office(account: @submission.account_number) do |off|
            off.schedule(
              submissionPeriod: @submission.period,
              areaOfLaw: @submission.area_of_law,
              scheduleNum: @submission.schedule_number
            ) do |schedule|
              generate_schedule(schedule)
            end
          end
        end
      end

      def generate_schedule(schedule)
        tot_outcomes = 1
        @matter_types.each do |matter_type|
          @new_lines.each do |new_line|
            schedule.outcome(matterType: matter_type) do |outcome|
              generate_outcome(new_line, tot_outcomes, outcome)
            end
            tot_outcomes += 1
          end
        end
      end

      def default_field_value(name)
        @submission.lines.find { |d| d.name == name }&.default_value
      end

      def generate_outcome(new_line, tot_outcomes, outcome)
        outcome.outcomeItem(@submission.schedule_ref, name: 'SCHEDULE_REF')

        now = Time.now

        case_id = new_line[:case_id] || "%03d" % tot_outcomes
        client_dob = if new_line[:client_date_of_birth] && new_line[:client_date_of_birth] != '<default>'
          new_line[:client_date_of_birth]
        else
          default_field_value('CLIENT_DATE_OF_BIRTH')
        end
        client_forename = new_line[:client_forename] || default_field_value('CLIENT_FORENAME')
        client_surname = new_line[:client_surname] || default_field_value('CLIENT_SURNAME')
        case_start_date = new_line[:case_start_date] || default_field_value('CASE_START_DATE')
        rep_order_date = new_line[:rep_order_date] || default_field_value('REP_ORDER_DATE')
        work_concluded_date = new_line[:work_concluded_date] || default_field_value('WORK_CONCLUDED_DATE')
        ufn = new_line[:ufn] || default_field_value('UFN')

        @submission.lines.each do |default_line|
          field = default_line.name
          value = new_line[field.downcase.to_sym]

          value = case field
            when 'CASE_ID'
              case_id
            when 'CLIENT_SURNAME'
              "#{client_surname} #{case_id}"
            when 'CASE_START_DATE'
              case_start_date || now.strftime("%d/%m/%Y")
            when 'REP_ORDER_DATE'
              rep_order_date || now.strftime("%d/%m/%Y")
            when 'WORK_CONCLUDED_DATE'
              work_concluded_date || now.strftime("%d/%m/%Y")
            when 'UFN'
              if ufn
                ufn
              else
                day, month, year = (case_start_date || rep_order_date || now.strftime("%d/%m/%Y")).split('/')
                "#{day}#{month}#{year[-2..-1]}/#{case_id}"
              end
            when 'UCN'
              "#{client_dob.tr('/', '')}/#{client_forename[0].upcase}/#{client_surname[0..3].upcase}"
            else
              value
            end

          value = default_line&.default_value if value.nil? || value == '<default>'
          value = nil if value == '<blank>'

          outcome.outcomeItem(value, name: field)
        end
      end
    end
  end
end
