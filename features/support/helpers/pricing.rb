require 'forwardable'

module Helpers
  module Pricing
    def self.config_by(*args)
      ConfigBuilder.new(*args)
    end

    def self.calculator_from(*args)
      Calculator.new(*args)
    end

    class Calculator
      extend Forwardable

      attr_reader :profit_cost, :counsel_cost, :vat_indicator, :all_additional_payments, :disbursements_amount, :disbursements_amount_vat

      def initialize(config:)
        @config = config
      end

      def generate_pricing_lines
        [
          {
            profit_cost: profit_cost,
            counsel_cost: counsel_cost,
            disbursements_amount: disbursements_amount,
            disbursements_amount_vat: disbursements_amount_vat,
            vat_indicator: vat_indicator
          }.merge(**all_additional_payments||{})
        ]
      end

      def random_profit_and_counsel_costs!(min_total:, max_total:, include_additional_payments: false)
        profit_costs_offset = rand(min_total..max_total-min_total)
        @profit_cost = (max_total - profit_costs_offset).round(2)
        @profit_cost += tot_additional_payments.round(2) if include_additional_payments
        @counsel_cost = profit_costs_offset.round(2)
      end

      def exceed_profit_or_counsel_cost_by!(excess:)
        rand(0..1) == 0 ? (@profit_cost += excess) : (@counsel_cost += excess)
        @profit_cost = profit_cost.round(2)
        @counsel_cost = counsel_cost.round(2)
      end

      def reduce_profit_or_counsel_cost_by!(decrement:)
        rand(0..1) == 0 ? (@profit_cost -= decrement) : (@counsel_cost -= decrement)
        @profit_cost = profit_cost.round(2)
        @counsel_cost = counsel_cost.round(2)
      end

      def random_additional_payments!
        @all_additional_payments = additional_payments
          .map(&:name)
          .zip([*1..additional_payments.count].sample(additional_payments.count))
          .to_h

        if all_additional_payments[:substantive_hearing]
          @all_additional_payments[:substantive_hearing] = (rand(0..1) == 0 ? 'N' : 'Y')
        end
      end

      def random_disbursments_and_vat!(min:, max:)
        @disbursements_amount = rand(min..max).round(2)
        @disbursements_vat = (disbursements_amount * 0.20).round(2)
      end

      def use_max_profit_cost!(include_additional_payments: false)
        @profit_cost = max_price_cap || max_profit_cost
        @profit_cost -= tot_additional_payments if include_additional_payments
      end

      def enable_vat_indicator!
        @vat_indicator = 'Y'
      end

      def tot_additional_payments
        all_additional_payments&.reduce(0) do |tot, (name, units)|
          units = units == 'Y' ? 1 : 0 unless units.is_a?(Numeric)
          tot +=
            (additional_payments.find do |additional_payment|
              additional_payment.name == name
            end.value * units)
        end&.round(2) || 0
      end

      private

      attr_reader :config

      def_delegators :@config, :standard_fee, :max_price_cap, :max_profit_cost, :additional_payments
    end

    class ConfigBuilder
      NoMatterTypesAvailableError = Class.new(StandardError)

      def initialize(category_of_law:, matter_type1_description:)
        @category_of_law = category_of_law
        @matter_type1_description = matter_type1_description

        build_config
      end

      def matter_type_code
        test_matter_type.name
      end

      def standard_fee
        test_matter_type.standard_fee&.value || category_of_law_config.standard_fee&.value
      end

      def max_price_cap
        category_of_law_config.max_price_cap
      end

      def max_profit_cost
        category_of_law_config.max_profit_cost
      end

      def escape_fee_threshold
        test_matter_type.escape_fee_threshold
      end

      def escape_fee_threshold_formula
        category_of_law_config.escape_fee_threshold_formula
      end

      def additional_payments
        test_matter_type.additional_payments || []
      end

      private

      attr_reader :category_of_law, :matter_type1_description,
        :category_of_law_config, :test_matter_type

      def build_config
        fetch_category_of_law_config
        pick_test_matter_type
      end

      def fetch_category_of_law_config
        @category_of_law_config = SubmissionConfig.by_category_of_law(category_of_law)
      end

      def pick_test_matter_type
        if all_matter_types.empty?
          raise NoMatterTypesAvailableError.new("no matter types available for '#{description}'")
        end

        @test_matter_type = all_matter_types.sample
      end

      def all_matter_types
        category_of_law_config.matter_types_by_matter_type1_description(matter_type1_description)
      end
    end

    # class OutcomeBuilder

    #   AVAILABLE_FORMULAS = [
    #     'profit + counsel costs exceeding the standard fee of £1.00',
    #     'profit + counsel costs exceeding the max price cap',
    #     'profit and counsel costs according to hourly rates',
    #     'additional payments',
    #     'disbursements and disbursements VAT',
    #     'VAT indicator enabled for profit and counsel costs',
    #     'profit + counsel costs',
    #     'profit + counsel costs (minus additional payments)' (\(minus additional payments\)\s)?(NOT\s)?exceeding the escape threshold?
    #   ]
    #   attr_reader :profit_cost, :counsel_cost

    #   def initialize(formula:)
    #     @formula = formula
    #   end

    #   def outcome
    #     { profit_cost: profit_cost, counsel_cost: counsel_cost }
    #   end

    #   private

    #   attr_reader :formula

    #   def standard_fee
    #   end

    #   def max_profit_cost
    #   end

    # end
  end
end