Feature: Pricing for EARLY LEGAL ADVICE

  Scenario Outline: Pricing tests manual entry for EARLY LEGAL ADVICE with PC + CC < 3*(£157) no escape + Db + Db vat
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
      | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date | profit_cost | counsel_cost | disbursements_amount | disbursements_vat | vat_indicator | travel_waiting_costs |
      |     100 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      01/04/2024 |         100 |            0 |                  100 |                20 | N             |                  100 |
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                           |
      | 1 | 010424/100 | £ 277.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£0)) < 471 so priced at fixed fee £157 + disbursement vat(£100) + disbursement vat(£20) |

  Scenario Outline: Pricing tests manual entry for EARLY LEGAL ADVICE with PC + CC < 3*(£157) no escape + Db + Db vat
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
      | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date | profit_cost | counsel_cost | disbursements_amount | disbursements_vat | vat_indicator | travel_waiting_costs |
      |     101 | LWOV:LMIX   | HP00002          | AP00000      | LA            | LB           |      01/04/2024 |           0 |          100 |                  100 |                20 | Y             |                  100 |
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                           |
      | 1 | 010424/101 | £ 308.40 | Priced at hourly rates (profit cost(£0) +  counsel cost(£100)) < 471 so priced at fixed fee £157 + disbursement vat(£100) + disbursement vat(£20) |

  Scenario Outline: Pricing tests manual entry for EARLY LEGAL ADVICE with PC + CC < 3*(£157) no escape + Db + Db vat
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
      | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date | profit_cost | counsel_cost | disbursements_amount | disbursements_vat | vat_indicator | travel_waiting_costs |
      |     102 | LWOV:LMIX   | HP00002          | AP00000      | LA            | LB           |      01/04/2024 |         200 |          270 |                  100 |                20 | Y             |                  100 |
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                             |
      | 1 | 010424/102 | £ 308.40 | Priced at hourly rates (profit cost(£200) +  counsel cost(£270)) < 471 so priced at fixed fee £157 + disbursement vat(£100) + disbursement vat(£20) |

  Scenario Outline: Pricing tests manual entry for EARLY LEGAL ADVICE with PC + CC < 3*(£157) no escape + Db + Db vat
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
      | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date | profit_cost | counsel_cost | disbursements_amount | disbursements_vat | vat_indicator | travel_waiting_costs |
      |     103 | LWOV:LMIX   | HP00002          | AP00000      | LA            | LB           |      01/04/2024 |         200 |          271 |                  100 |                20 | Y             |                  100 |
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                              |
      | 1 | 010424/103 | £ 308.40 | Priced at hourly rates (profit cost(£200) +  counsel cost(£271)) <= 471 so priced at fixed fee £157 + disbursement vat(£100) + disbursement vat(£20) |

  Scenario: Testing pricing for ELA with bulkload with PC
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#16"
    Given the following Matter Types are chosen:
      | LDIB:LBEN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | TRAVEL_WAITING_COSTS |
      | 1 |     104 | 010424/104 |      01/04/2024 | LB           | LA            |         100 |            0 | N             |               100.00 |                20 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                  |
      | 1 | 010424/104 | £ 277.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£0)) < 3 * 157 so priced at fixed fee £157 + disbursement amount(£100) + disbursement vat(£20) |

  Scenario: Testing pricing for ELA with bulkload with CC
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#16"
    Given the following Matter Types are chosen:
      | LDIB:LBEN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | TRAVEL_WAITING_COSTS |
      | 1 |     105 | 010424/105 |      01/04/2024 | LB           | LA            |           0 |          100 | N             |               100.00 |                20 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                  |
      | 1 | 010424/105 | £ 277.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£100)) < 3 * 157 so priced at fixed fee £157 + disbursement amount(£100) + disbursement vat(£20) |

  Scenario: Testing pricing for ELA with bulkload with PC and CC < 3 * £157 does not escape
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#16"
    Given the following Matter Types are chosen:
      | LDIB:LBEN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | TRAVEL_WAITING_COSTS |
      | 1 |     106 | 010424/106 |      01/04/2024 | LB           | LA            |         200 |          270 | Y             |               100.00 |                20 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                    |
      | 1 | 010424/106 | £ 308.40 | Priced at hourly rates (profit cost(£200) +  counsel cost(£270)) < 3 * 157 so priced at fixed fee £157 + disbursement amount(£100) + disbursement vat(£20) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                       |
      | escape threhold 3 * standard fee (£157) = £471, Profit_Cost(£200) + Counsel_Cost(£270) < £471 |

  Scenario: Testing pricing for ELA with bulkload with PC and CC < 3 * £157 escapes threshold
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#16"
    Given the following Matter Types are chosen:
      | LDIB:LBEN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | TRAVEL_WAITING_COSTS |
      | 1 |     107 | 010424/107 |      01/04/2024 | LB           | LA            |         200 |          271 | Y             |               100.00 |                20 |                  100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                    |
      | 1 | 010424/107 | £ 308.40 | Priced at hourly rates (profit cost(£200) +  counsel cost(£270)) < 3 * 157 so priced at fixed fee £157 + disbursement amount(£100) + disbursement vat(£20) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                       |
      | escape threhold 3 * standard fee (£157) = £471, Profit_Cost(£200) + Counsel_Cost(£271) = £471 |
