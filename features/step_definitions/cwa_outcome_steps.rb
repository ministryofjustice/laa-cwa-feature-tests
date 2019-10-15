Given('user is on their submission details page') do
  steps %(
    Given a test firm user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
    When user navigates to Submissions page
    Then Submission Search Page displayed
    When user searches for their legal help submission
    Then their submission details are displayed
  )
end

When('user adds a valid outcome') do
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: 'FAMA:FADV',
    schedule_reference: CWAProvider.legal_help_submission.reference,
    case_reference_number: 'TestCaseRef',
    case_start_date: '01-Jul-2019',
    case_id: '001',
    procurement_area: 'PA00002',
    access_point: 'AP00000',
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_application_accepted: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_postcode: 'SW1H 9AJ',
    case_concluded_date: '05-Jul-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_costs_excluding_vat: '100.00',
    disbursements_excluding_vat: '0',
    counsel_costs_excluding_vat: '0',
    disbursements_vat_amount: '0',
    profit_and_counsel_vat_indicator: 'No',
    london_rate: 'No',
    travel_and_waiting_costs_excluding_vat: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_for_client: 'FF-Settlement with no benefit for the client',
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
    schedule_reference: CWAProvider.legal_help_submission.reference,
    case_reference_number: 'TestCaseRef',
    case_start_date: '01-Jun-2019',
    case_id: '002',
    procurement_area: 'PA00002',
    access_point: 'AP00000',
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_application_accepted: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_postcode: 'SW1H 9AJ',
    case_concluded_date: '05-Jun-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_costs_excluding_vat: '100.00',
    disbursements_excluding_vat: '0',
    counsel_costs_excluding_vat: '0',
    disbursements_vat_amount: '0',
    profit_and_counsel_vat_indicator: 'No',
    london_rate: 'No',
    travel_and_waiting_costs_excluding_vat: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_for_client: 'FF-Settlement with no benefit for the client',
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
    schedule_reference: CWAProvider.legal_help_submission.reference,
    case_reference_number: 'TestCaseRef',
    case_start_date: '01-Sep-2019',
    case_id: '099',
    procurement_area: 'PA00180',
    access_point: 'AP00000',
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_application_accepted: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_postcode: 'SW1H 9AJ',
    case_concluded_date: '01-Sep-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_costs_excluding_vat: '100.00',
    disbursements_excluding_vat: '0',
    counsel_costs_excluding_vat: '0',
    disbursements_vat_amount: '0',
    profit_and_counsel_vat_indicator: 'No',
    tolerance_indicator: 'No',
    travel_and_waiting_costs_excluding_vat: '0',
    stage_reached: 'QA-First meeting',
    outcome_for_client: 'QM-Matter concluded otherwise',
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
    schedule_reference: CWAProvider.legal_help_submission.reference,
    case_reference_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: procurement_area,
    access_point: access_point,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_application_accepted: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_postcode: 'SW1H 9AJ',
    case_concluded_date: '05-Jul-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_costs_excluding_vat: '100.00',
    disbursements_excluding_vat: '0',
    counsel_costs_excluding_vat: '0',
    disbursements_vat_amount: '0',
    profit_and_counsel_vat_indicator: 'No',
    london_rate: 'No',
    travel_and_waiting_costs_excluding_vat: '0',
    value_of_costs_damages_awarded: '0',
    local_authority_number: '1234',
    client_type: 'P-Parent',
    outcome_for_client: 'FF-Settlement with no benefit for the client',
    case_stage_level: 'FPL01-Priv',
    exemption_criteria_satisfied: 'DV001'
  }
  page.add_outcome(values)
end

Then(/^the outcome saves successfully(?: with \"(.*)\")?$/) do |ufn|
  page = SubmissionDetailsPage.new
  expect(page).to_not have_content('Error')
  expect(page).to_not have_content('Warning')
  expect(page).to have_content(ufn) if ufn
end

Then('the outcome does not save and gives an error') do
  page = AddOutcomePage.new
  expect(page).to have_content('Error')
  expect(page).to have_content('The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded.')
end

When ('user adds an outcome for Education with {string}, {string}, {string}, {string}, {string} and {string}') \
do |matter_type, ecf_ref, case_start_date, pa, ap, case_id |
  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click

  page = AddOutcomePage.new
  values = {
    matter_type: matter_type,
    schedule_reference: CWAProvider.legal_help_submission.reference,
    case_reference_number: 'TestCaseRef',
    case_start_date: case_start_date,
    case_id: case_id,
    procurement_area: pa,
    access_point: ap,
    client_forename: 'Test',
    client_surname: 'Person',
    client_date_of_birth: '01-May-1980',
    ucn: '01051980/T/PERS',
    postal_application_accepted: 'N',
    gender: 'Male',
    ethnicity: '00-Other',
    disability: 'NCD-Not Considered Disabled',
    client_postcode: 'SW1H 9AJ',
    case_concluded_date: '02-Sep-2019',
    advice_time: '0',
    travel_time: '0',
    waiting_time: '0',
    profit_costs_excluding_vat: '100.00',
    disbursements_excluding_vat: '0',
    counsel_costs_excluding_vat: '0',
    disbursements_vat_amount: '0',
    profit_and_counsel_vat_indicator: 'No',
    tolerance_indicator: 'No',
    travel_and_waiting_costs_excluding_vat: '0',
    stage_reached: 'EA-First meeting',
    outcome_for_client: 'EA-Client receives damages',
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
