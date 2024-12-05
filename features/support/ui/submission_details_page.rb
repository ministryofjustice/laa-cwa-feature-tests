require_relative 'sections/submission_button_section.rb'

class SubmissionDetailsOutcomeSection < SitePrism::Section
  element :select_checkbox, :xpath, "*/input[@title = 'Select']"
  element :ufn, :xpath, ".//*[contains(@title,'UFN')]"
  element :case_reference, :xpath, ".//*[contains(@title,'Case Reference')]"
  element :stage_reached, :xpath, ".//*[contains(@title,'Stage Reached')]"
  element :value, :xpath, ".//*[contains(@title,'Value')]"
  element :escape_fee_img, :xpath, ".//*[contains(@title,'Escape Fee Case')]"
end

class SubmissionDetailsPage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/SubmissionListPG&*'

  sections :outcomes, SubmissionDetailsOutcomeSection, :xpath, '//*[@id="SubmissionTable"]/table[2]/tbody/tr[1]/following-sibling::tr[position() > 0]'
  element :select_all_link, 'a[href*="tableSelectAll"]'
  element :delete_button, :xpath, '//*[@id="Delete"]'
  element :confirm_delete_button, :xpath, '//*[@id="Yes"]'
  element :return_to_submission_list, :xpath, '//*[@id="ReturnToSubmissionList"]'

  def select_all
    outcomes.map { |outcome| outcome.select_checkbox.click }
  end

  section :submission_button_section, SubmissionButtonSection

  element :next_button, :xpath, '//*[@id="PageButtons"]/tbody/tr[1]/td[10]/button'
end
