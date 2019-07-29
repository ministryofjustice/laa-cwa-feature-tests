module Helpers
  FIXTURES_DIR = './features/support/fixtures/'.freeze
  private_constant :FIXTURES_DIR

  def load_fixture(file_name)
    File.expand_path(FIXTURES_DIR + file_name)
  end

  def within_popup(original_page, trigger)
    return unless block_given?

    popup_window = window_opened_by { trigger.call }
    original_window = original_page.current_window
    within_window(popup_window) { yield }
    switch_to_window(original_window)
  end

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

  def table_to_hash_array(table)
    underscorize = ->(string) do
      [' ', '/'].reduce(string) do |acc, char|
        acc.tr(char, '_')
      end.downcase.to_sym
    end

    headers = table.headers.map(&underscorize)
    table.rows.map do |row|
      headers.zip(row).to_h
    end
  end
end

World(Helpers)
