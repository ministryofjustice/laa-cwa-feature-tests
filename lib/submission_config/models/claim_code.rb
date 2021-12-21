module SubmissionConfig
  module Models
    class ClaimCode
      attr_accessor :name, :description

      def initialize
        @partial = false
      end

      private

      attr_reader :partial
    end
  end
end
