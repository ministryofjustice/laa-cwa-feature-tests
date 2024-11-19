Feature: YOUX code Manual and Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX pricing check for YOUE
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 010924/001 |      01/9/2024 |               1A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |
      | 2 | 010924/002 |      01/9/2024 |               1B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      182.01 |
      | 3 | 010924/003 |      01/9/2024 |               2A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |     1072.74 |
      | 4 | 010924/004 |      01/9/2024 |               2B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      437.81 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                    |
      | 1 | 010924/001 | £ 822.47   | Standard fee for category 1A YOUX £822.47  |
      | 2 | 010924/002 | £ 182.01   | Standard fee for category 1B YOUX £182.01  |
      | 3 | 010924/003 | £ 1,072.74 | Standard fee for category 2A YOUX £1072.74 |
      | 4 | 010924/004 | £ 437.81   | Standard fee for category 2B YOUX £437.81  |
