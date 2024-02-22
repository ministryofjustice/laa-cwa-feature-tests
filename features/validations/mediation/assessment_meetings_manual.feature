Feature: Validation for Assessment Meeting claims

  Background: 
    Given user is on their "MEDIATION" submission details page

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "Assessment Meetings" with fields like this:
      | case_id | matter_type | case_start_date |
      |     001 | ASSM:ASSA   |      01/11/2019 |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "Assessment Meetings" with fields like this:
      | case_id | matter_type | case_start_date |
      |     001 | ASSM:ASSS   |      01/11/2019 |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "Assessment Meetings" with fields like this:
      | case_id | matter_type | case_start_date |
      |     001 | ASSM:ASST   |      01/11/2019 |
    Then the outcome saves successfully
