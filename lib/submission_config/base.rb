module SubmissionConfig
  class Base
    class << self
      private

      def define_matter_type1_codes(hash)
        @@matter_type1_codes = hash
      end

      def define_matter_type2_codes(hash)
        @@matter_type2_codes = hash
      end

      def define_matter_type_code_combinations(hash)
        @@matter_type_code_combinations = hash
      end

      def define_standard_fees(hash)
        @@standard_fees = hash
      end

      def define_additional_payments(hash)
        @@additional_payments = hash
      end

      def define_additional_payment_fees(hash)
        @@additional_payment_fees = hash
      end

      def define_additional_payment_combinations(hash)
        @@additional_payment_combinations = hash
      end

      def define_claim_types(hash)
        @@claim_types = hash
      end

      def define_claim_types_additional_payments(hash)
        @@claim_types_additional_payments = hash
      end
    end

    def matter_types_by_matter_type1_description(description)
      available_matter_types.select do |matter_types|
        matter_types.matter_type1.description == description
      end
    end

    def available_matter_types
      @config.matter_type_code_combinations
    end

    def initialize
      @config = ConfigBuilder.new(
        matter_type1_codes: @@matter_type1_codes,
        matter_type2_codes: @@matter_type2_codes,
        matter_type_code_combinations: @@matter_type_code_combinations,
        standard_fees: @@standard_fees,
        additional_payments: @@additional_payments,
        additional_payment_fees: @@additional_payment_fees,
        additional_payment_combinations: @@additional_payment_combinations,
        # claim_types: @@claim_types,
        # claim_types_additional_payments: @@claim_types_additional_payments,
      )
    end

    def max_profit_cost
      Constants::MAX_PROFIT_COST
    end
  end
end
