Feature: Add an outcome

Scenario: Add a vaild outcome
  Given user is on their sumission details page
  When user adds a valid outcome
  Then the outcome saves sucessfully
