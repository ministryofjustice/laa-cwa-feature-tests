Given('user is on their {string} submission details page') do |area_of_law|
  CWAProvider.area_of_law = area_of_law.upcase
  steps %(
    Given user is logged into cwa
    And CWA application page is displayed
    And user navigates to Submissions page
    And Submission Search Page displayed
    And user searches for their submission
    And their submission details are displayed
  )
end

Then('the outcome saves successfully') do
  page = AddOutcomePage.new
  begin
    expect(page.has_no_errors?(wait: 0)).to eq(true)
  rescue RSpec::Expectations::ExpectationNotMetError
    STDOUT.puts page.errors.text
    raise RSpec::Expectations::ExpectationNotMetError
  end
  byebug
end


When("user adds outcomes for {string} {string} with fields like this for duplicate claims:") do |area_of_law, category_of_law, table|
  outcome_data = table.hashes
  @submissions_saved = outcome_data.size
  outcome_data.each do |outcome|
    submission_list_page = SubmissionListPage.new
    submission_list_page.add_outcome_button.click
    builder = Helpers::ScreenFieldBuilder.from(
      category_of_law: category_of_law.downcase.gsub(' ', '_'),
      area_of_law: area_of_law.downcase.gsub(' ', '_'),
      matter_type: outcome['matter_type'],
      claim_type: outcome['claim_type']
    )
    outcome['schedule_ref'] = CWAProvider.submission.schedule_ref
    builder.overrides = outcome
    page = AddOutcomePage.new(builder)
    page.add_outcome
  end
end

When("user adds outcomes for {string} {string} with fields like this:") do |area_of_law, category_of_law, table|
  submission_details_page = SubmissionDetailsPage.new
  if !submission_details_page.has_text?(/No results found/)
    STDOUT.print 'Cleaning existing outcomes for test reference...'
    submission_details_page.select_all_link.click
    submission_details_page.delete_button.click
    submission_details_page.confirm_delete_button.click
    STDOUT.puts ' done.'
  end
  outcome_data = table.hashes
  @submissions_saved = outcome_data.size
  outcome_data.each do |outcome|
    submission_list_page = SubmissionListPage.new
    submission_list_page.add_outcome_button.click
    builder = Helpers::ScreenFieldBuilder.from(
      category_of_law: category_of_law.downcase.gsub(' ', '_'),
      area_of_law: area_of_law.downcase.gsub(' ', '_'),
      matter_type: outcome['matter_type'],
      claim_type: outcome['claim_type']
    )
    if !outcome.has_key?("schedule_ref")
      outcome['schedule_ref'] = CWAProvider.submission.schedule_ref
    end
    if !outcome.has_key?("case_start_date") && !(area_of_law == "Crime Lower")
      outcome['case_start_date'] = (Date.today + 1).strftime("%d-%b-%Y") 
    end
    builder.overrides = outcome

    page = AddOutcomePage.new(builder)
    page.add_outcome
  end
end

When("user adds outcomes for {string} {string} with fields like this again:") do |area_of_law, category_of_law, table|
  submission_details_page = SubmissionDetailsPage.new
  outcome_data = table.hashes
  @submissions_saved = outcome_data.size
  outcome_data.each do |outcome|
    submission_list_page = SubmissionListPage.new
    submission_list_page.add_outcome_button.click
    builder = Helpers::ScreenFieldBuilder.from(
      category_of_law: category_of_law.downcase.gsub(' ', '_'),
      area_of_law: area_of_law.downcase.gsub(' ', '_'),
      matter_type: outcome['matter_type'],
      claim_type: outcome['claim_type']
    )
    outcome['schedule_ref'] = CWAProvider.submission.schedule_ref
    builder.overrides = outcome

    page = AddOutcomePage.new(builder)
    page.add_outcome
  end
end

When ("user adds an outcome for {string} {string} with {string}, {string}, {string}, {string}, {string}, {string} and {string}") do |area_of_law, category_of_law, case_id, matter_type, ecs, ecf_ref, case_start_date, pa, ap |
  sr = CWAProvider.submission.schedule_ref

  outcome_data = Hash.new

  outcome_data["matter_type"] = matter_type
  outcome_data["excl_case_funding_ref"] = ecf_ref
  outcome_data["case_start_date"] = case_start_date
  outcome_data["procurement_area"] = pa
  outcome_data["access_point"] = ap
  outcome_data["case_id"] = case_id
  outcome_data["exemption_criteria_satisfied"] = ecs

  submission_list_page = SubmissionListPage.new
  submission_list_page.add_outcome_button.click
  
  outcome_data["schedule_ref"] = sr
  builder = Helpers::ScreenFieldBuilder.from(
    area_of_law: area_of_law.downcase.gsub(' ', '_'),
    category_of_law: category_of_law.downcase.gsub(' ', '_')
  )

  builder.overrides = outcome_data
  page = AddOutcomePage.new(builder)
  page.add_outcome
end

When("user enters an outcome for {string} {string} with fields like this:") do |area_of_law, category_of_law, table|
  submission_details_page = SubmissionDetailsPage.new
  if !submission_details_page.has_text?(/No results found/)
    STDOUT.print 'Cleaning existing outcomes for test reference...'
    submission_details_page.select_all_link.click
    submission_details_page.delete_button.click
    submission_details_page.confirm_delete_button.click
    STDOUT.puts ' done.'
  end
  outcome_data = table.hashes
  @submissions_saved = outcome_data.size
  outcome_data.each do |outcome|
    submission_list_page = SubmissionListPage.new
    submission_list_page.add_outcome_button.click
    builder = Helpers::ScreenFieldBuilder.from(
      category_of_law: category_of_law.downcase.gsub(' ', '_'),
      area_of_law: area_of_law.downcase.gsub(' ', '_'),
      matter_type: outcome['matter_type'],
      claim_type: outcome['claim_type']
    )
    if !outcome.has_key?("schedule_ref")
      outcome['schedule_ref'] = CWAProvider.submission.schedule_ref
    end
    if !outcome.has_key?("case_start_date") && !(area_of_law == "Crime Lower")
      outcome['case_start_date'] = (Date.today + 1).strftime("%d-%b-%Y") 
    end
    builder.overrides = outcome

    page = AddOutcomePage.new(builder)
    page.add_outcome(false)
  end
end

Then("the outcome does not save and gives an error containing:") do |expected_message|
  page = AddOutcomePage.new

  # Locate the error table
  error_table = page.find('#FwkErrorBeanId', wait: 10)

  # Collect all errors from the table
  all_errors = error_table.all('ol.x3z li, div.x3z').map(&:text)

  # Convert all_errors to a set for faster lookup
  all_errors_set = all_errors.to_set

  # Split the expected error into individual lines for comparison
  expected_errors = expected_message.strip.split("\n").map(&:strip)

  # Check if all expected errors are present in the actual errors
  missing_errors = expected_errors.reject { |error| all_errors_set.any? { |actual| actual.include?(error) } }

  if missing_errors.empty?
    puts "All expected error messages were found."
  else
    puts "The following expected error messages were not found:"
    missing_errors.each { |error| puts "- #{error}" }

    puts "Other error messages found in the table:"
    all_errors.each_with_index do |error, index|
      puts "#{index + 1}. #{error}"
    end

    raise "Expected error messages were not found: #{missing_errors.join(', ')}"
  end
end



Then("the outcome does not save and the error message {string} appears") do |error_message|
  page = AddOutcomePage.new
  expect(page).to have_content('Error')
  expect(page).to have_content(error_message, wait:5)
end

Then("the outcome does not save and this popup error appears:") do |string|
  alert = page.driver.browser.switch_to.alert
  expect(alert.text).to have_content(string, wait: 10)
  alert.dismiss
rescue Selenium::WebDriver::Error::TimeoutError
  raise "Expected alert with message '#{string}' but no alert appeared within the timeout period"
end

Then('the no. of reported outcomes is {int}') do |no_reported_outcomes|
  expect(page.title).to eq("Submission Review").or eq("Submission Summary")
  expect(@submission_page.summary_section.outcomes).to have_content(no_reported_outcomes)
end

Then('the drop down list {string} contains the following values:') do |string, table|
  page = AddOutcomePage.new
  actual_values = page.dropdown_options(string)
  #remove nil value entries before testing values
  filtered_array = actual_values.reject { |item| item.empty? }
  expect(filtered_array).to match_array(table.raw.flatten)
end

Then('the drop down list {string} contains the following values after selecting {string} in the {string} drop down list:') do |second_dropdown, first_dropdown_value, first_dropdown, table|
  page = AddOutcomePage.new

  # Select the value in the first dropdown list
  page.select_dropdown_option("OutcomeDetailsRN", first_dropdown, first_dropdown_value)

  # Retrieve the options from the second dropdown list
  actual_values = page.dropdown_options(second_dropdown)

  # Remove nil value entries before testing values
  filtered_array = actual_values.reject { |item| item.empty? }

  # Check that the filtered array matches the expected values from the table
  expect(filtered_array).to match_array(table.raw.flatten)
end