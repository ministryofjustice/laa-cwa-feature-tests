Feature: validate case start date

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  @delete_outcome_after @manual_submission
  Scenario Outline: Manual entry for EARLY LEGAL ADVICE
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
    | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date |
    |     212 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      01/04/2024 |

    Then the outcome saves successfully

  @delete_outcome_after @manual_submission
  Scenario Outline: Manual entry for EARLY LEGAL ADVICE
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
    | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date |
    |     213 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      01/04/2024 |
    And the outcome saves successfully
    And the user navigates to the submission review screen
    Then the no. of reported outcomes is 1

  @delete_outcome_after @manual_submission
  Scenario Outline: Manual entry for EARLY LEGAL ADVICE
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
    | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date |
    |     214 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      01/04/2024 |
    And the outcome saves successfully
    And the user navigates to the submission summary screen
    Then the no. of reported outcomes is 1