Feature: YOUK code Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUK pricing check for YOUK
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUK |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 010924/001 |      01/9/2024 |               1A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      884.61 |
      | 2 | 010924/002 |      01/9/2024 |               1B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      232.53 |
      | 3 | 010924/003 |      01/9/2024 |               2A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      995.73 |
      | 4 | 010924/004 |      01/9/2024 |               2B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      397.14 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 010924/001 | £ 884.61 | Standard fee for category 1A YOUK £884.61 |
      | 2 | 010924/002 | £ 232.53 | Standard fee for category 1B YOUK £232.53 |
      | 3 | 010924/003 | £ 995.73 | Standard fee for category 2A YOUK £995.73 |
      | 4 | 010924/004 | £ 397.14 | Standard fee for category 2B YOUK £397.14 |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUK pricing check for YOUK with vat and travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUK |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010924/001 |      01/9/2024 |               1A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      884.61 | Y             |          100 |                  100 |                  100 |                20 |
      | 2 | 010924/002 |      01/9/2024 |               1B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      232.53 | Y             |          100 |                  100 |                  100 |                20 |
      | 3 | 010924/003 |      01/9/2024 |               2A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      995.73 | Y             |          100 |                  100 |                  100 |                20 |
      | 4 | 010924/004 |      01/9/2024 |               2B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      397.14 | Y             |          100 |                  100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                      |
      | 1 | 010924/001 | £ 1,181.53 | Standard fee for category 1A YOUK + ignore (travel costs +  waiting costs) + 20% vat on total + disbursement + disbursement vat =  £1,181.53 |
      | 2 | 010924/002 | £ 399.04   | Standard fee for category 1B YOUK + ignore (travel costs +  waiting costs) + 20% vat on total + disbursement + disbursement vat = £399.04    |
      | 3 | 010924/003 | £ 1,314.88 | Standard fee for category 2A YOUK + ignore (travel costs +  waiting costs) + 20% vat on total + disbursement + disbursement vat =  £1,314.88 |
      | 4 | 010924/004 | £ 596.57   | Standard fee for category 2B YOUK + ignore (travel costs +  waiting costs) + 20% vat on total + disbursement + disbursement vat =  £596.57   |
