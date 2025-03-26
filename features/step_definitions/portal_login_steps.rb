When('I visit the portal url') do
  visit(PortalEnv.url)
end

Then('I see the portal login page') do
  expect(page).to have_content('To sign in to the Online Portal')
end

Given('a test firm user is on the portal login page') do
  visit(PortalEnv.url)
end

When('user Logs in') do
  expect(page).to have_title("LAA Online Portal", wait:20)
  fill_in 'username', with: PortalEnv.cwa_provider_user
  fill_in 'password', with: PortalEnv.cwa_provider_user_password
  click_button 'Log in'
end

Then('Portal application page is displayed') do
  expect(page).to have_content('Welcome to the Online Portal.')
end

Given('user is on the portal home page') do
  steps %(
    Given a test firm user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
  )
end

def portal_login
  steps %(
      Given a test firm user is on the portal login page
      When user Logs in
      Then Portal application page is displayed
      When user clicks on CWA link
      )
end
