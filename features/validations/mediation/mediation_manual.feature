Feature: Validation for Immigration and Asylum claims

  Background: 
    Given user is on their "MEDIATION" submission details page

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "mediation" with fields like this:
      | case_id | matter_type | case_start_date | med_concluded_date |
      |     001 | MEDI:MDAC   |      01/11/2019 |         01/10/2023 |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "mediation" with fields like this:
      | case_id | matter_type | case_start_date | med_concluded_date |
      |     001 | MEDI:MDAS   |      01/11/2019 |         01/10/2023 |
    Then the outcome saves successfully

     @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Assessment Meetings claims
    When user adds outcomes for "Mediation" "mediation" with fields like this:
      | case_id | matter_type | case_start_date | med_concluded_date |
      |     001 | MEDI:MDPC   |      01/11/2019 |         01/10/2023 |
    Then the outcome saves successfully
