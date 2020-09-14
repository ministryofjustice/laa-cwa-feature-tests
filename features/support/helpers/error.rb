module Helpers
  module Error
    def error_message(code_or_message)
      CWAProvider.errors.find do |error|
        error.code == code_or_message
      end&.message || code_or_message
    end
  end
end
