Given('user is on their legal help submission details page') do
  CWAProvider.area_of_law = 'LEGAL HELP'
  steps %(
    Given a test firm user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
    When user navigates to Submissions page
    Then Submission Search Page displayed
    When user searches for their submission
    Then their submission details are displayed
  )
end

Given('user is on their crime lower submission details page') do
  CWAProvider.area_of_law = 'CRIME LOWER'
  steps %(
    Given a test firm user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
    When user navigates to Submissions page
    Then Submission Search Page displayed
    When user searches for their submission
    Then their submission details are displayed
  )
end

When('user adds a valid outcome') do
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: 'FAMA:FADV',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: '01-Jul-2019',
    case_id: '001',
    procurement_area: 'PA00002',
    access_point: 'AP00000',
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '05-Jul-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    london_rate: 'No',
    travel_waiting_costs: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_code: 'FF-Settlement with no benefit for the client',
    case_stage_level: 'FPL01-Priv',
    exemption_criteria_satisfied: 'DV001'
  }
  page.add_outcome(values)
end

When('user adds a invalid outcome') do
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: 'FAMA:FADV',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: '01-Jun-2019',
    case_id: '002',
    procurement_area: 'PA00002',
    access_point: 'AP00000',
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '05-Jun-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    london_rate: 'No',
    travel_waiting_costs: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_code: 'FF-Settlement with no benefit for the client',
    case_stage_level: 'FPL01-Priv',
    exemption_criteria_satisfied: 'DV001'
  }
  page.add_outcome(values)
end

When('user adds a valid outcome for Discrimination') do
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: 'QPRO:QAGE',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: '01-Sep-2019',
    case_id: '099',
    procurement_area: 'PA00180',
    access_point: 'AP00000',
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '01-Sep-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    tolerance_indicator: 'No',
    travel_waiting_costs: '0',
    stage_reached: 'QA-First meeting',
    outcome_code: 'QM-Matter concluded otherwise',
    exemption_criteria_satisfied: nil,
    exceptional_case_funding_reference: nil,
    transfer_date: nil
  }
  page.add_outcome(values)
end

When('user adds an outcome with {string}, {string}, {string} and {string}') do |case_id, case_start_date, procurement_area, access_point|
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: 'FAMA:FADV',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: procurement_area,
    access_point: access_point,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '05-Jul-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    london_rate: 'No',
    travel_waiting_costs: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_code: 'FF-Settlement with no benefit for the client',
    case_stage_level: 'FPL01-Priv',
    exemption_criteria_satisfied: 'DV001'
  }
  page.add_outcome(values)
end

Then(/^the outcome saves successfully(?: with \"(.*)\")?$/) do |ufn|
  page = SubmissionDetailsPage.new
  expect(page).to_not have_content('Error')
  expect(page).to have_content(ufn) if ufn
end

Then('the outcome does not save and gives an error') do
  page = AddOutcomePage.new
  expect(page).to have_content('Error')
  expect(page).to have_content('The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded.')
end

When("user adds outcomes for Immigration with fields like this:") do |table|
  sr = CWAProvider.submission.schedule_ref
  outcome_data = table.hashes
  @submissions_saved = outcome_data.size
  outcome_data.each do |test_data_row|
    submission_list_page = SubmissionListPage.new
    submission_list_page.add_outcome_button.click
    test_data_row["schedule_ref"] = sr
    field_values = Helpers::ScreenFieldBuilder.get_fields(['legal_help', 'immigration'])
    field_values.update(test_data_row)
    page = AddOutcomePage.new
    page.add_outcome(field_values.transform_keys(&:to_sym))
  end
end

When("user adds outcomes for Crime Lower Criminal Proceedings with fields like this:") do |table|
  sr = CWAProvider.submission.schedule_ref
  outcome_data = table.hashes
  @submissions_saved = outcome_data.size
  outcome_data.each do |test_data_row|
    submission_list_page = SubmissionListPage.new
    submission_list_page.add_outcome_button.click
    test_data_row["schedule_ref"] = sr
    field_values = Helpers::ScreenFieldBuilder.get_fields(['crime_lower', 'criminal_proceedings', test_data_row['matter_type']])
    field_values.update(test_data_row)
    page = AddOutcomePage.new
    page.add_outcome(field_values.transform_keys(&:to_sym))
  end
end

Then("{int} outcomes save successfully") do |expected|
  expect(@submissions_saved).to eq(expected)
end

When ('user adds an outcome for Immigration with {string}, {string}, {string}, {string}, {string}, {string} and {string}') \
do |case_id, matter_type, exemption_criteria_satisfied, ecf_ref, case_start_date, pa, ap|
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click
  page = AddOutcomePage.new
  values = {
    matter_type: matter_type,
    claim_type: 'Completed Matter Claim',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: pa,
    access_point: ap,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-Nov-2015',
    ucn: '01112015/T/PERS',
    postal_appl_accp: 'N',
    ho_ucn: 'A9999999',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '01-Nov-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    legacy_case: 'No',
    ho_interview: '0',
    ait_hearing_centre: '16-Other',
    travel_waiting_costs: '0',
    adjourned_hearing_fee: '0',
    travel_costs: '0',
    jr_form_filling: '0',
    cmrh_oral: '0',
    cmrh_telephone: '0',
    substantive_hearing: 'No',
    stage_reached: '',
    outcome_code: 'IX',
    exemption_criteria_satisfied: exemption_criteria_satisfied,
    exceptional_case_funding_reference: ecf_ref
  }
  page.add_outcome(values)
end

When ('user adds an outcome for Family with {string}, {string}, {string}, {string}, {string}, {string} and {string}') \
do |case_id, matter_type, exemption_criteria_satisfied, ecf_ref, case_start_date, pa, ap|
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click
  page = AddOutcomePage.new
  values = {
    matter_type: matter_type,
    claim_type: 'Completed Matter Claim',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: pa,
    access_point: ap,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '01-Nov-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    london_rate: 'No',
    travel_waiting_costs: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_code: 'FF-Settlement with no benefit for the client',
    case_stage_level: 'FPL10-Div',
    exemption_criteria_satisfied: exemption_criteria_satisfied,
    exceptional_case_funding_reference: ecf_ref
  }
  page.add_outcome(values)
end

When ('user adds an outcome for Medical Negligence with {string}, {string}, {string}, {string}, {string}, {string} and {string}') \
do |case_id, matter_type, exemption_criteria_satisfied, ecf_ref, case_start_date, pa, ap|
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click
  page = AddOutcomePage.new
  values = {
    matter_type: matter_type,
    claim_type: 'Completed Matter Claim',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: pa,
    access_point: ap,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '01-Nov-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    tolerance_indicator: 'No',
    travel_waiting_costs: '0',
    outcome_code: 'NA-Client receives damages',
    exemption_criteria_satisfied: exemption_criteria_satisfied,
    exceptional_case_funding_reference: ecf_ref
  }
  page.add_outcome(values)
end

When ('user adds an outcome for Education with {string}, {string}, {string}, {string}, {string} and {string}') \
do |matter_type, ecf_ref, case_start_date, pa, ap, case_id |
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: matter_type,
    claim_type: 'Completed Matter Claim',
    schedule_ref: CWAProvider.legal_help_submission.schedule_ref,
    case_ref_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: pa,
    access_point: ap,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_appl_accp: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_post_code: 'SW1H 9AJ',
    work_concluded_date: '02-Sep-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_cost: '100.00',
    disbursements_amount: '0',
    counsel_cost: '0',
    disbursements_vat: '0',
    vat_indicator: 'No',
    tolerance_indicator: 'No',
    travel_waiting_costs: '0',
    stage_reached: 'EA-First meeting',
    outcome_code: 'EA-Client receives damages',
    exemption_criteria_satisfied: '',
    exceptional_case_funding_reference: ecf_ref,
    transfer_date: ''
  }

  page.add_outcome(values)
end

Then("the outcome does not save and gives an error containing:") do |string|
  page = AddOutcomePage.new
  expect(page).to have_content('Error')
  expect(page).to have_content(string)
end

Then("the outcome does not save and the error message {string} appears") do |error_message|
  page = AddOutcomePage.new
  expect(page).to have_errors
  expect(page.errors.text).to include(error_message)
end

Then("the outcome does not save and this popup error appears:") do |string|
  expect(page.driver.browser.switch_to.alert.text).to have_content(string)
  page.driver.browser.switch_to.alert.dismiss
end
