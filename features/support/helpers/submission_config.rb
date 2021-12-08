require_relative './../../../lib/submission_config'

module Helpers
  module SubmissionConfig
    def self.by_category_of_law(name)
      ::SubmissionConfig.by_category_of_law(name)
    end
  end
end
