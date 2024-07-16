class SubmissionHeaderSection < SitePrism::Section
    set_default_search_arguments '#SubmissionHeaderRN'

    element :firm_name, :xpath, '//span[@id="FirmName"]'
    element :account_number, :xpath, '//span[@id="LscAccountNumber"]'
    element :office, :xpath, '//span[@id="Office"]'
    element :submission_period, :xpath, '//span[@id="SubmissionPeriod"]' 
    element :schedule_submission_reference, :xpath, '//span[@id="Schedule"]' 
    element :submission_type, :xpath, '//span[@id="AreaOfLaw"]' 
end