Feature: YOUY code Bulk load pricing

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUY pricing check for YOUY
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 010924/001 |      01/9/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |     1141.17 |
      | 2 | 010924/002 |      01/9/2024 |       1a - Lower |           01/9/2024 | Y           | C1013          |                        1 |      884.61 |
      | 3 | 010924/003 |      01/9/2024 |      1b - Higher |           01/9/2024 | Y           | C1013          |                        1 |      500.99 |
      | 4 | 010924/004 |      01/9/2024 |       1b - Lower |           01/9/2024 | Y           | C1013          |                        1 |      232.53 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                             |
      | 1 | 010924/001 | £  1,141.17 | Standard fee for category 1a - Higher YOUY £1141.17 |
      | 2 | 010924/002 | £ 884.61    | Standard fee for category 1a - Lower YOUY £884.61   |
      | 3 | 010924/003 | £ 500.99    | Standard fee for category 1b - Higher YOUY £500.99  |
      | 4 | 010924/004 | £ 232.53    | Standard fee for category 1b - Lower YOUY £232.53   |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUY pricing check for YOUY with vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010924/001 |      01/9/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |     1141.17 | Y             |
      | 2 | 010924/002 |      01/9/2024 |       1a - Lower |           01/9/2024 | Y           | C1013          |                        1 |      884.61 | Y             |
      | 3 | 010924/003 |      01/9/2024 |      1b - Higher |           01/9/2024 | Y           | C1013          |                        1 |      500.99 | Y             |
      | 4 | 010924/004 |      01/9/2024 |       1b - Lower |           01/9/2024 | Y           | C1013          |                        1 |      232.53 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                         |
      | 1 | 010924/001 | £ 1,369.40 | Standard fee for category 1a - Higher YOUY £1,141.17  + vat 20% |
      | 2 | 010924/002 | £ 1,061.53 | Standard fee for category 1a - Lower YOUY £884.61  + vat 20%    |
      | 3 | 010924/003 | £ 601.19   | Standard fee for category 1b - Higher YOUY £500.99  + vat 20%   |
      | 4 | 010924/004 | £ 279.04   | Standard fee for category 1b - Lower YOUY £232.53  + vat 20%    |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUY pricing check for YOUY with vat and travel and waiting costs with vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS |
      | 1 | 301223/001 |     30/12/2023 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |     1141.17 | Y             |          100 |                  100 |
      | 2 | 301223/002 |     30/12/2023 |       1a - Lower |           01/9/2024 | Y           | C1013          |                        1 |      884.61 | Y             |          100 |                  100 |
      | 3 | 301223/003 |     30/12/2023 |      1b - Higher |           01/9/2024 | Y           | C1013          |                        1 |      500.99 | Y             |          100 |                  100 |
      | 4 | 301223/004 |     30/12/2023 |       1b - Lower |           01/9/2024 | Y           | C1013          |                        1 |      232.53 | Y             |          100 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                    |
      | 1 | 301223/001 | £ 1,369.40 | Standard fee for category 1a - Higher YOUY £1141.17 + ignore(travel costs + waiting costs) + 20% vat on total =  £1,369.40 |
      | 2 | 301223/002 | £ 1,061.53 | Standard fee for category 1a - Lower YOUY £884.61 + ignore(travel costs + waiting costs) + 20% vat on total = £ 1,061.53   |
      | 3 | 301223/003 | £ 601.19   | Standard fee for category 1b - Higher YOUY £500.99 + ignore(travel costs + waiting costs) + 20% vat on total =  £601.19    |
      | 4 | 301223/004 | £ 279.04   | Standard fee for category 1b - Lower YOUY £232.53 + ignore(travel costs + waiting costs) + 20% vat on total =  £279.04     |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUY pricing check for YOUY with vat and travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010924/001 |      01/9/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |     1141.17 | Y             |          100 |                  100 |                  100 |                20 |
      | 2 | 010924/002 |      01/9/2024 |       1a - Lower |           01/9/2024 | Y           | C1013          |                        1 |      884.61 | Y             |          100 |                  100 |                  100 |                20 |
      | 3 | 010924/003 |      01/9/2024 |      1b - Higher |           01/9/2024 | Y           | C1013          |                        1 |      500.99 | Y             |          100 |                  100 |                  100 |                20 |
      | 4 | 010924/004 |      01/9/2024 |       1b - Lower |           01/9/2024 | Y           | C1013          |                        1 |      232.53 | Y             |          100 |                  100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                      |
      | 1 | 010924/001 | £ 1,489.40 | Standard fee for category 1a - Higher YOUY £1141.17 + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat =  £1,489.40 |
      | 2 | 010924/002 | £ 1,181.53 | Standard fee for category 1a - Lower YOUY £884.61 + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat = £1,181.53    |
      | 3 | 010924/003 | £ 721.19   | Standard fee for category 1b - Higher YOUY £500.99 + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat =  £721.19    |
      | 4 | 010924/004 | £ 399.04   | Standard fee for category 1b - Lower YOUY £232.53  + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat =  £399.04    |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUY pricing check for YOUY with vat and  without travel and waiting costs with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010924/001 |      01/9/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |     1141.17 | Y             |            0 |                    0 |                  100 |                20 |
      | 2 | 010924/002 |      01/9/2024 |       1a - Lower |           01/9/2024 | Y           | C1013          |                        1 |      884.61 | Y             |            0 |                    0 |                  100 |                20 |
      | 3 | 010924/003 |      01/9/2024 |      1b - Higher |           01/9/2024 | Y           | C1013          |                        1 |      500.99 | Y             |            0 |                    0 |                  100 |                20 |
      | 4 | 010924/004 |      01/9/2024 |       1b - Lower |           01/9/2024 | Y           | C1013          |                        1 |      232.53 | Y             |            0 |                    0 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                      |
      | 1 | 010924/001 | £ 1,489.40 | Standard fee for category 1a - Higher YOUY £1141.17 + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat =  £1,489.40 |
      | 2 | 010924/002 | £ 1,181.53 | Standard fee for category 1a - Lower YOUY £884.61 + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat = £1,181.53    |
      | 3 | 010924/003 | £ 721.19   | Standard fee for category 1b - Higher YOUY £500.99 + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat =  £721.19    |
      | 4 | 010924/004 | £ 399.04   | Standard fee for category 1b - Lower YOUY £232.53  + ignore(travel costs + waiting costs) + 20% vat on total + disbursement + disbursement vat =  £399.04    |
