require 'timecop'
require 'csv'

Given( /^user prepares to submit outcomes for test provider "(.*)"(\s+again)?$/) do |ref, again|
  @submission = CWAProvider.submission_by_ref(ref)

  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click

  if !again
    navigator.content.submission_list.click

    submission_list_page = SubmissionListPage.new
    submission_list_page.account_number.set(@submission.account_number)
    submission_list_page.area_of_law_search.select(@submission.area_of_law)
    submission_list_page.submission_period.set(@submission.period)
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
        submission_details_page.select_all_link.click
        submission_details_page.delete_button.click
        submission_details_page.confirm_delete_button.click
        STDOUT.puts ' done.'
      end
    end

    navigator.load
    navigator.roles.cwa_activity_report_manager_internal_role.click
  end

  navigator.content.bulk_load.click
  @bulk_load_page = BulkLoadPage.new
  within_popup(@bulk_load_page, ->{ @bulk_load_page.lookup_firm.click }) do
    office_search_page = OfficeSearchPage.new
    sleep 1
    within_frame(office_search_page.frame) do
      office_search_page.search_by.select('Account Number')
      office_search_page.account_number.set(@submission.account_number)
      office_search_page.search_button.click
      expect(page).to have_content("Search and Select: Firm Name", wait: 10)
      office_search_page.first_quick_select.click
    end
  end
end

Given('the following Matter Types are chosen:') do |table|
  @matter_types = table.raw.flatten
end

Given('set system date to tomorrow') do
  Timecop.freeze(Date.today + 1)
end

Given('reset system date') do
  Timecop.unfreeze
end

When(/^the following outcomes are bulkloaded(\sand\sconfirmed)?:$/) do |confirm, table|
  @bulk_load_page = BulkLoadPage.new
  expect(page).to have_content("Bulk Load File Selection", wait: 5)
  doc = build_bulkload_xml(
    submission: @submission,
    matter_types: @matter_types,
    new_lines: table_to_hash_array(table)
  )
  file_name = save_tmp_bulkload_xml(doc)
  @bulk_load_page.bulk_load_file.send_keys(file_name)
  @bulk_load_page.wait_until_next_button_visible(wait: 5)
  @bulk_load_page.next_button.double_click
  # @bulk_load_page.next_button_top.double_click
  find('#Next:enabled', wait: 10).click
  step('user confirms the submission') if
  confirm
  sleep(1)
end

Then('the following error message is expected for each:') do |expected_message|
  @bulk_load_results_page = BulkLoadResultsPage.new
  @bulk_load_results_page.wait_until_summary_visible(wait: 30)

  actual_results = @bulk_load_results_page.errors.reduce({}) do |memo, error|
    case_id = error.client_surname.text.split.last
    if case_id
      error_message = error.description.text
      all_errors = memo.fetch(case_id, []) << error_message
      memo.merge(case_id => all_errors)
    else
      memo
    end
  end

  @matter_types.flat_map.each.with_index(1) do |matter_type, i|
    STDOUT.puts("Testing #{matter_type}")

    case_id = "%03d" % i
    actual_errors = actual_results.fetch(case_id, [])

    expect(actual_errors).to contain_exactly(expected_message)
  end
end

Then('no error message is expected for each') do
  @bulk_load_results_page = BulkLoadResultsPage.new
  @bulk_load_results_page.wait_until_summary_visible(wait: 30)

  actual_results = @bulk_load_results_page.errors.reduce({}) do |memo, error|
    case_id = error.client_surname.text.split.last
    if case_id
      error_message = error.description.text
      all_errors = memo.fetch(case_id, []) << error_message
      memo.merge(case_id => all_errors)
    else
      memo
    end
  end

  @matter_types.flat_map.each.with_index(1) do |matter_type, i|
    STDOUT.puts("Testing #{matter_type}")

    case_id = "%03d" % i
    actual_errors = actual_results.fetch(case_id, [])

    expect(actual_errors).to eq([])
  end
end

Then('the following results are expected:') do |table|
  @bulk_load_results_page = BulkLoadResultsPage.new
  expected_results = @matter_types.flat_map do |matter_type|
    table_to_hash_array(table).map do |row|
      row.tap { |r| r[:matter_type] = matter_type }
    end
  end
  expect(page).to have_content('Bulk Load Information', wait: 60)
  page.execute_script "window.scrollTo(0,500)"
  actual_results = @bulk_load_results_page.errors.reduce({}) do |collected, current|
    case_id = current.client_surname.text.split.last
    error_message = current.description.text
    collected.merge({ case_id => error_message })
  end
  expected_results.each.with_index(1) do |row, i|
    STDOUT.puts("Testing #{row[:matter_type]}, assertion ##{row[:'#']}")

    case_id = "%03d" % i
    expected = error_message(row[:error_code_or_message])
    error = actual_results[case_id]
    next if error.nil? && expected == '<none>'
    expect(page).to have_content('Bulk Load Information', wait: 30)
    expect(error).to have_content(expected, wait:20)
  end
end

When('user bulk loads {string} for the test firm') do |file|
  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.bulk_load.click

  CWAProvider.area_of_law = 'LEGAL HELP'

  @bulk_load_page = BulkLoadPage.new
  within_popup(@bulk_load_page, ->{ @bulk_load_page.lookup_firm.click }) do
    office_search_page = OfficeSearchPage.new
    within_frame(office_search_page.frame) do
      office_search_page.search_by.select('Account Number')
      office_search_page.account_number.set(CWAProvider.submission.account_number)
      office_search_page.search_button.click
      office_search_page.first_quick_select.click
    end
  end

  @bulk_load_page.bulk_load_file.send_keys(bulkload_file_path(file))
  with_delay(1.75) { @bulk_load_page.next_button.click }
  sleep 5
end

When('user bulk loads {string} for the test firm {string}') do |file , account_no|
  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.bulk_load.click
  CWAProvider.area_of_law = 'LEGAL HELP'
  @bulk_load_page = BulkLoadPage.new
  within_popup(@bulk_load_page, ->{ @bulk_load_page.lookup_firm.click }) do
    office_search_page = OfficeSearchPage.new
    within_frame(office_search_page.frame) do
      office_search_page.search_by.select('Account Number')
      office_search_page.account_number.set(account_no)
      office_search_page.search_button.click
      office_search_page.first_quick_select.click
    end
  end

  @bulk_load_page.bulk_load_file.send_keys(bulkload_file_path(file))
  with_delay(1.75) { @bulk_load_page.next_button.click }
  sleep 5
end

Then(/successful outcomes should equal (\d*)/) do |num_of_successful_outcomes|
  @bulk_load_page = BulkLoadResultsPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 60)
  expect(@bulk_load_page.summary).to have_successful_outcomes
  expect(@bulk_load_page.summary.successful_outcomes.text).to eq(num_of_successful_outcomes)
end

Then(/problem outcomes should equal (\d*)/) do |num_of_problem_outcomes|
  @bulk_load_page = BulkLoadResultsPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 60)
  expect(@bulk_load_page.summary).to have_problem_outcomes

  actual_problem_outcomes = @bulk_load_page.summary.problem_outcomes.text.to_i
  expected_problem_outcomes = num_of_problem_outcomes.to_i

  if actual_problem_outcomes != expected_problem_outcomes
    puts "Expected problem outcomes: #{expected_problem_outcomes}, but found: #{actual_problem_outcomes}"

    if ENV['DISPLAY_ERRORS'] == 'true'
      # Capture the actual errors
      error_table = @bulk_load_page.find('#BulkLoadErrorsVO table.x1h')
      error_rows = error_table.all('tr')[1..-1] # Skip the header row

      error_messages = error_rows.map do |row|
        {
          summary_id: row.find('td:nth-child(1)').text,
          matter_type: row.find('td:nth-child(2)').text,
          ufn: row.find('td:nth-child(3)').text,
          client_surname: row.find('td:nth-child(4)').text,
          error_type: row.find('td:nth-child(5)').text,
          description: row.find('td:nth-child(6)').text
        }
      end

      # Write errors to a CSV file
      CSV.open('error_messages.csv', 'w') do |csv|
        csv << ['Summary Id', 'Matter Type', 'UFN', 'Client Surname', 'Error Type', 'Description']
        error_messages.each do |error|
          csv << [error[:summary_id], error[:matter_type], error[:ufn], error[:client_surname], error[:error_type], error[:description]]
        end
      end

      puts "Error messages have been written to error_messages.csv"
    end
  end

  expect(actual_problem_outcomes).to eq(expected_problem_outcomes)
end

Then(/invalid outcomes should equal (\d*)/) do |num_of_invalid_outcomes|
  @bulk_load_page = BulkLoadResultsPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 60)
  expect(@bulk_load_page.summary.invalid_outcomes_nms.text).to eq(num_of_invalid_outcomes)
end

Then(/duplicate outcomes should equal (\d*)/) do |num_of_duplicate_outcomes|
  @bulk_load_page = BulkLoadResultsPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 60)
  expect(@bulk_load_page.summary.duplicate_outcomes.text).to eq(num_of_duplicate_outcomes)
end


Then("there should be no problem outcomes") do
  @bulk_load_page = BulkLoadResultsPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 30)
  expect(@bulk_load_page.summary).to have_problem_outcomes
  expect(@bulk_load_page.summary.problem_outcomes.text).to eq('0')
end

Then("there should be other outcomes like follows") do
  @bulk_load_page = BulkLoadResultsPage.new
  @bulk_load_page.wait_until_summary_visible(wait: 20)
  expect(@bulk_load_page.summary.total_outcomes.text).to eq('3')
  expect(@bulk_load_page.summary.problem_outcomes.text).to eq('1')
  expect(@bulk_load_page.summary.duplicate_outcomes.text).to eq('0')
  expect(@bulk_load_page.summary.invalid_outcomes_nms.text).to eq('1')
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
  @bulk_load_page.wait_until_confirm_submission_visible(wait: 20)
  @bulk_load_page.confirm_submission.double_click
end

When("user views the submission details") do
  @bulk_load_results_page = BulkLoadResultsPage.new
  @bulk_load_results_page.submissions.first.bulk_load_update_link.click
end

Given('the following outcomes are added to the bulkload file:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @xml = prepare_bulkload_xml(
    submission: @submission,
    matter_types: @matter_types,
    new_lines: table_to_hash_array(table)
  )
end

And('the bulkload file is submitted') do
  @bulk_load_page = BulkLoadPage.new
  expect(page).to have_content("Bulk Load File Selection", wait: 5)
  file_name = save_tmp_bulkload_xml(@xml.raw)
  @bulk_load_page.bulk_load_file.send_keys(file_name)
  @bulk_load_page.wait_until_next_button_visible(wait: 5)
  @bulk_load_page.next_button.double_click
end

And('the following new matter starts are added to the bulkload file:') do |table|
  nms_data = table.hashes
  @xml.add_nms_data(nms_data)
end
