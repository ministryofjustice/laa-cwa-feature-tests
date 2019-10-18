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
  submission_list_page.firm_name.set(CWAProvider.firm_name)
  submission_list_page.search_button.click
  expect(submission_list_page).to have_content('Submission Search')
end

Given('user is on the sumission search page') do
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

When('user searches for their legal help submission') do
  submission_list_page = SubmissionListPage.new
  submission_list_page.account_number.set(CWAProvider.account_number)
  submission_list_page.search_button.click

  submission_list_page.wait_until_submissions_visible(wait: 10)
  existing_submission = submission_list_page.submissions.find do |submission|
    submission.schedule_submission_reference.text ==
      load_submission('LEGAL HELP').reference
  end

  existing_submission.update_button.click
end

Then('their submission details are displayed') do
  expect(page.title).to eq('Submission Details')
end
