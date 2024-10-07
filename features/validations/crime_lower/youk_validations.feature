Feature: YOUK code Bulk load validations

  Scenario: Bulkoad Crime Lower stage reached code YOUK with case outcome code CP19
  is invalid for YOUK

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#8"
    Given the following Matter Types are chosen:
      | YOUK |
    And the following outcomes are bulkloaded:
      | # | UFN        | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION |NUMBER_OF_POLICE_STATION|
      | 1 | 010924/001 | CP19         |           01/9/2024 | Y           | C1013          |1                       |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE            |
      | 1 | CP19 is not a valid OUTCOME_CODE |

  Scenario: Manually enter YOUK outcomes using the mag court fee scheme 01-JAN-1995 to 02-OCT-2011
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "youth court" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | outcome_code |
      | YOUK        |                |                  |           0 | 010924/001 |         01-SEP-2024 | C1013          | CP19         |
    Then the outcome does not save and gives an error containing:
      """
      Outcome Code - ID CP19 for the flexfield segment Outcome Code does not exist in the value set XXLSC_CASE_OUTCOME_CODE_CL.
      """
