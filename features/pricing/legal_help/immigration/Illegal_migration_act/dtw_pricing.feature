Feature: Validation for Illegal Immigration Act

  Scenario Outline:  IAXL:IDAS pricing before start date 14 dec 2023. Testing pricing for effective date for DTW pricing.
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | work_concluded_date | claim_type | profit_cost | counsel_cost | disbursements_amount | disbursements_vat | vat_indicator | travel_costs |
      |     001 | IAXL:IDAS   |      01/05/2023 |          01/08/2023 | CM         |         100 |            0 |                  100 |                20 | N             |          100 |
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                          |
      | 1 | 010523/001 | £ 220.00 | Priced at hourly rates (profit cost(£10) +  counsel cost(£0)) + disbursement vat(£1500) + disbursement vat(£300) |

  Scenario: IAXL:IDAS pricing before start date 14 dec 2023. Testing pricing for effective date for DTW pricing.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |         100 |          100 | Y             |               100.00 |                20 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |          100 |         100 |          100 | N             |               100.00 |                20 | TR001                        |
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                          |
      | 1 | 010523/001 | £ 220.00 | Priced at hourly rates (profit cost(£10) +  counsel cost(£0)) + disbursement vat(£1500) + disbursement vat(£300) |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |         100 |          100 | Y             |               100.00 |                20 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |              |         100 |          100 | N             |               100.00 |                20 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |           0 |          100 | Y             |               100.00 |                20 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |          100 |           0 |          100 | N             |               100.00 |                20 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |         100 |          100 | Y             |                    0 |                 0 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |          100 |         100 |          100 | N             |                    0 |                 0 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |         100 |          100 | Y             |                  100 |                 0 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |              |         100 |          100 | N             |                  100 |                 0 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |         100 |          100 | Y             |                    0 |                 0 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |              |         100 |          100 | N             |                    0 |                 0 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |           0 |            0 | Y             |                  100 |                 0 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |              |           0 |            0 | N             |                  100 |                 0 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |           0 |            0 | Y             |                    0 |                 0 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |          100 |           0 |            0 | N             |                    0 |                 0 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |           0 |          100 | Y             |                    0 |                 0 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |          100 |           0 |          100 | N             |                    0 |                 0 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 131223/001 | CM         |      13/12/2023 |          15/12/2023 | IX           |          100 |         100 |          100 | Y             |               100.00 |                20 | TR001                        |
      | 2 |     002 | 131223/002 | SC         |      13/12/2023 |          15/12/2023 | --           |          100 |         100 |          100 | N             |               100.00 |                20 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 131223/001 | CM         |      13/12/2023 |          15/12/2023 | IX           |          100 |           0 |            0 | Y             |               100.00 |                20 | TR001                        |
      | 2 |     002 | 131223/002 | SC         |      13/12/2023 |          15/12/2023 | --           |          100 |           0 |            0 | N             |               100.00 |                20 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Completed matter claim priced with: hourly rates Scheme with pc and zero cc ,with disbursement and disbursement vat
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |          10 |            0 | N             |               1500.0 |               300 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                          |
      | 1 | 010523/001 | £ 1,810.00 | Priced at hourly rates (profit cost(£10) +  counsel cost(£0)) + disbursement vat(£1500) + disbursement vat(£300) |
