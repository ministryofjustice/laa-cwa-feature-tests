Feature: Pricing: IMMA: Illegal Immigration Act

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 17 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 18 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 19 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        2000 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |        1001 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        2000 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 3 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |        1000 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  400 |                 0 |                     |
      | 3 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                 5000 |                 0 |                     |
      | 4 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 16 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          04/05/2023 |        2001 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          05/08/2023 |           0 |            0 | N             |            0 |                  300 |                 0 |                     |
      | 3 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/12/2023 |           0 |            0 | N             |            0 |                  101 |                 0 |                     |
      | 4 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/09/2023 |        1000 |            0 | N             |            0 |                  100 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                 1501 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          05/08/2023 |           0 |            0 | N             |            0 |                  401 |                 0 | A000000             |
      | 3 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          06/12/2023 |           0 |            0 | N             |            0 |                  100 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           1 |            0 | N             |            0 |                    0 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/09/2023 |           0 |            1 | N             |            0 |                    0 |                 0 |                     |
      | 3 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3000 |            0 | N             |            0 |                 1500 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                 1501 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |        3001 |            0 | N             |            0 |                 1501 |                 0 |                     |
      | 2 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                    0 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 10 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  501 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 11 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  501 |                 0 | A000000             |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 12 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
      | 2 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  501 |                 0 | A000000             |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 13 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  501 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 14 -  Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 |                     |
      | 2 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          05/08/2023 |           0 |            0 | N             |            0 |                  401 |                 0 |                     |
      | 3 |     001 | 010523/001 | DC         | --           |      01/05/2023 |          06/12/2023 |           0 |            0 | N             |            0 |                  100 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 15 - Claims priced with: hourly rates with detention travel & waiting costs
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | SC         | --           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 5000 |                 0 |                     |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |
