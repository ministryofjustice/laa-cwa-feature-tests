module OutcomePage
  def delete_all_outcomes
    steps %(
      Given a test firm user is on the portal login page
      When user Logs in
      Then Portal application page is displayed
      When user clicks on CWA link
      Then CWA application page is displayed
      When user navigates to Submissions page
      Then Submission Search Page displayed
      When user searches for their submission
      Then their submission details are displayed
    )
    page = SubmissionDetailsPage.new
    return if page.has_no_select_all_link?(wait: 0)
    page.select_all
    page.delete_button.click
    page.confirm_delete_button.click
  end
end
