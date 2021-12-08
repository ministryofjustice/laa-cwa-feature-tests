module SubmissionConfig
  class ConfigBuilder
    attr_reader *%i[
      matter_type1_codes
      matter_type2_codes
      matter_type_code_combinations
      standard_fees
      additional_payments
      additional_payment_fees
      additional_payment_combinations
      claim_types
      claim_types_additional_payments
    ]

    def initialize(
      matter_type1_codes:,
      matter_type2_codes:,
      matter_type_code_combinations:,
      standard_fees:,
      additional_payments:,
      additional_payment_fees:,
      additional_payment_combinations:,
      claim_types: nil,
      claim_types_additional_payments: nil)
      build_matter_type1_codes(matter_type1_codes)
      build_matter_type2_codes(matter_type2_codes)
      build_matter_type_code_combinations(matter_type_code_combinations)
      build_standard_fees(standard_fees)
      build_additional_payments(additional_payments)
      build_additional_payment_fees(additional_payment_fees)
      build_additional_payment_combinations(additional_payment_combinations)
      # build_claim_types(claim_types)
      # build_claim_types_additional_payments(claim_types_additional_payments)
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

    def build_standard_fees(standard_fees)
      @standard_fees = standard_fees.map do |matter_type1_code, fee|
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
        additional_payments.map do |name, description|
          Models::AdditionalPayment.new.tap do |object|
            object.name = name
            object.description = description
          end
        end
    end

    def build_additional_payment_fees(additional_payment_fees)
      additional_payment_fees.each do |name, fee|
        @additional_payments.find do |additional_payment|
          additional_payment.name == name
        end.tap do |object|
          object.value = fee
        end
      end
    end

    def build_additional_payment_combinations(additional_payment_combinations)
      additional_payment_combinations.each do |matter_type1_code, additional_payments|
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

    # def build_claim_types(claim_types)
    #   # TODO: implement
    # end

    # def build_claim_types_additional_payments(claim_types_additional_payments)
    #   # TODO: implement
    # end
  end
end
