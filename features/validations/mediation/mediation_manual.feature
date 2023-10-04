Feature: Validation for Immigration and Asylum claims

  Background:
    Given user is on their "MEDIATION" submission details page

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "Mediation" with fields like this:
      | matter_type | case_start_date |
      | MEDI:MDAC   | 01/11/19        |
    Then the outcome saves successfully