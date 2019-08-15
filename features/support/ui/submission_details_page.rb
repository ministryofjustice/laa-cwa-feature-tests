class SubmissionDetailsOutcomeSection < SitePrism::Section
  element :ufn, :xpath, './/td[2]'
  element :stage_reached, :xpath, './/td[6]'
  element :value, :xpath, './/td[9]'
  element :escape_fee_img, :xpath, './/td[10]/img'
end

class SubmissionDetailsPage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/SubmissionListPG&*'

  sections :outcomes, SubmissionDetailsOutcomeSection, :xpath, '/html/body/form/span[2]/div[1]/div[3]/span[1]/table[2]/tbody/tr/following-sibling::tr[position() > 0]'
  element :select_all, :xpath, '//*[@id="SubmissionTable"]/table[1]/tbody/tr[3]/td/table/tbody/tr/td/a[1]'
  element :delete_button, :xpath, '//*[@id="Delete"]'
  element :confirm_delete_button, :xpath, '//*[@id="Yes"]'
  element :return_to_submission_list, :xpath, '//*[@id="ReturnToSubmissionList"]'
end
