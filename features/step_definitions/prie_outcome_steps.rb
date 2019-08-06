Given('user bulk loaded a file with PRIE outcomes') do
  file = :'prie-bulkload-file.csv'
  steps %{
    Given user is on CWA Navigation page
    And user deleted any existing outcomes for the test firm
    When user bulk loads "#{file}" for the test firm
    Then user should see the outcome results page
    And user confirms the submission
  } unless $bulk_loaded_flag == file
  $bulk_loaded_flag ||= file
end

Given('user deleted any existing outcomes for the test firm') do
  navigator = NavigatorPage.new
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.submission_list.click

  submission_list_page = SubmissionListPage.new
  submission_list_page.firm_name.set(CWAProvider.firm_name)
  submission_list_page.search_button.click

  submission_list_page.wait_until_submissions_visible(wait: 10)
  existing_submission = submission_list_page.submissions.find do |submission|
    submission.schedule_submission_reference.text ==
      CWAProvider.crime_lower_submission.reference
  end

  next unless existing_submission

  existing_submission.update_button.click

  @submission_details_page = SubmissionDetailsPage.new
  expect(@submission_details_page).to be_loaded

  if !@submission_details_page.has_text?(/No results found/)
    STDOUT.print 'Cleaning existing outcomes for test reference...'

    @submission_details_page.select_all.click
    @submission_details_page.delete_button.click
    @submission_details_page.confirm_delete_button.click

    expect(@submission_details_page).to have_text(/No results found/)
    STDOUT.puts ' done.'
  end
end

Given('user is on the pricing outcome details page') do
  with_retry(20, PricingUnavailableError ||= Class.new(StandardError)) do |retried|
    navigator = NavigatorPage.new
    navigator.load
    navigator.roles.cwa_activity_report_manager_internal_role.click
    navigator.content.submission_list.click

    submission_list_page = SubmissionListPage.new
    submission_list_page.firm_name.set(CWAProvider.firm_name)
    submission_list_page.search_button.click

    submission_list_page.wait_until_submissions_visible(wait: 10)
    submission_list_page.submissions.find do |submission|
      submission.schedule_submission_reference.text ==
        CWAProvider.crime_lower_submission.reference
    end.update_button.click

    @submission_details_page = SubmissionDetailsPage.new
    expect(@submission_details_page).to be_loaded
    expect(@submission_details_page).not_to have_text(/No results found./)

    STDOUT.puts "(#{retried}) Checking for pricing completion..." if retried > 0

    price_unavailable = ->(outcome) { outcome.value.text.empty? }
    if @submission_details_page.outcomes.any?(&price_unavailable)
      raise PricingUnavailableError
    end
  end
end

When('user is looking at outcome {string}') do |ufn|
  @current_outcome = @submission_details_page.outcomes.find do |outcome|
    outcome.ufn.text == ufn
  end
end

Then('user should see the outcome priced at {string}') do |price|
  expect(@current_outcome.stage_reached.text).to eq('PRIE')
  expect(@current_outcome.value.text).to eq(price)
end

Then('the Escape Fee flag is {string}') do |flag|
  if flag == 'Y'
    expect(@current_outcome.escape_fee_img['title']).to eq('Escape Fee Case')
  else
    expect(@current_outcome.escape_fee_img['title']).to be_empty
  end
end
