module Helpers
  module Page
    def within_popup(original_page, trigger)
      return unless block_given?

      popup_window = window_opened_by { trigger.call }
      original_window = original_page.current_window
      within_window(popup_window) { yield }
      switch_to_window(original_window)
    end
  end
end
