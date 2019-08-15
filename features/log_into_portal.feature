Feature: Log into Portal

Scenario: Visit the Portal
  When I visit the portal url
  Then I see the portal login page

Scenario: Log in to Portal
  Given a test firm user is on the portal login page
  When user Logs in
  Then Portal application page is displayed