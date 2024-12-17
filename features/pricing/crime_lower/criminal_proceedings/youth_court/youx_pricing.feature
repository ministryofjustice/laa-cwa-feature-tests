Feature: YOUX code Manual and Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX pricing check for YOUX
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |      06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1072.74 |
      | 2 | 061224/002 |      06/12/2024 |           1A-LSF |           06/12/2024 | Y           | C1013          |                        1 |      822.47 |
      | 3 | 061224/003 |      06/12/2024 |           1B-HSF |           06/12/2024 | Y           | C1013          |                        1 |      437.81 |
      | 4 | 061224/004 |      06/12/2024 |           1B-LSF |           06/12/2024 | Y           | C1013          |                        1 |      182.01 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                        |
      | 1 | 061224/001 | £ 1,072.74 | Standard fee for category 1A-HSF YOUX £1072.74 |
      | 2 | 061224/002 | £ 822.47   | Standard fee for category 1A-LSF YOUX £822.47  |
      | 3 | 061224/003 | £ 437.81   | Standard fee for category 1B-HSF YOUX £437.81  |
      | 4 | 061224/004 | £ 182.01   | Standard fee for category 1B-LSF YOUX £182.01  |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX pricing check for YOUX with vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR |
      | 1 | 061224/001 |      06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1072.74 | Y             |
      | 2 | 061224/002 |      06/12/2024 |           1A-LSF |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |
      | 3 | 061224/003 |      06/12/2024 |           1B-HSF |           06/12/2024 | Y           | C1013          |                        1 |      437.81 | Y             |
      | 4 | 061224/004 |      06/12/2024 |           1B-LSF |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                   |
      | 1 | 061224/001 | £ 1,287.29 | Standard fee for category 1A-HSF YOUX £1072.74  + vat 20% |
      | 2 | 061224/002 | £ 986.96   | Standard fee for category 1A-LSF YOUX £822.47  + vat 20%  |
      | 3 | 061224/003 | £ 525.37   | Standard fee for category 1B-HSF YOUX £437.81  + vat 20%  |
      | 4 | 061224/004 | £ 218.41   | Standard fee for category 1B-LSF YOUX £182.01  + vat 20%  |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX pricing check for YOUX with vat and travel and waiting costs with vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS |
      | 1 | 061224/001 |      06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1072.74 | Y             |          100 |                  100 |
      | 2 | 061224/002 |      06/12/2024 |           1A-LSF |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |          100 |                  100 |
      | 3 | 061224/003 |      06/12/2024 |           1B-HSF |           06/12/2024 | Y           | C1013          |                        1 |      437.81 | Y             |          100 |                  100 |
      | 4 | 061224/004 |      06/12/2024 |           1B-LSF |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |          100 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                       |
      | 1 | 061224/001 | £ 1,527.29 | Standard fee for category 1A-HSF YOUX £1072.74 + travel costs + waiting costs + 20% vat on total =  £1,527.29 |
      | 2 | 061224/002 | £ 1,226.96 | Standard fee for category 1A-LSF YOUX £822.47 + travel costs + waiting costs + 20% vat on total = £ 1,226.96  |
      | 3 | 061224/003 | £ 765.37   | Standard fee for category 1B-HSF YOUX £437.81 + travel costs + waiting costs + 20% vat on total =  £765.37    |
      | 4 | 061224/004 | £ 458.41   | Standard fee for category 1B-LSF YOUX £182.01 + travel costs + waiting costs + 20% vat on total =  £458.41    |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX pricing check for YOUX with vat and travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 061224/001 |      06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1072.74 | Y             |          100 |                  100 |                  100 |                20 |
      | 2 | 061224/002 |      06/12/2024 |           1A-LSF |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |          100 |                  100 |                  100 |                20 |
      | 3 | 061224/003 |      06/12/2024 |           1B-HSF |           06/12/2024 | Y           | C1013          |                        1 |      437.81 | Y             |          100 |                  100 |                  100 |                20 |
      | 4 | 061224/004 |      06/12/2024 |           1B-LSF |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |          100 |                  100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                         |
      | 1 | 061224/001 | £ 1,647.29 | Standard fee for category 1A-HSF YOUX £1072.74 + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1,647.29 |
      | 2 | 061224/002 | £ 1,346.96 | Standard fee for category 1A-LSF YOUX £822.47 + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat = £1,346.96   |
      | 3 | 061224/003 | £ 885.37   | Standard fee for category 1B-HSF YOUX £437.81 + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £885.37    |
      | 4 | 061224/004 | £ 578.41   | Standard fee for category 1B-LSF YOUX £182.01 + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £578.41    |

  Scenario: bulkload Crime Lower stage reached code YOUX pricing check for YOUX with vat and  without travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 061224/001 |      06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1072.74 | Y             |            0 |                    0 |                  100 |                20 |
      | 2 | 061224/002 |      06/12/2024 |           1A-LSF |           06/12/2024 | Y           | C1013          |                        1 |      822.47 | Y             |            0 |                    0 |                  100 |                20 |
      | 3 | 061224/003 |      06/12/2024 |           1B-HSF |           06/12/2024 | Y           | C1013          |                        1 |      437.81 | Y             |            0 |                    0 |                  100 |                20 |
      | 4 | 061224/004 |      06/12/2024 |           1B-LSF |           06/12/2024 | Y           | C1013          |                        1 |      182.01 | Y             |            0 |                    0 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                |
      | 1 | 061224/001 | £ 1,407.29 | Standard fee for category 1A-HSF YOUX + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £1,407.29 |
      | 2 | 061224/002 | £ 1,106.96 | Standard fee for category 1A-LSF YOUX + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat = £1,106.96  |
      | 3 | 061224/003 | £ 645.37   | Standard fee for category 1B-HSF YOUX + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £645.37   |
      | 4 | 061224/004 | £ 338.41   | Standard fee for category 1B-LSF YOUX + travel costs + waiting costs + 20% vat on total + disbursement + disbursement vat =  £338.41   |

  @delete_outcome_after @manual_submission
  Scenario Outline: Pricing tests manual entry for YOUX
    Given user is on their "Crime Lower" submission details page
    When user adds outcomes for "Crime Lower" "Criminal Proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id |
      | YOUX        |      06/12/2024 |           1A-HSF |     1072.74 | 061224/001 |         06-DEC-2024 | C1013          |       1 |
      | YOUX        |      06/12/2024 |           1A-LSF |      822.47 | 061224/002 |         06-DEC-2024 | C1013          |       1 |
      | YOUX        |      06/12/2024 |           1B-HSF |      437.81 | 061224/003 |         06-DEC-2024 | C1013          |       1 |
      | YOUX        |      06/12/2024 |           1B-LSF |      182.01 | 061224/004 |         06-DEC-2024 | C1013          |       1 |
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                  |
      | 1 | 061224/001 | £ 1,072.74 | Priced at Fixed fee for YOUX at £1072.74 |
      | 1 | 061224/002 | £ 822.47   | Priced at Fixed fee for YOUX at £822.47  |
      | 1 | 061224/003 | £ 437.81   | Priced at Fixed fee for YOUX at £437.81  |
      | 1 | 061224/004 | £ 182.01   | Priced at Fixed fee for YOUX at £182.01  |
