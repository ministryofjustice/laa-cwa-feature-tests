require 'yaml'
require 'date'

module Helpers
  module ScreenFieldBuilder

    DEFAULTS_DIR = 'features/support/am/defaults/'
    FIELDS_DIR = 'features/support/am/fields/'

    def self.get_fields(*args)
      area_of_law = args[0][0]
      if area_of_law == 'crime_lower'
        am_fields = YAML.load_file(File.expand_path (FIELDS_DIR + 'am_crime_lower.yml'))
        am_defaults = YAML.load_file(File.expand_path(DEFAULTS_DIR + 'am_crime_lower_defaults.yml'))
        category = args[0][1]
        stage_reached_code = args[0][2]

        am_data = am_fields[area_of_law][category][stage_reached_code]
        am_data_defaults = am_defaults[area_of_law][category][stage_reached_code]

        am_data.update(am_data_defaults)

      elsif area_of_law == 'legal_help'
        category_of_law = args[0][1]
        case args[0].length
        when 1
          raise ArgumentError, "For Legal Help at least 2 arguments required (area_of_law, category_of_law)"
        when 2
          # claim_type was not given
          claim_type = 'completed_matter'
        when 3
          claim_type = args[0][2]
        else
          raise ArgumentError, "For Legal Help a maximum of 3 arguments is required (area_of_law, category_of_law, claim_type)"
        end

        am_fields = YAML.load_file(File.expand_path (FIELDS_DIR + 'am_legal_help.yml'))
        am_defaults = YAML.load_file(File.expand_path(DEFAULTS_DIR + 'am_legal_help_defaults.yml'))

        am_data = am_fields[area_of_law][claim_type][category_of_law]
        am_data_defaults = am_defaults[area_of_law][claim_type][category_of_law]

        am_data.update(am_data_defaults)
        am_data.update({'work_concluded_date'=>Time.now.strftime("%d/%m/%Y")})
      elsif area_of_law == 'mediation'
        am_fields = YAML.load_file(File.expand_path(DEFAULTS_DIR + 'am_mediation.yml'))
        am_defaults = YAML.load_file(File.expand_path(DEFAULTS_DIR + 'am_mediation_defaults.yml'))
        matter_type_code = args[0][1]

        am_data = am_fields[area_of_law][matter_type_code]
        am_data_defaults = am_defaults[area_of_law][matter_type_code]

        am_data.update(am_data_defaults)
      else
        raise TypeError, "Area Of Law '#{area_of_law}' not recognised."
      end
      return am_data
    rescue NoMethodError => e
      puts "Unable to retrieve the following keys from the yaml file using #{args[0]}"
      puts e.message
      puts e.backtrace
    end
  end
end
