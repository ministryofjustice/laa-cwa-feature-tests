module OutcomePage
  def delete_all_outcomes
    steps %(
      Given user is logged into cwa
      Then CWA application page is displayed
      When user navigates to Submissions page
      Then Submission Search Page displayed
      When user searches for their submission
      Then their submission details are displayed
    )
    page = SubmissionDetailsPage.new
    return if page.has_no_select_all_link?(wait: 0)
    page.select_all_link.click
    page.delete_button.click
    page.confirm_delete_button.click
  end
end
