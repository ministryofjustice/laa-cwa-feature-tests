class BulkLoadPage < SitePrism::Page
  set_url '/OA_HTML/RF.jsp?function_id=25785&*'

  element :lookup_firm, :xpath, '//*[@id="FirmName__xc_0"]/a'
  element :bulk_load_file, :xpath, '//*[@id="FileUploadField_oafileUpload"]'
  element :next_button, :xpath, '//*[@id="Next_uixr"]'
  element :errors, :xpath, '/html/body/form/span[2]/div[1]/table/tbody/tr/td/table'
end
