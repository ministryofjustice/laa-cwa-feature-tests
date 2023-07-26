Feature: Pricing: QEMP: Employment

 Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.EDU#10"
    Given the following Matter Types are chosen:
      | QEMP:QGEN |

  Scenario: Claims priced with: hourly rates Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010919/001 | CM         |      01/09/2019 |         200 |           28 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                         |
      | 1 | 010919/001 | £ 228.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010919/001 | CM         |      01/09/2019 |         228 |          200 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                    |
      | 1 | 010919/001 | £ 548.00 | profit cost £228  + counsel cost £200 + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010919/001 | CM         |      01/09/2019 |         200 |           28 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                |
      | 1 | 010919/001 | £ 273.60 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) +  Vat 20% of PC+CC = £45.60 = £273.60 |

  Scenario: Scenario: Claims priced with: profit + counsel costs exceeding the max price cap
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010919/001 | CM         |      01/09/2019 |         500 |          201 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                 |
      | 1 | 010919/001 | £ 700.00 | Priced at hourly rates (profit cost(£500) +  counsel cost(£201)) = £701.00 priced at max price cap £700 |

  Scenario: Claims priced with: hourly rates , Escape Fee Flag
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010919/001 | CM         |      01/09/2019 |         500 |          200 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                  |
      | 1 | 010919/001 | £ 840.00 | Priced at hourly rates (profit cost(£500) +  counsel cost(£200)) +  Vat 20% of PC+CC = £140.00 = £840.00 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                                                                        |
      | escape threhold max fee cap = £700(PC+CC), Profit_Cost(£500) + Counsel_Cost(£200) - Additioanal_payments(0)(no additional costs for discmination)= £700 + Vat 20% of PC+CC = £140.00 = £840.00 |
      | escape when net profit + net counsel  > £700 , vat component is added later to total(£140) so value = £840                                                                                     |

  Scenario: Claims priced with: hourly rates, NO Escape Fee Flag
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010919/001 | CM         |      01/09/2019 |         500 |          199 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                  |
      | 1 | 010919/001 | £ 838.80 | Priced at hourly rates (profit cost(£500) +  counsel cost(£199)) +  Vat 20% of PC+CC = £139.80 = £838.80 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                                                                        |
      | escape threhold max fee cap = £700(PC+CC), Profit_Cost(£500) + Counsel_Cost(£199) - Additioanal_payments(0)(no additional costs for discmination)= £699 + Vat 20% of PC+CC = £140.00 = £838.80 |
      | Not escape when net profit + net counsel  < £700 , vat component is added later to total(£139.80) so value = £838.80                                                                           |
