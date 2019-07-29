class BulkLoadPage < SitePrism::Page
  set_url '/OA_HTML/RF.jsp?function_id=25785&*'

  element :lookup_firm, :xpath, '/html/body/form/span[2]/div[1]/div[3]/div[2]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[3]/span/a'
  element :bulk_load_file, :xpath, '//*[@id="FileUploadField_oafileUpload"]'
  element :next_button, :xpath, '//*[@id="Next_uixr"]'
  element :errors, :xpath, '/html/body/form/span[2]/div[1]/table/tbody/tr/td/table'
end
