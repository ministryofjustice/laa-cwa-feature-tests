Feature: Check access point validation

  @delete_outcome_after
  Scenario: Add an outcome with AP00000 after 1st July case start date
    Given user is on their submission details page
    When user adds a valid outcome
    Then the outcome saves successfully

  Scenario: Add an outcome with AP00000 before 1st July case start date
    Given user is on their submission details page
    When user adds a invalid outcome
    Then the outcome does not save and gives an error
