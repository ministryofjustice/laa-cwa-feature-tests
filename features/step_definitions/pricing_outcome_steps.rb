require 'net/http'
require 'json'

Given('user bulk loads monthly statement with {string} - {string} outcomes') do |category_of_law, outcome_type|
  file = bulkload_file(category_of_law, outcome_type)
  step 'a test firm user is logged in CWA'
  steps %{
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

  submission = CWAProvider.submissions.select { |s| s.area_of_law == 'LEGAL HELP' }[1]

  submission_list_page = SubmissionListPage.new
  submission_list_page.account_number.set(submission.account_number)
  submission_list_page.search_button.click

  submission_list_page.wait_until_submissions_visible(wait: 10)
  existing_submission = submission_list_page.submissions.find do |sub|
    sub.schedule_submission_reference.text == submission.schedule_number
  end.update_button.click

  next unless existing_submission

  existing_submission.update_button.click

  @submission_details_page = SubmissionDetailsPage.new
  expect(@submission_details_page).to be_loaded

  if !@submission_details_page.has_text?(/No results found/)
    STDOUT.print 'Cleaning existing outcomes for test reference...'

    @submission_details_page.select_all_link.click
    @submission_details_page.delete_button.click
    @submission_details_page.confirm_delete_button.click

    expect(@submission_details_page).to have_text(/No results found/)
    STDOUT.puts ' done.'
  end
end

Given('user is on the pricing outcome details page') do
  if !defined?(@submission)
    raise 'you cannot use this step without selecting a test submission first'
  end

  with_retry(60, PricingUnavailableError ||= Class.new(StandardError)) do |retried|
    navigator = NavigatorPage.new
    navigator.load
    navigator.roles.cwa_activity_report_manager_internal_role.click
    navigator.content.submission_list.click

    submission_list_page = SubmissionListPage.new
    submission_list_page.account_number.set(@submission.account_number)
    submission_list_page.submission_period.set(@submission.period)
    submission_list_page.search_button.click

    submission_list_page.wait_until_submissions_visible(wait: 10)
    submission_list_page.submissions.find do |sub|
      sub.schedule_submission_reference.text == @submission.schedule_number
    end.update_button.click

    submission_details_page = SubmissionDetailsPage.new
    expect(submission_details_page).to be_loaded
    expect(submission_details_page).not_to have_text(/No results found./)

    STDOUT.puts "(#{retried}) Checking for pricing completion..." if retried > 0

    price_unavailable = ->(outcome) { outcome.has_no_value?(wait: 0) }
    if submission_details_page.outcomes.any?(&price_unavailable)
      raise PricingUnavailableError
    end
  end
end

When('user is looking at outcome {string}') do |ufn|
  @current_outcome = @submission_details_page.outcomes.find do |outcome|
    outcome.ufn.text == ufn
  end
end

Then('user should see the following outcomes:') do |table|
  @submission_details_page = SubmissionDetailsPage.new
  outcome_data = table.hashes
  outcome_data.each do |row|
    STDOUT.puts("Checking " + row['UFN'])
    current_outcome = @submission_details_page.outcomes.find do |outcome|
      outcome.ufn.text == row['UFN']
    end
    expect(current_outcome.value.text).to eq(row['Value'])
  end
end

Then('user should see the following outcomes for accummulated claims:') do |table|
  @submission_details_page = SubmissionDetailsPage.new
  outcome_data = table.hashes
  outcome_data.each do |row|
    STDOUT.puts("Checking " + row['CASE_REF_NUMBER'])
    current_outcome = @submission_details_page.outcomes.find do |outcome|
      outcome.case_reference.text == row['CASE_REF_NUMBER']
    end
    expect(current_outcome.value.text).to eq(row['Value'])
  end
end

Then("user should see the outcome with one of these stage reached codes:") do |table|
  stage_reached_codes = table.raw
  stage_reached_codes.include?(@current_outcome.stage_reached.text)
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

def call_assessment_value_api(ufn, ucn, account_number, period)
  base_url = ENV['AV_API_URL'] || 'http://localhost:5000/'
  uri = URI("#{base_url}get_assessment_value")
  params = { ucn: ucn, ufn: ufn, account_number: account_number, submission_period: period }
  uri.query = URI.encode_www_form(params)

  # Debug statement to print the full URI
  puts "API URI: #{uri}"

  response = Net::HTTP.get(uri)

  puts response 

  JSON.parse(response)
end

Then('the assessment value should be returned for the following outcomes:') do |table|
  # get Account Number and Submission Period from CWAProvider module
  account_number = CWAProvider.submission.account_number
  period = CWAProvider.submission.period

  # create an instance of SubmissionDetailsPage
  submission_details_page = SubmissionDetailsPage.new

  # iterate through each row in the DataTable
  table.hashes.each do |row|
    case_id = row['case_id']
    expected_assessment_value = row['assessment_value']
    expected_linked_lines = row['linked_lines']
    expected_escape_flag = row['escape_flag']

    result = submission_details_page.find_ufn_and_ucn_by_case_id(case_id)
    if result
      puts "call AV API with #{result[:ufn]}, #{result[:ucn]}, #{account_number}, #{period}"
      
      # Call the API with the UFN, UCN, account_number, and period
      api_response = call_assessment_value_api(result[:ufn], result[:ucn], account_number, period)

      # Extract the values from the API response
      actual_assessment_value = api_response['assessment_value']
      actual_linked_lines = api_response['linked_lines']
      actual_escape_flag = api_response['escape_flag']

      # Format the values to 2 decimal places
      formatted_expected_assessment_value = sprintf('%.2f', expected_assessment_value.to_f)
      formatted_actual_assessment_value = sprintf('%.2f', actual_assessment_value.to_f)

      # Compare the values with custom failure messages
      expect(formatted_actual_assessment_value).to eq(formatted_expected_assessment_value), 
      "Expected assessment value for case_id #{case_id} to be #{formatted_expected_assessment_value}, " \
      "but got #{formatted_actual_assessment_value}"
      expect(actual_linked_lines.to_s).to eq(expected_linked_lines), 
      "Expected linked lines for case_id #{case_id} to be #{expected_linked_lines}, " \
      "but got #{actual_linked_lines}"
      expect(actual_escape_flag).to eq(expected_escape_flag), 
      "Expected escape flag for case_id #{case_id} to be #{expected_escape_flag}, " \
      "but got #{actual_escape_flag}"

      puts "Values match for case_id #{case_id}"
    else
      puts "No match found for case_id #{case_id}"
    end
  end
end