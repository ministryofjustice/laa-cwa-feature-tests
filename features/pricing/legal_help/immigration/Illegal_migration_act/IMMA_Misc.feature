Feature: Pricing: IMMA: Illegal Immigration Act pricing tests for counsel cost error, DB limits and PC limits with prior authority number and without prior authority number

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |

  Scenario: 1 - Claims priced with: hourly rates Scheme with all values > 0 including counsel costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |         100 |          100 | N             |          100 |                100.0 |                20 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                      |
      | 1 | Counsel fees cannot be claimed under Legal Help, except as a disbursement. |

  Scenario: Claims priced with: hourly rates Scheme with all others zero except for counsel cost
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |          100 | N             |            0 |                    0 |                 0 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                      |
      | 1 | Counsel fees cannot be claimed under Legal Help, except as a disbursement. |

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

  Scenario: Claims priced with: hourly rates Scheme with all zeros  , completed matter
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                    0 |                 0 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value  | Comment                                            |
      | 1 | 010523/001 | £ 0.00 | Priced at hourly rates zero as all values are zero |

  Scenario: Claims priced with: hourly rates Scheme with all values > 0 including counsel costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |         100 |          100 | N             |          100 |                100.0 |                20 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                      |
      | 1 | Counsel fees cannot be claimed under Legal Help, except as a disbursement. |

  Scenario: Claims priced with: hourly rates Scheme with all others zero except for counsel cost
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |          100 | N             |            0 |                    0 |                 0 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                      |
      | 1 | Counsel fees cannot be claimed under Legal Help, except as a disbursement. |

  Scenario: Claims priced with: hourly rates Scheme with counsel cost zero , stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |         100 |            0 | Y             |          100 |                  100 |                20 | --           |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                     |
      | 1 | 010523/001 | £ 360.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£0)) + detention travel & waiting costs(£100) + disbursement(£100) + disbursement vat(£20) + vat on PC + DTW(£40) |

  Scenario: 2 - Claims priced with: hourly rates Scheme with detention travel & DB , Db vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |          100 |                  100 |                20 | --           |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                            |
      | 1 | 010523/001 | £ 120.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)(not allowed) + detention travel & waiting costs(£100) ignored as PC = 0 + disbursement(£100) + disbursement vat(£20) ) |

  Scenario: Claims priced with: hourly rates Scheme with all values zero , stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                    0 |                 0 | --           |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value  | Comment                                            |
      | 1 | 010523/001 | £ 0.00 | Priced at hourly rates zero as all values are zero |

  Scenario: 4 -  Claims priced with: hourly rates Scheme with PC  > 3000 without prior authority number stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                    0 |                 0 | --           |                     |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                     |
      | 1 | Prior Authority is required to exceed the profit cost limit for this type of work. Please enter a valid prior authority number or reduce your profit cost claim to the appropriate limit. |

  Scenario: 5 - Claims priced with: hourly rates Scheme with PC  > 3000 with prior authority number without PC vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | N             |            0 |                    0 |                 0 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 3,001.00 | Priced at hourly rates with PC > 3000 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with PC  > 3000 with prior authority number with PC vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                    0 |                 0 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                         |
      | 1 | 010523/001 | £ 3,601.20 | Priced at hourly rates with PC > 3000 as prior authority number is given  + vat |

  Scenario: 6 - Claims priced with: hourly rates Scheme with DB  > 1500 without prior authority number stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                 1501 |                 0 | --           |                     |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                 |
      | 1 | Prior Authority is required to exceed the disbursement financial limit for this type of work. Please enter a valid prior authority number or reduce your disbursement claim to the appropriate limit. |

  Scenario: Claims priced with: hourly rates Scheme with DB  > 1500 with prior authority number without Db vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 1,501.00 | Priced at hourly rates with DB > 1500 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with DB  > 1501 with prior authority number with PC vat stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                 1501 |                20 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 1,521.00 | Priced at hourly rates with DB > 1500 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with PC  > 3000 without prior authority number completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                    0 |                 0 |                     |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                     |
      | 1 | Prior Authority is required to exceed the profit cost limit for this type of work. Please enter a valid prior authority number or reduce your profit cost claim to the appropriate limit. |

  Scenario: Claims priced with: hourly rates Scheme with PC  > 3000 with prior authority number without PC vat completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        3001 |            0 | N             |            0 |                    0 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 3,001.00 | Priced at hourly rates with PC > 3000 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with PC  > 3000 with prior authority number with PC vat completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                    0 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 3,601.20 | Priced at hourly rates with PC > 3000 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with DB  > 1500 without prior authority number completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                 1501 |                 0 |                     |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                 |
      | 1 | Prior Authority is required to exceed the disbursement financial limit for this type of work. Please enter a valid prior authority number or reduce your disbursement claim to the appropriate limit. |

  Scenario: 7 - Claims priced with: hourly rates Scheme with DB  > 1500 with prior authority number without Db vat completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 1,501.00 | Priced at hourly rates with DB > 1500 as prior authority number is given |

  Scenario: Claims priced with: hourly rates Scheme with DB  > 1501 with prior authority number with PC vat completed matter claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |           0 |            0 | Y             |            0 |                 1501 |                20 | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 1,521.00 | Priced at hourly rates with DB > 1500 as prior authority number is given |

  Scenario: 8 - Claims priced with: hourly rates Scheme with PC  > 3000 and DB >1500 without prior authority number stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                 1501 |                 0 | --           |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                              | Description                                                                                                                                                                                           |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Profit Cost Validation         | Prior Authority is required to exceed the profit cost limit for this type of work. Please enter a valid prior authority number or reduce your profit cost claim to the appropriate limit.             |
      | IMMA:IMRN                   | 010523/001 | Person 001     | IMA 2023 Disbursement Amount Validation | Prior Authority is required to exceed the disbursement financial limit for this type of work. Please enter a valid prior authority number or reduce your disbursement claim to the appropriate limit. |

  Scenario: 9 - Claims priced with: hourly rates Scheme with PC > 3000 and DB  > 1500 with prior authority number stage claim
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | OUTCOME_CODE | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | SC         |      01/05/2023 |          01/08/2023 |        3001 |            0 | Y             |            0 |                 1501 |                 0 | --           | A000000             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                  |
      | 1 | 010523/001 | £ 5,102.20 | Priced at hourly rates with DB > 1500 as prior authority number is given |
