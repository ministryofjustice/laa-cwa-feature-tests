Feature: Test Valid Procurement Area and Access Point codes

Scenario: Visit the Portal
  When I visit the portal url
  Then I see the portal login page

Scenario: Log in to Portal
  Given user is on the portal login page
  When user Logs in 
  Then Portal application page is displayed

Scenario: Log in to CWA
  Given user is on the portal home page
  When user clicks on CWA link
  Then CWA application page is displayed
