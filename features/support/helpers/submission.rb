module Helpers
  module Submission
    def load_submission(category_of_law)
      method_name = "#{category_of_law.underscorize}_submission"
      CWAProvider.public_send(method_name.to_sym)
    end
  end
end
