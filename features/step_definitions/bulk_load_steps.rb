When('user bulk loads {string} for the test firm') do |file|
  navigator = NavigatorPage.new
  navigator.load
  navigator.roles.cwa_activity_report_manager_internal_role.click
  navigator.content.bulk_load.click

  @bulk_load_page = BulkLoadPage.new
  within_popup(@bulk_load_page, ->{ @bulk_load_page.lookup_firm.click }) do
    office_search_page = OfficeSearchPage.new
    within_frame(office_search_page.frame) do
      office_search_page.search_term.set(CWAProvider.firm_name)
      office_search_page.search_button.click
      office_search_page.first_quick_select.click
    end
  end

  @bulk_load_page.bulk_load_file.send_keys(load_fixture(file))
  with_delay(0.75) { @bulk_load_page.next_button.click }

end

Then(/successful outcomes should equal (\d*)/) do |num_of_successful_outcomes|
  expect(@bulk_load_page).to be_loaded
  expect(@bulk_load_page).to have_summary
  expect(@bulk_load_page.summary).to have_successful_outcomes
  expect(@bulk_load_page.summary.successful_outcomes.text).to eq(num_of_successful_outcomes)
end

Then("there should be no problem outcomes") do
  @bulk_load_page = BulkLoadPage.new
  @bulk_load_page.summary(wait: 20)
  expect(@bulk_load_page).to have_summary
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
  matches_reference = ->(submission) do
    submission.schedule_submission_reference.text ==
      CWAProvider.legal_help_submission.reference
  end
  expect(@bulk_load_results_page.submissions.any?(&matches_reference))
    .to eq(true)
end
