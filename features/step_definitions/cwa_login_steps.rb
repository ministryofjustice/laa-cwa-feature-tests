When('user clicks on CWA link') do
  new_window = window_opened_by { click_link('Contracted Work and Administration (CWA)') }
  within_window(new_window) do
    page.has_xpath?('//*[@id="responsibilityRN"]/table/tbody')
  end
end

# Then('CWA application page is displayed') do
#   cwa_window = switch_to_window { page.title == 'Oracle Applications Home Page' }
#   within_window(cwa_window) do
#     expect(page).to have_content('Navigator')
#   end
# end

Then('CWA application page is displayed') do
  cwa_window = nil

  puts "Looking for window with title 'Oracle Applications Home Page'..."

  # Retry logic to wait for the window to appear
  5.times do |attempt|
    puts "Attempt #{attempt + 1}: Checking open windows..."
    windows.each do |w|
      within_window(w) do
        title = page.title
        puts "Found window with title: '#{title}'"
        if title == 'Oracle Applications Home Page'
          cwa_window = w
          break
        end
      end
    end
    break if cwa_window
    sleep 1
  end

  unless cwa_window
    puts "ERROR: Could not find a window with the expected title."
    save_screenshot("/screenshots/cwa_failure_#{Time.now.to_i}.png")
    raise Capybara::WindowError, "CWA window not found after retries"
  end

  within_window(cwa_window) do
    expect(page).to have_content('Navigator')
  end
end


Given('user is logged into cwa') do
    case ENV['TEST_ENV']
    when "devmp", "stg"
      direct_login
    when "tst", "dev", "uat"
      portal_login
    end
end