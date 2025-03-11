When('user clicks on CWA link') do
  new_window = window_opened_by { click_link('Contracted Work and Administration (CWA)') }
  within_window(new_window) do
    page.has_xpath?('//*[@id="responsibilityRN"]/table/tbody')
  end
end

Then('CWA application page is displayed') do
  cwa_window = switch_to_window { page.title == 'Oracle Applications Home Page' }
  within_window(cwa_window) do
    expect(page).to have_content('Navigator')
  end
end

Given('user is logged into cwa') do
    if ENV['TEST_ENV'] == "devmp" || ENV['TEST_ENV'] == "stg" then
        direct_login
    elsif ENV['TEST_ENV'] == "tst" || ENV['TEST_ENV'] == "dev" || ENV['TEST_ENV'] == "uat" then
        portal_login
    end
end