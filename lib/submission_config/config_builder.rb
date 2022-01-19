module SubmissionConfig
  class ConfigBuilder
    attr_reader *%i[
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

    def initialize(
      matter_type1_codes:,
      matter_type2_codes:,
      matter_type_code_combinations:,
      standard_fee:,
      standard_fees:,
      additional_payments:,
      additional_payment_fees:,
      additional_payment_combinations:,
      escape_fee_threshold_formula:,
      max_price_cap:)
      build_matter_type1_codes(matter_type1_codes)
      build_matter_type2_codes(matter_type2_codes)
      build_matter_type_code_combinations(matter_type_code_combinations)
      build_standard_fee(standard_fee)
      build_standard_fees(standard_fees)
      build_additional_payments(additional_payments)
      build_additional_payment_fees(additional_payment_fees)
      build_additional_payment_combinations(additional_payment_combinations)
      build_escape_fee_threshold(escape_fee_threshold_formula)
      build_max_price_cap(max_price_cap)
    end

    def build_matter_type1_codes(matter_type1_codes)
      @matter_type1_codes =
        matter_type1_codes.map do |code, description|
          Models::MatterType1.new.tap do |object|
            object.name = code.to_s
            object.description = description
          end
        end
    end

    def build_matter_type2_codes(matter_type2_codes)
      @matter_type2_codes =
        matter_type2_codes.map do |code, description|
          Models::MatterType2.new.tap do |object|
            object.name = code.to_s
            object.description = description
          end
        end
    end

    def build_matter_type_code_combinations(matter_type_code_combinations)
      @matter_type_code_combinations =
        matter_type_code_combinations.flat_map do |matter_type1_code, matter_type2_codes|
          matter_type1_object =
          @matter_type1_codes.find do |code|
            code.name == matter_type1_code.to_s
          end

          matter_type2_codes.map do |matter_type2_code|
            Models::MatterType.new.tap do |object|
              matter_type2_object =
                @matter_type2_codes.find do |code|
                  code.name == matter_type2_code.to_s
                end

              object.matter_type1 = matter_type1_object
              object.matter_type2 = matter_type2_object
            end
          end
        end
    end

    def build_standard_fee(standard_fee)
      if standard_fee
        @standard_fee = Models::StandardFee.new
        @standard_fee.value = standard_fee
      end
    end

    def build_standard_fees(standard_fees)
      @standard_fees = standard_fees&.map do |matter_type1_code, fee|
        Models::StandardFee.new.tap do |standard_fee_object|
          matter_type1 =
            @matter_type1_codes.find do |code|
              code.name == matter_type1_code.to_s
            end
          standard_fee_object.description = matter_type1.description
          standard_fee_object.value = fee
          matter_type1.tap do |matter_type1_object|
            matter_type1_object.standard_fee = standard_fee_object
          end
        end
      end
    end

    def build_additional_payments(additional_payments)
      @additional_payments =
        additional_payments&.map do |name, description|
          Models::AdditionalPayment.new.tap do |object|
            object.name = name
            object.description = description
          end
        end
    end

    def build_additional_payment_fees(additional_payment_fees)
      additional_payment_fees&.each do |name, fee|
        @additional_payments.find do |additional_payment|
          additional_payment.name == name
        end.tap do |object|
          object.value = fee
        end
      end
    end

    def build_additional_payment_combinations(additional_payment_combinations)
      additional_payment_combinations&.each do |matter_type1_code, additional_payments|
        @matter_type1_codes.find do |code|
          code.name == matter_type1_code.to_s
        end.tap do |matter_type1_object|
          additional_payments.each do |name|
            matter_type1_object.additional_payments ||= []
            matter_type1_object.additional_payments <<
              @additional_payments.find do |additional_payment|
                additional_payment.name == name
              end
          end
        end
      end
    end

    ESCAPE_FEE_THRESHOLD_FORMULA_REGEX = /^(?<base>standard_fee|\d+(?:\.?\d+)?)(?:\s\*\s(?<multiplier>\d))?(?:\s\+\s(?<addend>\d+(?:\.?\d+)?))?(?:\s\-\s(?<subtrahend>\d+(?:\.?\d+)?))?$/
    private_constant :ESCAPE_FEE_THRESHOLD_FORMULA_REGEX

    def build_escape_fee_threshold(escape_fee_threshold_formula)
      @escape_fee_threshold_formula = escape_fee_threshold_formula
      base, multiplier, addend, subtrahend =
        escape_fee_threshold_formula
          .match(ESCAPE_FEE_THRESHOLD_FORMULA_REGEX)
          .captures

      @matter_type1_codes&.each do |code|
        if base
          if base == 'standard_fee'
            fee = code.standard_fee || @standard_fee
            next unless fee
            code.escape_fee_threshold = fee.value
          else
            code.escape_fee_threshold = base.to_f
          end
        end

        if multiplier
          code.escape_fee_threshold *= multiplier.to_f
        end

        if addend
          code.escape_fee_threshold += addend.to_f
        end

        if subtrahend
          code.escape_fee_threshold -= subtrahend.to_f
        end
      end
    end

    def build_max_price_cap(max_price_cap)
      @max_price_cap = max_price_cap
    end
  end
end
