class OfficeSearchPage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?region=/xxlsc/oracle/apps/xxlsc/am/lov/webui/OfficeSearchRN&*'

  element :frame, :xpath, '/html/frameset/frame'
  element :search_term, :xpath, '//*[@id="_LOVResFrm"]/div[1]/input'
  element :search_button, :xpath, '/html/body/span/div[1]/form/div[1]/button'
  element :first_quick_select, :xpath, '/html/body/span/div[1]/form/div[2]/span[2]/table[2]/tbody/tr[2]/td[2]/a'
end
