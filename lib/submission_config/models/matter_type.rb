module SubmissionConfig
  module Models
    class MatterType < ClaimCode
      attr_accessor :matter_type1, :matter_type2

      def initialize
        @partial = false
      end

      def name
        @name = "#{@matter_type1.name}:#{@matter_type2.name}"
      end

      def description
        @description = "#{@matter_type1.description}: #{@matter_type2.description}"
      end

      def standard_fee
        @matter_type1.standard_fee
      end

      def additional_payments
        @matter_type1.additional_payments
      end
    end
  end
end
