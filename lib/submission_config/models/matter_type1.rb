module SubmissionConfig
  module Models
    class MatterType1 < ClaimCode
      attr_accessor :standard_fee, :additional_payments, :escape_fee_threshold

      def initialize
        @partial = true
      end
    end
  end
end
