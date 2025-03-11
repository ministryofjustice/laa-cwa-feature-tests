Given('a test firm user is on the direct login page') do
    visit(PortalEnv.url)
end
  
When('user Logs in directly') do
    expect(page).to have_title("Login", wait:20)
    fill_in 'username', with: PortalEnv.cwa_provider_user
    fill_in 'password', with: PortalEnv.cwa_provider_user_password
   # page.evaluate_script("document.forms[0].submit()")
    find('img[title="Login"][alt="Login"]', wait: 10).click
end

def direct_login
    steps %(
        Given a test firm user is on the direct login page
        When user Logs in directly
    )
end

