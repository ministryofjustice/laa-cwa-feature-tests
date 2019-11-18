class BulkLoadSubmissionsSection < SitePrism::Section
  element :bulk_load_update_link, :xpath, '//a[contains(@id, "BulkLoadUpdate")]'
  element :schedule_submission_reference, :xpath, './/td[6]'
end

class BulkLoadResultsPage < SitePrism::Page
  #set_url '/OA_HTML/OA.jsp?page=/oracle/apps/fnd/framework/webui/OAProcessingPG&*'
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/BulkLoadResultsPG&*'

  element :confirm_submission, :xpath, '//*[@id="Yes"]'
  #sections :summary, BulkLoadResultsSummarySection, :xpath, '/html/body/form/span[2]/div[1]/div[3]/div[2]/span[1]/table/tbody/tr[2]/td/table/tbody/tr/following-sibling::tr[position() > 0]'
  #sections :summary, BulkLoadResultsSummarySection, :xpath, '//span[@id="BulkSummaryVO"]/table'
  section :submissions, BulkLoadSubmissionsSection, :xpath, '/html/body/form/span[2]/div[1]/div[5]/span[1]/table[2]/tbody/tr/following-sibling::tr[position() > 0]'
end
