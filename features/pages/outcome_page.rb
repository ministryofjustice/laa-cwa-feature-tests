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
      When user searches for their legal help submission
      Then their submission details are displayed
    )
    page.click_link 'Select All'
    page.click_button 'Delete'
    page.click_button 'Yes'
  end
end
