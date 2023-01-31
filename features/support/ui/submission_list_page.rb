class SubmissionListSection < SitePrism::Section
  element :schedule_submission_reference, :xpath, './/td[6]'
  element :update_button, :id, 'N3:Update:0'
end

class SubmissionListPage < SitePrism::Page
  set_url '/OA_HTML/RF.jsp?function_id=25788&*'

  element :firm_name, :xpath, '//*[@id="SearchFirmName"]'
  element :account_number, :xpath, '//*[@id="SearchLscAccountNo"]'
  element :search_button, :link_or_button, 'Go'
  element :add_outcome_button, :id, 'AddOutcome'
  element :area_of_law_search, "select[id='AreaOfLawSearch']"

  sections :submissions, SubmissionListSection, :xpath, '//*[@id="SubmissionHeadersTab"]/table[2]/tbody/tr[1]/following-sibling::tr[position() > 0]'
end
