module Helpers
  module Testing
    def with_delay(wait = 1)
      return unless block_given?

      sleep(wait) && yield
    end

    def with_retry(times, exception)
      return unless block_given?

      retried ||= 0
      with_delay { yield(retried) }
    rescue exception
      raise if retried >= times

      retried += 1
      retry
    end
  end
end
