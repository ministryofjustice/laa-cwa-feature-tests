class OfficeSearchPage < SitePrism::Page
  element :frame, :xpath, '/html/frameset/frame'
  element :search_by, :xpath, '//*[@id="categoryChoice"]'
  element :search_term, :xpath, '/html/body/span/div[1]/form/div[1]/input'
  element :account_number, :xpath, '/html/body/span/div[1]/form/div[1]/input'
  element :search_button, :xpath, '/html/body/span/div[1]/form/div[1]/button'
  element :first_quick_select, :xpath, '//*[@id="OfficeSearchTable"]/table[2]/tbody/tr[2]/td[2]/a'
end
