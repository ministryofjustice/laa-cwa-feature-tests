Feature: Pricing: IMXL: Immigration - LH Work Not Subject to the Standard Fee Scheme

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMXL:IFFL |

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

  Scenario: Claims priced with: Additional Payments though not entitiled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | HO_INTERVIEW | 
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        5000 |         4000 | N             |         1 | 
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                 |
      | 1 | 010413/001 | £ 9,000.00 | Priced at hourly rates Profit_Cost(£5000) + Counsel_Cost(£4000) = £9000, ignoring additional payments as code is not entitiled for additional payments HO_INTERVIEW(£266) = null |

  Scenario: Claims priced with: hourly rates Scheme with disbursements and disbursements_vat
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         500 |          400 |                100.0 |                20 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                       |
      | 1 | 010413/001 | £ 1,020.00 | Priced at hourly rates profit cost(£500) +  counsel cost(£400) + disbursements amount(£100) + disbursements_vat(£20) = £1,020 |

  Scenario: Claims priced with: hourly rates with VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         200 |           28 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                      |
      | 1 | 010120/001 | £ 273.60 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28) + vat(45.6))) |


   Scenario: Claims priced with: hourly rates Scheme with NRM advice
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |NATIONAL_REF_MECHANISM_ADVICE   |
      | 1 | 010423/001 | CM         |      01/04/2023 |          20/04/2023 |         200 |           28 | N             |Y          |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                         |
      | 1 | 010423/001 | £ 378.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) + NRM_ADVICE Bolt On fee (£150) |

  Scenario: Claims priced with: hourly rates Scheme without NRM advice bolt-on added, ignoring NRM bolt-on as start date earler to 01/04/23
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |NATIONAL_REF_MECHANISM_ADVICE   |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         200 |           28 | N             |Y          |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                         |
      | 1 | 010413/001 | £ 228.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) = £228 , ignoring NRM bolt-on as start date earler to 01/04/23, NRM_ADVICE Bolt On fee (£150) |