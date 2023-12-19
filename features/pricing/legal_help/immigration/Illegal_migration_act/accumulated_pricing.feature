Feature: Pricing: IMMA: Illegal Immigration Act

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |

  Scenario: Completed matter claim priced with: hourly rates Scheme with pc and zero cc ,with disbursement and disbursement vat
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |          10 |            0 | N             |               1500.0 |               300 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                          |
      | 1 | 010523/001 | £ 1,810.00 | Priced at hourly rates (profit cost(£10) +  counsel cost(£0)) + disbursement vat(£1500) + disbursement vat(£300) |

  Scenario: Stage claim priced with: hourly rates with disbursement > 1501
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                       |
      | 1 | 010523/001 | £ 1,501.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£1501) + disbursement vat(£0) |

  Scenario: Disbursement claim priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                       |
      | 1 | 010523/001 | £ 1,501.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£1501) + disbursement vat(£0) |

  Scenario: 17 - Claims priced with: hourly rates with detention travel & waiting costs with profit cost > 3001 without prior authority number
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                      | Description                                                                                                                                                                                                                                                                                 |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Profit Cost Validation | Prior Authority is required to exceed the profit costs limit for this type of work. The total profit costs reported on this matter, across multiple claims, exceeds £3000 therefore please enter a valid prior authority number or reduce your profit costs claim to the appropriate limit. |

  Scenario: 18 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_REF_NUMBER | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | SC Claim        | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
      | 2 |     001 | DC Cliam        | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                   |
      | 1 | SC Claim        | £ 4,502.00 | Priced at hourly rates (profit cost(£3001) +  counsel cost(£0)) + disbursement vat(£1501) |
      | 2 | DC Cliam        | £ 0.00     | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£0)       |

  Scenario: 19 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_REF_NUMBER | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | SC Claim        | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        2000 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | DC Claim        | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 3 |     001 | CM Claim        | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |        1001 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                                       |
      | 1 | Prior Authority is required to exceed the profit costs limit for this type of work. The total profit costs reported on this matter, across multiple claims, exceeds £3000 therefore please enter a valid prior authority number or reduce your profit costs claim to the appropriate limit. |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                |
      | 1 | SC Claim        | £ 2,000.00 | Priced at hourly rates (profit cost(£2000) +  counsel cost(£0)) + disbursement vat(£0) |
      | 2 | DC Claim        | £ 0.00     | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£0)    |
      | 2 | CM Claim        | £ 1,001.00 | Priced at hourly rates (profit cost(£1001) +  counsel cost(£0)) + disbursement vat(£0) |

  Scenario: Claims priced with: hourly rates with 4 claims without PAN with DB threshold breached
    When the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_REF_NUMBER | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | SC Claim        | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | DC Claim 1      | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  400 |                 0 |                     |
      | 3 |     001 | DC Claim 2      | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                 2999 |                 0 |                     |
      | 4 |     001 | CM Claim        | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Disbursement Amount Validation | Prior Authority is required to exceed the disbursements limit for this type of work. The total disbursements reported on this matter, across multiple claims, exceeds £1500 therefore please enter a valid prior authority number or reduce your disbursements claim to the appropriate limit. |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Disbursement Amount Validation | Prior Authority is required to exceed the disbursements limit for this type of work. The total disbursements reported on this matter, across multiple claims, exceeds £1500 therefore please enter a valid prior authority number or reduce your disbursements claim to the appropriate limit. |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                |
      | 1 | SC Claim        | £ 1,000.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | DC Claim 1      | £ 400.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£400)  |
      | 3 | DC Claim 2      | £ 2,999.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£2999) |
      | 4 | CM Claim        | £ 51.00    | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£51)   |

  Scenario: Claims priced with: hourly rates with 4 claims with PAN with DB threshold breached
    When the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_REF_NUMBER | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | SC Claim        | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 |     001 | DC Claim 1      | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  400 |                 0 | A000000             |
      | 3 |     001 | DC Claim 2      | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                 2999 |                 0 | A000000             |
      | 4 |     001 | CM Claim        | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                |
      | 1 | SC Claim        | £ 1,000.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | DC Claim 1      | £ 400.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£400)  |
      | 3 | DC Claim 2      | £ 2,999.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£2999) |
      | 4 | CM Claim        | £ 51.00    | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£51)   |

  Scenario: Claims priced with: hourly rates with 4 claims without PAN with PC and DB threshold breached
    When the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_REF_NUMBER | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | SC Claim        | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        2001 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | DC Claim 1      | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  300 |                 0 |                     |
      | 3 |     001 | DC Claim 2      | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                  101 |                 0 |                     |
      | 4 |     001 | CM Claim        | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |        1000 |            0 | N             |            0 |                  100 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Profit Cost Validation         | Prior Authority is required to exceed the profit costs limit for this type of work. The total profit costs reported on this matter, across multiple claims, exceeds £3000 therefore please enter a valid prior authority number or reduce your profit costs claim to the appropriate limit.    |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Disbursement Amount Validation | Prior Authority is required to exceed the disbursements limit for this type of work. The total disbursements reported on this matter, across multiple claims, exceeds £1500 therefore please enter a valid prior authority number or reduce your disbursements claim to the appropriate limit. |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                   |
      | 1 | SC Claim        | £ 3,001.00 | Priced at hourly rates (profit cost(£2001) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | DC Claim 1      | £ 300.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£300)     |
      | 3 | DC Claim 2      | £ 101.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£101)     |
      | 4 | CM Claim        | £ 1,100.00 | Priced at hourly rates (profit cost(£1000) +  counsel cost(£0)) + disbursement vat(£100)  |

  Scenario: Claims priced with: hourly rates with 4 claims with PAN and PC and DB thresholds breached
    When the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_REF_NUMBER | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | SC Claim        | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        2001 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 |     001 | DC Claim 1      | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  300 |                 0 | A000000             |
      | 3 |     001 | DC Claim 2      | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                  101 |                 0 | A000000             |
      | 4 |     001 | CM Claim        | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |        1000 |            0 | N             |            0 |                  100 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                   |
      | 1 | SC Claim        | £ 3,001.00 | Priced at hourly rates (profit cost(£2001) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | DC Claim 1      | £ 300.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£300)     |
      | 3 | DC Claim 2      | £ 101.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£101)     |
      | 4 | CM Claim        | £ 1,100.00 | Priced at hourly rates (profit cost(£1000) +  counsel cost(£0)) + disbursement vat(£100)  |

  Scenario: Claims priced with: hourly rates with SC, DC ,DC with two claims having PAN
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          05/08/2023 |           0 |            0 | N             |            0 |                  401 |                 0 | A000000             |
      | 3 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          06/12/2023 |           0 |            0 | N             |            0 |                  100 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Disbursement Amount Validation | Prior Authority is required to exceed the disbursements limit for this type of work. The total disbursements reported on this matter, across multiple claims, exceeds £1500 therefore please enter a valid prior authority number or reduce your disbursements claim to the appropriate limit. |

  Scenario: Claims priced with: hourly rates with DC, DC , SC claim with PC threshold breached
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            1 | N             |            0 |                    0 |                 0 |                     |
      | 3 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                 1500 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                      | Description                                                                                                                                                                                                                                                                                 |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Profit Cost Validation | Prior Authority is required to exceed the profit costs limit for this type of work. The total profit costs reported on this matter, across multiple claims, exceeds £3000 therefore please enter a valid prior authority number or reduce your profit costs claim to the appropriate limit. |

  Scenario: Claims priced with: hourly rates with SC and CM
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Profit Cost Validation         | Prior Authority is required to exceed the profit costs limit for this type of work. The total profit costs reported on this matter, across multiple claims, exceeds £3000 therefore please enter a valid prior authority number or reduce your profit costs claim to the appropriate limit.    |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Disbursement Amount Validation | Prior Authority is required to exceed the disbursements limit for this type of work. The total disbursements reported on this matter, across multiple claims, exceeds £1500 therefore please enter a valid prior authority number or reduce your disbursements claim to the appropriate limit. |

  Scenario: 11 - Claims priced with: hourly rates with SC , DC claims
    When the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | SC Claim        |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 | DC Cliam        |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  501 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                |
      | 1 | SC Claim        | £ 1,000.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | DC Cliam        | £ 501.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£501)  |

  Scenario: 12 - Claims priced with: hourly rates with SC, CM claims with DB
    When the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | SC Claim        |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 | CM Cliam        |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  501 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                |
      | 1 | SC Claim        | £ 1,000.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | CM Cliam        | £ 501.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement vat(£501)  |

  Scenario: 13 - Claims priced with: hourly rates with SC , CM claims with PC
    When the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | SC Claim        |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        1500 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 | CM Cliam        |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/08/2023 |        1501 |            0 | N             |            0 |                  501 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for accummulated claims:
      | # | CASE_REF_NUMBER | Value      | Comment                                                                                   |
      | 1 | SC Claim        | £ 2,500.00 | Priced at hourly rates (profit cost(£1500) +  counsel cost(£0)) + disbursement vat(£1000) |
      | 2 | CM Cliam        | £ 2,002.00 | Priced at hourly rates (profit cost(£1501) +  counsel cost(£0)) + disbursement vat(£501)  |
