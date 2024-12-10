Feature: YOUE code Manual and Bulk load validations

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUE check for mandatory fields
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN | SCHEDULE_REF | OUTCOME_CODE | CLIENT_FORENAME | GENDER | ETHNICITY | DISABILITY | STANDARD_FEE_CAT | PROFIT_COST | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | CRIME_MATTER_TYPE | REP_ORDER_DATE | WORK_CONCLUDED_DATE | MAAT_ID | NO_OF_SUSPECTS | YOUTH_COURT | POLICE_STATION | NO_OF_POLICE_STATION |
      | 1 |     |              |              |                 |        |           |            |                  |             |              |                      |               |                      |                   |                   |                |                     |         |                |             |                |                      |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type         | Description                     |
      | YOUE                        | OUTCOME VALIDATION | CLIENT_FORENAME is missing      |
      | YOUE                        | OUTCOME VALIDATION | CRIME_MATTER_TYPE is missing    |
      | YOUE                        | OUTCOME VALIDATION | DISABILITY is missing           |
      | YOUE                        | OUTCOME VALIDATION | DISBURSEMENTS_AMOUNT is missing |
      | YOUE                        | OUTCOME VALIDATION | DISBURSEMENTS_VAT is missing    |
      | YOUE                        | OUTCOME VALIDATION | ETHNICITY is missing            |
      | YOUE                        | OUTCOME VALIDATION | GENDER is missing               |
      | YOUE                        | OUTCOME VALIDATION | MAAT_ID is missing              |
      | YOUE                        | OUTCOME VALIDATION | NO_OF_POLICE_STATION is missing |
      | YOUE                        | OUTCOME VALIDATION | NO_OF_SUSPECTS is missing       |
      | YOUE                        | OUTCOME VALIDATION | OUTCOME_CODE is missing         |
      | YOUE                        | OUTCOME VALIDATION | POLICE_STATION is missing       |
      | YOUE                        | OUTCOME VALIDATION | PROFIT_COST is missing          |
      | YOUE                        | OUTCOME VALIDATION | REP_ORDER_DATE is missing       |
      | YOUE                        | OUTCOME VALIDATION | STANDARD_FEE_CAT is missing     |
      | YOUE                        | OUTCOME VALIDATION | TRAVEL_COSTS is missing         |
      | YOUE                        | OUTCOME VALIDATION | TRAVEL_WAITING_COSTS is missing |
      | YOUE                        | OUTCOME VALIDATION | UFN is missing                  |
      | YOUE                        | OUTCOME VALIDATION | VAT_INDICATOR is missing        |
      | YOUE                        | OUTCOME VALIDATION | WORK_CONCLUDED_DATE is missing  |
      | YOUE                        | OUTCOME VALIDATION | YOUTH_COURT is missing          |

  Scenario: bulkload Crime Lower stage reached code YOUE validation check for rep order date not earlier to UFN date and profit cost is zero
    is invalid for YOUE

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION |
      | 1 | 061224/001 |     05/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |
      | 2 | 061224/002 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUE                        | LAR Validation4 | The Representation Order Date must not be before UFN Date. Please enter a valid date.                                     |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUE matters. Please enter a valid fee in the profit costs field. |

  Scenario: bulkload Crime Lower stage reached code YOUE validation check for duplicate UFN
    is invalid for YOUE

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 |
      | 2 | 061224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And duplicate outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type               | Description                                                                                                                                                                                                                |
      | YOUE                        | Crime UFN Dup Validation | The UFN you have entered has been used for a previous YOUE outcome reported under this office account number 0P251D. Please enter a unique UFN number. You may need to change the Case ID to ensure that the UFN is valid. |

  Scenario: Bulkload Crime Lower stage reached code YOUE validation check UFN can be before active date
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 051224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And successful outcomes should equal 1
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Bulkload Crime Lower stage reached code YOUE validation check rep order date has to be after 01/01/2024 which is the pricing scheme date in tst
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 051224/001 |     05/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUE matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUE validation check if wrong standard fee category is used
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |     06/12/2024 |              1EW | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                                          |
      | YOUE                        | VALIDATION4     |                                                                                                  1EW is not a valid STANDARD_FEE_CAT |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 1: Either Way / YOUE matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUE VALIDATION4 check for YOUE with wrong profit cost values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 061224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.48 | Y             |            0 |                    0 |                  100 |                20 |
      | 2 | 061224/002 |     06/12/2024 |               1B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      182.02 | Y             |            0 |                    0 |                  100 |                20 |
      | 3 | 061224/003 |     06/12/2024 |               2A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      919.97 | Y             |            0 |                    0 |                  100 |                20 |
      | 4 | 061224/004 |     06/12/2024 |               2B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      321.38 | Y             |            0 |                    0 |                  100 |                20 |
    Then user should see the outcome results page
    And problem outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUE matters. Please enter a valid fee in the profit costs field. |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 1B / YOUE matters. Please enter a valid fee in the profit costs field. |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 2A / YOUE matters. Please enter a valid fee in the profit costs field. |
      | YOUE                        | LAR Validation8 | The fee you have entered is not valid for Category 2B / YOUE matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUE validation check if DSSC format is validated
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | DSCC_NUMBER |
      | 1 | 051224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 |       12345 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type  | Description                                                                                                                                                              |
      | YOUE                        | DSCC NUMBER | The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field. |

  Scenario: Bulkload Crime Lower stage reached code YOUE validation check if MAAT ID is mandatory
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUE |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | MAAT_ID |
      | 1 | 051224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      822.47 | A       |
    Then user should see the outcome results page
    And the invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type  | Description                         |
      | YOUE                        | VALIDATION8 | Value :A is not valid for : MAAT_ID |
