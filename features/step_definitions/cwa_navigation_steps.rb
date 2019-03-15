Given('user is on CWA Navigation page') do
  steps %(
    Given user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
  )
end

When('user navigates to Submissions page') do
  click_link('CWA Activity Reporter Manager (Internal) role')
  click_link('Submission List')
end

Then('Submission Search Page displayed') do
  expect(page).to have_content('Submission Search')
end

Given('user is on the sumission search page') do
  steps %(
    Given user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
    When user navigates to Submissions page
    Then Submission Search Page displayed
  )
end

When('user searches for their provider submission') do
  fill_in 'SearchFirmName', with: CWAEnv.firmname
  fill_in 'SearchLscAccountNo', with: CWAEnv.account_number
  fill_in 'SearchOfficeName', with: CWAEnv.firmname
  page.select CWAEnv.area_of_law, from: 'AreaOfLawSearch'
  fill_in 'SearchSubmissionPeriod', with: CWAEnv.submission_period
  click_button 'Go'
  expect(page).to have_content(CWAEnv.submission_ref)
  click_link 'N3:Update:0'
end

Then('their submission details are displayed') do
  expect(page.title).to eq('Submission Details')
end
