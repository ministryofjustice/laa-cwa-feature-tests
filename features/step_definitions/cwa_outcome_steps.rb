Given("user is on their sumission details page") do
  steps %(
    Given user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
    When user navigates to Submissions page
    Then Submission Search Page displayed
    When user searches for their provider submission
    Then their submission details are displayed
  )
end

When("user adds a valid outcome") do
  click_button 'AddOutcome'
  fill_in 'MatterType', with: 'FAMA:FADV'
  matter_type = page.find_by_id('MatterType')
  matter_type.send_keys :tab
  # Schedule Reference
  page.find_by_id('LinesDFF3', wait: 5)
  fill_in 'LinesDFF3', with: ENV['SUBMISSION_REF']
  # Case ref number
  fill_in 'LinesDFF4', with: 'TestCaseRef'
  # Case Start Date	
  fill_in 'LinesDFF5', with: '01-Jul-2019'
  # Case ID
  fill_in 'LinesDFF6', with: '001'
  # Procurement Area
  fill_in 'LinesDFF7', with: 'PA00002'
  procurement_area = page.find_by_id('LinesDFF7')
  procurement_area.send_keys :tab
  # Access Point
  fill_in 'LinesDFF8', with: 'AP00000'
  # Client Forename
  fill_in 'LinesDFF10', with: 'Test'
  # Client Surname
  fill_in 'LinesDFF11', with: 'Person'
  # Client DOB
  fill_in 'LinesDFF12', with: '01-May-1980'
  # UCN
  page.find_by_id 'LinesDFF13'  
  fill_in 'LinesDFF13', with: '01051980/T/PERS'
  # Postal application accepted
  page.select 'N', from: 'LinesDFF14'
  # Gender
  page.select 'Male', from: 'LinesDFF15'
  # Ethnicity
  page.select '00-Other', from: 'LinesDFF16'
  # Disability
  page.select 'NCD-Not Considered Disabled', from: 'LinesDFF17'
  # Postcode
  fill_in 'LinesDFF18', with: 'SW1H 9AJ'
  # Case concluded date
  fill_in 'LinesDFF19', with: '05-Jul-2019'
  # Advice time
  fill_in 'LinesDFF20', with: '0'
  # Travel time
  fill_in 'LinesDFF21', with: '0'
  # Waiting Time
  fill_in 'LinesDFF22', with: '0'
  # Profit costs excluding VAT
  fill_in 'LinesDFF23', with: '100.00'
  # Disbursements excluding VAT
  fill_in 'LinesDFF24', with: '0'
  # Counsel costs excluding VAT
  fill_in 'LinesDFF25', with: '0'
  # Disbursements VAT amount
  fill_in 'LinesDFF26', with: '0'
  # Profit and Counsel VAT Indicator
  page.select 'No', from: 'LinesDFF27'
  # London Rate
  page.select 'No', from: 'LinesDFF28'
  # Travel and Waiting costs excluding VAT
  fill_in 'LinesDFF29', with: '0'
  # Value of Costs/Damages awarded
  fill_in 'LinesDFF30', with: '0'
  # Local authority number
  fill_in 'LinesDFF31', with: '1234'
  # Client Type
  page.select 'P-Parent', from: 'LinesDFF32'
  # Stage Reached
  # Outcome for client
  page.select 'FF-Settlement with no benefit for the client', from: 'LinesDFF34'
  # Case stage level
  page.select 'FPL01-Priv', from: 'LinesDFF35'
  # Exemption Criteria Satisfied
  page.select 'DV001', from: 'LinesDFF36'
  # Exceptional case funding Ref
  # Transfer date
  click_button 'Apply_uixr'
end

Then('the outcome saves sucessfully') do
  expect(page).to_not have_content('Error')
  expect(page).to_not have_content('Warning')
  expect(page).to have_content('010719/001')
end
