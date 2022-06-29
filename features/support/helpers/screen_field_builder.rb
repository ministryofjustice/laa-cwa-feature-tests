require 'yaml'
require 'date'
require 'forwardable'

module Helpers
  module ScreenFieldBuilder
    def self.from(*args)
      Builder.new(*args)
    end

    class Builder
      extend Forwardable

      def_delegators :@object, :fields, :defaults, :values, :overrides=, :fields_with_label

      attr_reader :area_of_law, :category_of_law

      def initialize(area_of_law:, category_of_law:, **extra_args)
        @area_of_law = area_of_law.to_s
        @category_of_law = category_of_law.to_s
        @extra_args = extra_args.transform_keys(&:to_sym)

        build_object
      end

      private

      attr_reader :extra_args, :object

      def build_object
        case area_of_law
        when 'crime_lower'
          @object = CrimeLower.new(args)
        when 'legal_help'
          @object = LegalHelp.new(args)
        when 'mediation'
          @object = Mediation.new(args)
        else
          raise ArgumentError, "Area Of Law '#{area_of_law}' not recognised"
        end
      end

      def args
        {
          area_of_law: area_of_law,
          category_of_law: category_of_law,
          **extra_args
        }
      end
    end

    class Base
      DEFAULTS_DIR = 'features/support/am/defaults/'.freeze
      FIELDS_DIR = 'features/support/am/fields/'.freeze

      def initialize(area_of_law:, category_of_law:, **extra_args)
        @area_of_law = area_of_law
        @category_of_law = category_of_law
        @extra_args = extra_args
      end

      def overrides=(hash)
        raise StandardError, "cannot re-define overrides" if defined?(@overrides)

        @overrides = hash.transform_keys(&:to_sym)
      end

      def fields
        raise NotImplementedError
      end

      def defaults
        raise NotImplementedError
      end

      def values
        @values ||= fields
          .merge(defaults)
          .merge(overrides)
      end

      def fields_with_label
        @fields_with_label ||= begin
          all = load_yaml("#{FIELDS_DIR}/am_all_labels.yml").transform_keys(&:to_sym)
          fields.merge(overrides).reduce({}) do |acc, (field,_)|
            labels = all.fetch(field, nil)
            labels&.any? ? acc.merge(field => labels) : acc
          end
        end
      end

      private

      attr_reader :area_of_law, :category_of_law, :extra_args, :overrides

      def load_fields
        load_yaml("#{FIELDS_DIR}/am_#{area_of_law}.yml")
      end

      def load_defaults
        load_yaml("#{DEFAULTS_DIR}/am_#{area_of_law}_defaults.yml")
      end

      def load_yaml(filename)
        YAML.load_file(File.expand_path(filename))
      end

      def overrides
        @overrides || {}
      end
    end

    class CrimeLower < Base
      def fields
        @fields ||= load_fields
          .fetch(area_of_law)
          .fetch(category_of_law)
          .fetch(stage_reached_code)
          .transform_keys(&:to_sym)
      end

      def defaults
        @defaults ||= load_defaults
          .fetch(area_of_law)
          .fetch(category_of_law)
          .fetch(stage_reached_code)
          .transform_keys(&:to_sym)
      end

      private

      def stage_reached_code
        extra_args.fetch(:stage_reached_code)&.to_s
      end
    end

    class LegalHelp < Base
      def fields
        @fields ||= load_fields
          .fetch(area_of_law)
          .fetch(claim_type)
          .fetch(category_of_law)
          .transform_keys(&:to_sym)
      end

      def defaults
        @defaults ||= load_defaults
          .fetch(area_of_law)
          .fetch(claim_type)
          .fetch(category_of_law)
          .transform_keys(&:to_sym)
      end

      private

      def claim_type
        extra_args.fetch(:claim_type, 'completed_matter').to_s
      end

      def overrides
        return @overrides if @overrides.key?(:work_concluded_date)

        @overrides.merge({ work_concluded_date: Time.now.strftime('%d/%m/%Y') })
      end
    end

    class Mediation < Base
      def fields
        @fields ||= load_fields
          .fetch(matter_type_code)
          .transform_keys(&:to_sym)
      end

      def defaults
        @defaults ||= load_defaults
          .fetch(matter_type_code)
          .transform_keys(&:to_sym)
      end

      private

      def matter_type_code
        extra_args.fetch(:matter_type_code)&.to_s
      end
    end
  end
end
