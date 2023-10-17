Feature: Pricing: IMMA: Illegal Immigration Act

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |

  Scenario: Claims priced with: hourly rates Scheme with detention travel & waiting costs without JR form filling cost
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | JR_FORM_FILLING |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |         200 |           28 | N             |        10000 |             100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                    |
      | 1 | 010523/001 | £ 10,228.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) + detention travel & waiting costs(£10000) |

  Scenario: Claims priced with: hourly rates Scheme with zero pc and cc , detention travel & waiting costs without JR form filling cost
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | JR_FORM_FILLING |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |         0 |           0    | N             |        10000 |             100 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                    |
      | 1 | 010523/001 | £ 10,000.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + detention travel & waiting costs(£10000) |

  Scenario: Claims priced with: hourly rates Scheme with disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | DISBURSEMENTS_AMOUNT | VAT_INDICATOR |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        5000 |         4000 |               4000.0 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                  |
      | 1 | 010523/001 | £ 13,000.00 | Priced at hourly rates profit cost(£5000) +  counsel cost(£4000) + disbursements amount(£4000) = £13,000 |

  Scenario: Claims priced with: Additional Payments though not entitiled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        5000 |         4000 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                                                                                                    |
      | 1 | 010523/001 | £ 9,000.00 | Priced at hourly rates Profit_Cost(£5000) + Counsel_Cost(£4000) = £9000, ignoring additional payments as code is not entitiled for additional payments CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) = null |

  Scenario: Claims priced with: hourly rates Scheme with disbursements and disbursements_vat
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | VAT_INDICATOR |
      | 1 | 010523/001 | CM         |      01/04/2013 |          01/08/2023 |         500 |          400 |                100.0 |                20 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                       |
      | 1 | 010523/001 | £ 1,020.00 | Priced at hourly rates profit cost(£500) +  counsel cost(£400) + disbursements amount(£100) + disbursements_vat(£20) = £1,020 |

  Scenario: Claims priced with: hourly rates with VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |         200 |           28 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                      |
      | 1 | 010523/001 | £ 273.60 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28) + vat(45.6))) |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |        2000 |         3000 | Y             |        10000 |               1000.0 |               200 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                                                                                            |
      | 1 | 010523/001 | £ 19,200.00 | Priced at hourly rates (profit cost(£2000) +  counsel cost(£3000) +  detention travel & waiting costs(£10000) + vat(£3000))) + disbursement amount(£1000) + disbursement vat(£200) |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | SC         | --           |      01/05/2023 |          01/08/2023 |        2000 |         3000 | Y             |        10000 |               1000.0 |               200 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                                                                                            |
      | 1 | 010523/001 | £ 19,200.00 | Priced at hourly rates (profit cost(£2000) +  counsel cost(£3000) +  detention travel & waiting costs(£10000) + vat(£3000))) + disbursement amount(£1000) + disbursement vat(£200) |

  Scenario: Claims priced with: hourly rates
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | HO_INTERVIEW |
      | 1 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |               1000.0 |               200 |            3 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                              |
      | 1 | 010523/001 | £ 1,200.00 | Priced at hourly rates (disbursement amount(£1000) + disbursement vat(£200)) = £1200 |

  Scenario: Claims priced with: hourly rates Scheme without NRM advice
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | NATIONAL_REF_MECHANISM_ADVICE | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          20/05/2023 |         200 |           28 | N             | Y                             |           10 |                   10 |                 2 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                         |
      | 1 | 010523/001 | £ 250.00 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) - NRM_ADVICE Bolt On fee (£150) |

  Scenario: Claims priced with: hourly rates Scheme without NRM advice, IRC work, JR_FORM_FILLING
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | NATIONAL_REF_MECHANISM_ADVICE | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | IRC_SURGERY | JR_FORM_FILLING |
      | 1 | 010523/001 | CM         |      01/05/2023 |          20/05/2023 |         200 |           28 | Y             | Y                             |           10 |                   10 |                 2 | Y           |              10 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                                                 |
      | 1 | 010523/001 | £ 297.60 | Priced at hourly rates (profit cost(£200) +  counsel cost(£28)) - NRM_ADVICE Bolt On fee (£150) + detention travel & waiting costs(£10) + vat(£47.60) + disbursement amount(£10) + disbursement vat(£2) |
