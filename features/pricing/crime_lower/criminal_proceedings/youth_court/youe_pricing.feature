Feature: YOUE code Manual and Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUE pricing check for YOUE
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |      06/12/2024 |               1A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      822.47 |
      | 2 | 061224/002 |      06/12/2024 |               1B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      182.01 |
      | 3 | 061224/003 |      06/12/2024 |               2A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      919.96 |
      | 4 | 061224/004 |      06/12/2024 |               2B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      321.37 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 061224/001 | £ 822.47 | Standard fee for category 1A YOUE £822.47 |
      | 2 | 061224/002 | £ 182.01 | Standard fee for category 1B YOUE £182.01 |
      | 3 | 061224/003 | £ 919.96 | Standard fee for category 2A YOUE £919.96 |
      | 4 | 061224/004 | £ 321.37 | Standard fee for category 2B YOUE £321.37 |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUE pricing check for YOUE with vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR |
      | 1 | 061224/001 |      06/12/2024 |               1A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |
      | 2 | 061224/002 |      06/12/2024 |               1B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |
      | 3 | 061224/003 |      06/12/2024 |               2A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      919.96 | Y             |
      | 4 | 061224/004 |      06/12/2024 |               2B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      321.37 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                             |
      | 1 | 061224/001 | £ 986.96   | Standard fee for category 1A YOUE £822.47 + vat 20% |
      | 2 | 061224/002 | £ 218.41   | Standard fee for category 1B YOUE £182.01 + vat 20% |
      | 3 | 061224/003 | £ 1,103.95 | Standard fee for category 2A YOUE £919.96 + vat 20% |
      | 4 | 061224/004 | £ 385.64   | Standard fee for category 2B YOUE £321.37 + vat 20% |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUE pricing check for YOUE with vat and travel and waiting costs
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS |
      | 1 | 051224/001 |     05/12/2024 |               1A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |          100 |                  100 |
      | 2 | 051224/002 |     05/12/2024 |               1B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |          100 |                  100 |
      | 3 | 051224/003 |     05/12/2024 |               2A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      919.96 | Y             |          100 |                  100 |
      | 4 | 051224/004 |     05/12/2024 |               2B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      321.37 | Y             |          100 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                         |
      | 1 | 051224/001 | £ 1,226.96 | Standard fee for category 1A YOUE + travel costs + waiting costs + 20% vat on total =  £1226.96 |
      | 2 | 051224/002 | £ 458.41   | Standard fee for category 1B YOUE + travel costs + waiting costs + 20% vat on total = £458.41   |
      | 3 | 051224/003 | £ 1,343.95 | Standard fee for category 2A YOUE + travel costs + waiting costs + 20% vat on total =  £1343.95 |
      | 4 | 051224/004 | £ 625.64   | Standard fee for category 2B YOUE + travel costs + waiting costs + 20% vat on total =  £625.64  |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUE pricing check for YOUE with vat and travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 061224/001 |      06/12/2024 |               1A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |          100 |                  100 |                  100 |                20 |
      | 2 | 061224/002 |      06/12/2024 |               1B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |          100 |                  100 |                  100 |                20 |
      | 3 | 061224/003 |      06/12/2024 |               2A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      919.96 | Y             |          100 |                  100 |                  100 |                20 |
      | 4 | 061224/004 |      06/12/2024 |               2B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      321.37 | Y             |          100 |                  100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                           |
      | 1 | 061224/001 | £ 1,346.96 | Standard fee for category 1A YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1346.96 |
      | 2 | 061224/002 | £ 578.41   | Standard fee for category 1B YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat = £578.41   |
      | 3 | 061224/003 | £ 1,463.95 | Standard fee for category 2A YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1463.95 |
      | 4 | 061224/004 | £ 745.64   | Standard fee for category 2B YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £745.64  |

  Scenario: bulkload Crime Lower stage reached code YOUE pricing check for YOUE with vat and  without travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 061224/001 |      06/12/2024 |               1A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |            0 |                    0 |                  100 |                20 |
      | 2 | 061224/002 |      06/12/2024 |               1B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |            0 |                    0 |                  100 |                20 |
      | 3 | 061224/003 |      06/12/2024 |               2A | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      919.96 | Y             |            0 |                    0 |                  100 |                20 |
      | 4 | 061224/004 |      06/12/2024 |               2B | CP18         |           06/12/2024 | Y           | C1013          |                        1 |      321.37 | Y             |            0 |                    0 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                           |
      | 1 | 061224/001 | £ 1,106.96 | Standard fee for category 1A YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1106.96 |
      | 2 | 061224/002 | £ 338.41   | Standard fee for category 1B YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat = £338.41   |
      | 3 | 061224/003 | £ 1,223.95 | Standard fee for category 2A YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1223.95 |
      | 4 | 061224/004 | £ 505.64   | Standard fee for category 2B YOUE + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £505.64  |

  @delete_outcome_after @manual_submission
  Scenario Outline: Pricing tests manual entry for YOUE
    Given user is on their "Crime Lower" submission details page
    When user adds outcomes for "Crime Lower" "Criminal Proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id |
      | YOUE        |      06/12/2024 |               1A |      822.47 | 061224/001 |         06-DEC-2024 | C1013          |       1 |
      | YOUE        |      06/12/2024 |               1B |      182.01 | 061224/002 |         06-DEC-2024 | C1013          |       1 |
      | YOUE        |      06/12/2024 |               2A |      919.96 | 061224/003 |         06-DEC-2024 | C1013          |       1 |
      | YOUE        |      06/12/2024 |               2B |      321.37 | 061224/004 |         06-DEC-2024 | C1013          |       1 |
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                 |
      | 1 | 061224/001 | £ 822.47 | Priced at Fixed fee for YOUE at £822.47 |
      | 1 | 061224/002 | £ 182.01 | Priced at Fixed fee for YOUE at £182.01 |
      | 1 | 061224/003 | £ 919.96 | Priced at Fixed fee for YOUE at £919.96 |
      | 1 | 061224/004 | £ 321.37 | Priced at Fixed fee for YOUE at £321.37 |
