require_relative './refinements/string_refinement'

module Helpers
  using StringRefinement

  FIXTURES_DIR = './features/support/fixtures/bulkload/'.freeze
  private_constant :FIXTURES_DIR

  def load_submission(category_of_law)
    method_name = "#{category_of_law.underscorize}_submission"
    CWAProvider.public_send(method_name.to_sym)
  end

  def bulkload_file(category_of_law, outcome_type)
    folder_name = category_of_law.underscorize
    file_name = outcome_type.underscorize

    "#{folder_name}/#{file_name}.csv"
  end

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
    headers = table.headers.map(&:underscorize).map(&:to_sym)
    table.rows.map do |row|
      headers.zip(row).to_h
    end
  end
end

World(Helpers)
