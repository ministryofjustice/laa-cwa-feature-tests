class BulkLoadSummarySection < SitePrism::Section
  element :account_number, :xpath, './/td[2]'
  element :schedule_submission_reference, :xpath, './/td[3]'
  element :total_outcomes, :xpath, './/td[4]'
  element :successful_outcomes, :xpath, './/td[5]'
  element :problem_outcomes, :xpath, './/td[6]'
  element :duplicate_outcomes, :xpath, './/td[7]'
  element :invalid_outcomes_nms, :xpath, './/td[8]'
end

class BulkLoadErrorsSection < SitePrism::Section
  element :matter_type___stage_reached, :xpath, './/td[2]'
  element :ufn, :xpath, './/td[3]'
  element :client_surname, :xpath, './/td[4]'
  element :error_type, :xpath, './/td[5]'
  element :description, :xpath, './/td[6]'
end

class BulkLoadPage < SitePrism::Page
  #set_url '/OA_HTML/RF.jsp?function_id=25785&*'
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/BulkLoadPG&*'

  section :summary, BulkLoadSummarySection, :xpath, '//span[@id="BulkSummaryVO"]/table'
  section :errors, BulkLoadErrorsSection, :xpath, '/html/body/form/span[2]/div[1]/div[3]/div[2]/span[3]/table/tbody/tr[2]/td/table/tbody/tr/following-sibling::tr[position() > 0]'

  element :lookup_firm, :xpath, '//*[@id="FirmName__xc_0"]/a'
  element :bulk_load_file, :xpath, '//*[@id="FileUploadField_oafileUpload"]'
  element :next_button, :xpath, '//*[@id="Next_uixr"]'
  #element :errors, :xpath, '/html/body/form/span[2]/div[1]/table/tbody/tr/td/table'
end
