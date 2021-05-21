module Helpers
  module Page
    def within_popup(original_page, trigger)
      return unless block_given?

      popup_window = window_opened_by { trigger.call }
      within_window(popup_window) { yield }
    end
  end
end
