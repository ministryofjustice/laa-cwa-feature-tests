Feature: YOUL code Manual and Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUL pricing check for YOUE
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUL |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 010924/001 |      01/9/2024 |               1A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |     1141.17 |
      | 2 | 010924/002 |      01/9/2024 |               1B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      500.99 |
      | 3 | 010924/003 |      01/9/2024 |               2A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |     1430.44 |
      | 4 | 010924/004 |      01/9/2024 |               2B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      831.85 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                    |
      | 1 | 010924/001 | £ 1,141.17 | Standard fee for category 1A YOUL £1141.17 |
      | 2 | 010924/002 | £ 500.99   | Standard fee for category 1B YOUL £500.99  |
      | 3 | 010924/003 | £ 1,430.44 | Standard fee for category 2A YOUL £1430.44 |
      | 4 | 010924/004 | £ 831.85   | Standard fee for category 2B YOUL £831.85  |
