Given('user prepares to submit outcomes for test provider {string}') do |ref|
  @submission = CWAProvider.submission(ref)

  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click

  navigator.content.submission_list.click

  submission_list_page = SubmissionListPage.new
  submission_list_page.account_number.set(@submission.account_number)
  submission_list_page.search_button.click

  submission_list_page.wait_until_submissions_visible(wait: 10)
  existing_submission = submission_list_page.submissions.find do |submission|
    submission.schedule_submission_reference.text == @submission.schedule_number
  end

  if existing_submission
    existing_submission.update_button.click
    submission_details_page = SubmissionDetailsPage.new
    if !submission_details_page.has_text?(/No results found/)
      STDOUT.print 'Cleaning existing outcomes for test reference...'
      submission_details_page.select_all.click
      submission_details_page.delete_button.click
      submission_details_page.confirm_delete_button.click
      STDOUT.puts ' done.'
    end
  end

  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.bulk_load.click

  @bulk_load_page = BulkLoadPage.new
  within_popup(@bulk_load_page, ->{ @bulk_load_page.lookup_firm.click }) do
    office_search_page = OfficeSearchPage.new
    within_frame(office_search_page.frame) do
      office_search_page.search_by.select('Account Number')
      office_search_page.account_number.set(@submission.account_number)
      office_search_page.search_button.click
      office_search_page.first_quick_select.click
    end
  end
end

Given('the following Matter Types are chosen:') do |table|
  @matter_types = table.raw.flatten
end

When('the following outcomes are bulkloaded:') do |table|
  doc = build_bulkload_xml(
    submission: @submission,
    matter_types: @matter_types,
    new_lines: table_to_hash_array(table)
  )
  file_name = save_tmp_bulkload_xml(doc)

  @bulk_load_page.bulk_load_file.send_keys(file_name)
  with_delay(0.75) { @bulk_load_page.next_button.click }
end

Then('the following results are expected:') do |table|
  @bulk_load_results_page = BulkLoadResultsPage.new
  table_to_hash_array(table).each do |row|
    expected = row[:error_code_or_message]
    error = @bulk_load_results_page.errors.find do |error|
      matter_type_index = @matter_types.find_index(row[:matter_type])
      raise "Matter type not selected: #{row[:matter_type]}" if matter_type_index.nil?
      case_id = "%03d" % (row[:'#'].to_i + matter_type_index)
      error.client_surname.text.split.last == case_id
    end
    next if error.nil? && expected == '<none>'
    expect(error&.description&.text).to eq(error_message(expected))
  end
end

When('user bulk loads {string} for the test firm') do |file|
  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.bulk_load.click

  submission = CWAProvider.submissions.find { |s| s.area_of_law == 'LEGAL HELP' }

  @bulk_load_page = BulkLoadPage.new
  within_popup(@bulk_load_page, ->{ @bulk_load_page.lookup_firm.click }) do
    office_search_page = OfficeSearchPage.new
    within_frame(office_search_page.frame) do
      office_search_page.search_term.set(submission.firm_name)
      office_search_page.search_button.click
      office_search_page.first_quick_select.click
    end
  end

  @bulk_load_page.bulk_load_file.send_keys(bulkload_file_path(file))
  with_delay(0.75) { @bulk_load_page.next_button.click }
end

Then(/successful outcomes should equal (\d*)/) do |num_of_successful_outcomes|
  @bulk_load_page = BulkLoadPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 30)
  expect(@bulk_load_page.summary).to have_successful_outcomes
  expect(@bulk_load_page.summary.successful_outcomes.text).to eq(num_of_successful_outcomes)
end

Then("there should be no problem outcomes") do
  @bulk_load_page = BulkLoadPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 20)
  expect(@bulk_load_page.summary).to have_problem_outcomes
  expect(@bulk_load_page.summary.problem_outcomes.text).to eq('0')
end

Then("there should be no duplicate outcomes") do
  expect(@bulk_load_page).to have_summary
  expect(@bulk_load_page.summary).to have_duplicate_outcomes
  expect(@bulk_load_page.summary.duplicate_outcomes.text).to eq('0')
end

Then('user should see a validation error') do
  expect(@bulk_load_page.errors).to have_text(/Error in CSV upload/)
end

Then('user should see the outcome results page') do
  @bulk_load_results_page = BulkLoadResultsPage.new
  expect(@bulk_load_results_page).to be_loaded
end

Then('user should see the bulk load results page') do
  @bulk_load_page = BulkLoadPage.new
  expect(@bulk_load_page).to be_loaded
end

Then('the following summary for the submission:') do |table|
  table_to_hash_array(table).each.with_index do |row, index|
    row.each_pair do |element_name, expected_value|
      actual_row = @bulk_load_results_page.summary[index]
      actual_value = actual_row.public_send(element_name).text
      expect(actual_value).to eq(expected_value)
    end
  end
end

Then('the following errors:') do |table|
  table_to_hash_array(table).each.with_index do |row, index|
    row.each_pair do |element_name, expected_value|
      actual_row = @bulk_load_results_page.errors[index]
      actual_value = actual_row.public_send(element_name).text
      expect(actual_value).to eq(expected_value)
    end
  end
end

When('a user successfully bulk loads {string} for the test firm') do |file|
  steps %{
    When user bulk loads "#{file}" for the test firm
    Then user should see the bulk load results page
    And there should be no problem outcomes
    And there should be no duplicate outcomes
    And user confirms the submission
  }
end

When('user confirms the submission') do
  @bulk_load_page = BulkLoadPage.new
  @bulk_load_page.wait_until_confirm_submission_visible(wait: 10)
  @bulk_load_page.confirm_submission.click
end

When("user views the submission details") do
  @bulk_load_results_page = BulkLoadResultsPage.new
  @bulk_load_results_page.submissions.bulk_load_update_link.click
end

Then('user should see the submission reference in the submission list page') do
  submission = CWAProvider.submissions.find { |s| s.area_of_law == 'LEGAL HELP' }

  matches_reference = ->(submission) do
    submission.schedule_submission_reference.text == submission.schedule_number
  end
  expect(@bulk_load_results_page.submissions.any?(&matches_reference)).to eq(true)
end
