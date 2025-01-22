Given('a test firm user is logged in CWA') do
  steps %(
    Given a test firm user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
  )
end

When('user navigates to Submissions page') do
  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.submission_list.click
end

Then('Submission Search Page displayed') do
  submission_list_page = SubmissionListPage.new
  puts "Waiting for submissions to be visible"
  submission_list_page.wait_until_submissions_visible(wait: 10)
  puts "Setting account number: #{CWAProvider.submission.account_number}"
  submission_list_page.account_number.set(CWAProvider.submission.account_number)
  
  puts "Waiting for area of law search to be visible"
  submission_list_page.wait_until_area_of_law_search_visible(wait: 10)

  # Debugging ambiguous match by listing all matching elements
  puts "Finding all select elements with id 'AreaOfLawSearch'"
  elements = submission_list_page.all(:xpath, "//select[@id='AreaOfLawSearch']")

  puts "Number of select elements found: #{elements.size}"
  elements.each_with_index do |element, index|
    puts "Element #{index}: id=#{element[:id]}, class=#{element[:class]}, name=#{element[:name]}"
  end

  if elements.size == 1
    puts "Selecting area of law"
    elements.first.select(CWAProvider.submission.area_of_law)
  else
    puts "Ambiguous match: Multiple elements found"
    filename = save_page
    puts "Page saved to #{filename}"
    save_and_open_page
  end

  submission_list_page.area_of_law_search.select(CWAProvider.submission.area_of_law)
  puts "Setting submission period: #{CWAProvider.submission.period}"
  submission_list_page.submission_period.set(CWAProvider.submission.period)

  puts "Clicking search button"
  submission_list_page.search_button.click
  puts "Checking for 'Submission Search' content"
  expect(submission_list_page).to have_content('Submission Search')
end

Given('user is on the submission search page') do
  steps %(
    Given a test firm user is on the portal login page
    When user Logs in
    Then Portal application page is displayed
    When user clicks on CWA link
    Then CWA application page is displayed
    When user navigates to Submissions page
    Then Submission Search Page displayed
  )
end

When('user searches for their submission') do
  submission_list_page = SubmissionListPage.new
  submission_list_page.account_number.set(CWAProvider.submission.account_number)
  submission_list_page.area_of_law_search.set(CWAProvider.area_of_law)
  submission_list_page.submission_period.set(CWAProvider.submission.period)
  submission_list_page.search_button.click

  submission_list_page.wait_until_submissions_visible(wait: 10)
  existing_submission = submission_list_page.submissions.find do |submission|
    submission.schedule_submission_reference.text == CWAProvider.submission.schedule_number
  end
  expect(page).to have_content("Submission Search", wait: 10)
  existing_submission.wait_until_update_button_visible(wait: 5)
  existing_submission.update_button.double_click
end

Then('their submission details are displayed') do
  expect(page).to have_title("Submission Details", wait:20)
end

When('the user navigates to the submission review screen') do
  expect(page.title).to eq("Submission Details")
  submission_details_page = SubmissionDetailsPage.new
  submission_details_page.next_button.double_click
  expect(page).to have_title("Submission Review", wait:20)
  @submission_page = SubmissionReviewPage.new
end

When('the user navigates to the submission summary screen') do
  expect(page.title).to eq("Submission Details").or eq("Submission Review")
  #if page is Submission Details then go to submission review
  if page.title == "Submission Details"
    steps %(
      When the user navigates to the submission review screen
    )
  end
  submission_review_page = SubmissionReviewPage.new
  submission_review_page.next_button.double_click
  expect(page).to have_title("Submission Summary", wait:20)
  @submission_page = SubmissionSummaryPage.new
end