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
