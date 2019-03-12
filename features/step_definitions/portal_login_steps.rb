When('I visit the portal url') do
  visit('http://portal.tst.legalservices.gov.uk')
end

Then('I see the portal login page') do
  expect(page).to have_content('To sign in to the Online Portal')
end

Given('user is on the portal login page') do
  visit('http://portal.tst.legalservices.gov.uk')
  expect(page).to have_content('To sign in to the Online Portal')
end

When('user Logs in') do
  fill_in 'username', with: ENV['USERNAME']
  fill_in 'password', with: ENV['PASSWORD']
  click_button 'Log in'
end

Then('Portal application page is displayed') do
  expect(page).to have_content('Welcome to the Online Portal.')
end

Given('user is on the portal home page') do
  steps %(
    Given user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
  )
end
