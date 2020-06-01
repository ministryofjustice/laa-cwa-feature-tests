class BulkLoadResultsSummarySection < SitePrism::Section
  element :account_number, :xpath, './/td[2]'
  element :schedule_submission_reference, :xpath, './/td[3]'
  element :total_outcomes, :xpath, './/td[4]'
  element :successful_outcomes, :xpath, './/td[5]'
  element :problem_outcomes, :xpath, './/td[6]'
  element :duplicate_outcomes, :xpath, './/td[7]'
  element :invalid_outcomes_nms, :xpath, './/td[8]'
end

class BulkLoadResultsErrorsSection < SitePrism::Section
  element :matter_type___stage_reached, :xpath, './/td[2]'
  element :ufn, :xpath, './/td[3]'
  element :client_surname, :xpath, './/td[4]'
  element :error_type, :xpath, './/td[5]'
  element :description, :xpath, './/td[6]'
end

class BulkLoadResultsSubmissionsSection < SitePrism::Section
  element :bulk_load_update_link, :xpath, '//a[contains(@id, "BulkLoadUpdate")]'
  element :schedule_submission_reference, :xpath, './/td[6]'
end

class BulkLoadResultsPage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/oracle/apps/fnd/framework/webui/OAProcessingPG&*'
  sections :summary, BulkLoadResultsSummarySection, :xpath, '//*[@id="BulkSummaryVO"]/table/tbody/tr[2]/td/table/tbody/tr/following-sibling::tr[position() > 0]'
  sections :errors, BulkLoadResultsErrorsSection, :xpath, '//*[@id="BulkLoadErrorsVO"]/table/tbody/tr[2]/td/table/tbody/tr/following-sibling::tr[position() > 0]'
  sections :submissions, BulkLoadResultsSubmissionsSection, :xpath, '/html/body/form/span[2]/div[1]/div[5]/span[1]/table[2]/tbody/tr/following-sibling::tr[position() > 0]'
end
