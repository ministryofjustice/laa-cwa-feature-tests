class RolesSection < SitePrism::Section
  element :cwa_activity_report_manager_internal_role, :xpath, '//a[text()="CWA Activity Reporter Manager (Internal) role"]'
end

class NavigatorContent < SitePrism::Section
  element :bulk_load, :xpath, '//a[text()="Bulk Load"]'
  element :submission_list, :xpath, '//a[text()="Submission List"]'
end

class NavigatorPage < SitePrism::Page

  case ENV['TEST_ENV']
    when "devmp", "stg"
      set_url "#{CWAProvider.url[0..-28]}/OA_HTML/OA.jsp?OAFunc=OAHOMEPAGE"   # 0..-28 removes the last 28 characters from the string
    when "tst", "dev", "uat"
      set_url "#{CWAProvider.url}/OA_HTML/OA.jsp?OAFunc=OAHOMEPAGE"
  end

  section :roles, RolesSection, :xpath, '//*[@id="responsibilityRN"]/table/tbody/tr/td[1]/table/tbody'
  section :content, NavigatorContent, :xpath, '//*[@id="responsibilityRN"]/table/tbody/tr/td[2]/table/tbody'
end