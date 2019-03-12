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
