class BulkLoadPage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/BulkLoadPG&*'

  element :lookup_firm, :xpath, '//*[@id="FirmName__xc_0"]/a'
  element :firm_name, :css, '#FirmName'
  element :bulk_load_file, :xpath, '//*[@id="FileUploadField_oafileUpload"]'
  element :next_button, :css, '#Next_uixr'
  element :confirm_submission, :xpath, '//*[@id="Yes"]'
  element :errors, :xpath, '/html/body/form/span[2]/div[1]/table/tbody/tr/td/table'
end
