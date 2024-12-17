Feature: YOUF code Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUF pricing check for YOUF
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUF |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 |061224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |     1072.74 |
      | 2 |061224/002 |     06/12/2024 |               1B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      437.81 |
      | 3 |061224/003 |     06/12/2024 |               2A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |     1335.67 |
      | 4 |061224/004 |     06/12/2024 |               2B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      737.08 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                    |
      | 1 |061224/001 | £ 1,072.74 | Standard fee for category 1A YOUF £1072.74 |
      | 2 |061224/002 | £ 437.81   | Standard fee for category 1B YOUF £437.81  |
      | 3 |061224/003 | £ 1,335.67 | Standard fee for category 2A YOUF £1335.67 |
      | 4 |061224/004 | £ 737.08   | Standard fee for category 2B YOUF £737.08  |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUF pricing check for YOUF with vat and travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUF |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 |061224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |     1072.74 | Y             |          100 |                  100 |                  100 |                20 |
      | 2 |061224/002 |     06/12/2024 |               1B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      437.81 | Y             |          100 |                  100 |                  100 |                20 |
      | 3 |061224/003 |     06/12/2024 |               2A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |     1335.67 | Y             |          100 |                  100 |                  100 |                20 |
      | 4 |061224/004 |     06/12/2024 |               2B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      737.08 | Y             |          100 |                  100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                            |
      | 1 |061224/001 | £ 1,647.29 | Standard fee for category 1A YOUF + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1,647.29 |
      | 2 |061224/002 | £ 885.37   | Standard fee for category 1B YOUF + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat = £885.37    |
      | 3 |061224/003 | £ 1,962.80 | Standard fee for category 2A YOUF + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1,962.80 |
      | 4 |061224/004 | £ 1,244.50 | Standard fee for category 2B YOUF + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1,244.50 |
