Feature: Pricing: IMMA: Illegal Immigration Act pricing tests for counsel cost error, DB limits and PC limits with prior authority number and without prior authority number

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |

  Scenario: 3 -  Claims priced with: hourly rates Scheme with counsel cost zero , completed matter
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |         100 |            0 | Y             |          100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                     |
      | 1 | 010523/001 | £ 360.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£0)) + detention travel & waiting costs(£100) + disbursement(£100) + disbursement vat(£20) + vat on PC + DTW(£40) |

  Scenario: Claims priced with: hourly rates Scheme with detention travel & waiting costs and DB , DB vat completed matter
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |          100 |                  100 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                            |
      | 1 | 010523/001 | £ 120.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)(not allowed) + detention travel & waiting costs(£100) ignored as PC = 0 + disbursement(£100) + disbursement vat(£20) ) |

  Scenario: Claims priced with: hourly rates Scheme with counsel cost zero , stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |         100 |            0 | Y             |          100 |                  100 |                20 | --           |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                     |
      | 1 | 010523/001 | £ 360.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£0)) + detention travel & waiting costs(£100) + disbursement(£100) + disbursement vat(£20) + vat on PC + DTW(£40) |

  Scenario: Claims priced with: hourly rates Scheme with PC  > 3000 with prior authority number with PC vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                    0 |                 0 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                         |
      | 1 | 010523/001 | £ 3,601.20 | Priced at hourly rates with PC > 3000 as prior authority number is given  + vat |

  Scenario: Claims priced with: hourly rates Scheme with DB  > 1501 with prior authority number with PC vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                 1501 |                20 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 1,521.00 | Priced at hourly rates with DB > 1500 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with PC  > 3000 with prior authority number with PC vat completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                    0 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 3,601.20 | Priced at hourly rates with PC > 3000 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with DB  > 1501 with prior authority number with PC vat completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                 1501 |                20 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 1,521.00 | Priced at hourly rates with DB > 1500 as prior authority number is given |

  Scenario: 9 - Claims priced with: hourly rates Scheme with PC > 3000 and DB  > 1500 with prior authority number stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                 1501 |                 0 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 5,102.20 | Priced at hourly rates with DB > 1500 as prior authority number is given |
