Feature: Navigate CWA

Scenario: Open Submissions View page
  Given a test firm user is logged in CWA
  When user navigates to Submissions page
  Then Submission Search Page displayed
