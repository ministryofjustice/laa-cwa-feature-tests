Feature: Add outcome manually

  @delete_outcome_after
  Scenario: Add an outcome for Discrimination
    Given user is on their submission details page
    When user adds a valid outcome for Discrimination
    Then the outcome saves successfully
