Feature: Pricing: IMCD: Immigration – Interim CLR rates (hourly rates with fixed fee for advocacy services)

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMCD:IFVI |

  Scenario: Claims priced with: hourly rates Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         200 |           28 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                         |
      | 1 | 010413/001 | £ 228.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) |

  Scenario: Claims priced with: hourly rates Scheme with disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | DISBURSEMENTS_AMOUNT | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        5000 |         4000 |               4000.0 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                  |
      | 1 | 010413/001 | £ 13,000.00 | Priced at hourly rates profit cost(£5000) +  counsel cost(£4000) + disbursements amount(£4000) = £13,000 |

  Scenario: Claims priced with: Additional Payments , no impact of detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | TRAVEL_COSTS |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        5000 |         4000 | N             |         1 |              1 | Y                   |                     1 |        10000 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                 |
      | 1 | 010413/001 | £ 9,654.00 | Priced at hourly rates Profit_Cost(£5000) + Counsel_Cost(£4000) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) = £9,654 |

  Scenario: Claims priced with: hourly rates Scheme with disbursements and disbursements_vat
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         500 |          400 |                100.0 |                20 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                       |
      | 1 | 010413/001 | £ 1,020.00 | Priced at hourly rates profit cost(£500) +  counsel cost(£400) + disbursements amount(£100) + disbursements_vat(£20) = £1,020 |

  Scenario: Claims priced with: hourly rates with VAT Indicator enabled , no impact of detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         200 |           28 | Y             |        10000 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                      |
      | 1 | 010120/001 | £ 273.60 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28) + vat(45.6))) |
