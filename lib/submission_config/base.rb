module SubmissionConfig
  class Base
    class << self
      attr_accessor *%i[
        matter_type1_codes
        matter_type2_codes
        matter_type_code_combinations
        standard_fee
        standard_fees
        additional_payments
        additional_payment_fees
        additional_payment_combinations
        escape_fee_threshold_formula
        max_price_cap
      ]

      def define_matter_type1_codes(hash)
        self.matter_type1_codes = hash
      end

      def define_matter_type2_codes(hash)
        self.matter_type2_codes = hash
      end

      def define_matter_type_code_combinations(hash)
        self.matter_type_code_combinations = hash
      end

      def define_standard_fee(string)
        self.standard_fee = string.to_i
      end

      def define_standard_fees(hash)
        self.standard_fees = hash
      end

      def define_additional_payments(hash)
        self.additional_payments = hash
      end

      def define_additional_payment_fees(hash)
        self.additional_payment_fees = hash
      end

      def define_additional_payment_combinations(hash)
        self.additional_payment_combinations = hash
      end

      def define_escape_fee_threshold_formula(string)
        self.escape_fee_threshold_formula = string
      end

      def define_max_price_cap(string)
        self.max_price_cap = string.to_i
      end

      def load_config
        ConfigBuilder.new(
          matter_type1_codes: @matter_type1_codes,
          matter_type2_codes: @matter_type2_codes,
          matter_type_code_combinations: @matter_type_code_combinations,
          standard_fee: @standard_fee,
          standard_fees: @standard_fees,
          additional_payments: @additional_payments,
          additional_payment_fees: @additional_payment_fees,
          additional_payment_combinations: @additional_payment_combinations,
          escape_fee_threshold_formula: @escape_fee_threshold_formula,
          max_price_cap: @max_price_cap,
        )
      end
    end

    def initialize
      @config ||= self.class.load_config
    end

    def matter_types_by_matter_type1_description(description)
      name, description = description.split(': ')
      available_matter_types.select do |matter_types|
        matter_types.matter_type1.name == name &&
          matter_types.matter_type1.description == description
      end
    end

    def available_matter_types
      @config.matter_type_code_combinations
    end

    def escape_fee_threshold_formula
      @config.escape_fee_threshold_formula
    end

    def standard_fee
      @config.standard_fee
    end

    def max_price_cap
      @config.max_price_cap
    end

    def max_profit_cost
      Constants::MAX_PROFIT_COST
    end

    private

    attr_accessor :config
  end
end
