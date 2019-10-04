Given('user bulk loads monthly statement with {string} - {string} outcomes') do |category_of_law, outcome_type|
  file = bulkload_file(category_of_law, outcome_type)
  steps %{
    Given a test firm user is logged in CWA
    And user deleted any existing "#{category_of_law}" outcomes for the test firm
    When user bulk loads "#{file}" for the test firm
    Then user should see the outcome results page
    And user confirms the submission
  } unless $bulk_loaded_flag == file
  $bulk_loaded_flag = file
end

Given('user deleted any existing {string} outcomes for the test firm') do |category_of_law|
  navigator = NavigatorPage.new
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.submission_list.click

  submission_list_page = SubmissionListPage.new
  submission_list_page.firm_name.set(CWAProvider.firm_name)
  submission_list_page.search_button.click

  submission_list_page.wait_until_submissions_visible(wait: 10)
  existing_submission = submission_list_page.submissions.find do |submission|
    submission.schedule_submission_reference.text ==
      load_submission(category_of_law).reference
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

Given('user is on the {string} pricing outcome details page') do |category_of_law|
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
        load_submission(category_of_law).reference
    end.update_button.click

    @submission_details_page = SubmissionDetailsPage.new
    expect(@submission_details_page).to be_loaded
    expect(@submission_details_page).not_to have_text(/No results found./)

    STDOUT.puts "(#{retried}) Checking for pricing completion..." if retried > 0

    price_unavailable = ->(outcome) { outcome.has_no_value?(wait: 0) }
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

Then("user should see the outcome with one of these stage reached codes:") do |table|
  @stage_reached_codes = table.raw
  @stage_reached_codes.include?(@current_outcome.stage_reached.text)
end

Then('user should see the outcome with stage reached {string}') do |code|
  expect(@current_outcome.stage_reached.text).to eq(code)
end

Then('user should see the outcome priced at {string}') do |price|
  expect(@current_outcome.value.text).to eq(price)
end

Then('the Escape Fee flag is {string}') do |flag|
  expect(@current_outcome.has_escape_fee_img?(wait: 0)).to eq(flag == 'Y' && true || false)
end
