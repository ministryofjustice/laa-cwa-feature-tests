Feature: YOUY code Manual and Bulk load validations

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUY check for mandatory fields
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN | SCHEDULE_REF | CLIENT_FORENAME | GENDER | ETHNICITY | DISABILITY | STANDARD_FEE_CAT | PROFIT_COST | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | REP_ORDER_DATE | WORK_CONCLUDED_DATE | MAAT_ID | NO_OF_SUSPECTS | YOUTH_COURT | POLICE_STATION | NO_OF_POLICE_STATION |
      | 1 |     |              |                 |        |           |            |                  |             |              |                      |               |                      |                   |                |                     |         |                |             |                |                      |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type         | Description                     |
      | YOUY                        | OUTCOME VALIDATION | CLIENT_FORENAME is missing      |
      | YOUY                        | OUTCOME VALIDATION | DISABILITY is missing           |
      | YOUY                        | OUTCOME VALIDATION | DISBURSEMENTS_AMOUNT is missing |
      | YOUY                        | OUTCOME VALIDATION | DISBURSEMENTS_VAT is missing    |
      | YOUY                        | OUTCOME VALIDATION | ETHNICITY is missing            |
      | YOUY                        | OUTCOME VALIDATION | GENDER is missing               |
      | YOUY                        | OUTCOME VALIDATION | MAAT_ID is missing              |
      | YOUY                        | OUTCOME VALIDATION | NO_OF_POLICE_STATION is missing |
      | YOUY                        | OUTCOME VALIDATION | NO_OF_SUSPECTS is missing       |
      | YOUY                        | OUTCOME VALIDATION | POLICE_STATION is missing       |
      | YOUY                        | OUTCOME VALIDATION | PROFIT_COST is missing          |
      | YOUY                        | OUTCOME VALIDATION | REP_ORDER_DATE is missing       |
      | YOUY                        | OUTCOME VALIDATION | STANDARD_FEE_CAT is missing     |
      | YOUY                        | OUTCOME VALIDATION | TRAVEL_COSTS is missing         |
      | YOUY                        | OUTCOME VALIDATION | TRAVEL_WAITING_COSTS is missing |
      | YOUY                        | OUTCOME VALIDATION | UFN is missing                  |
      | YOUY                        | OUTCOME VALIDATION | VAT_INDICATOR is missing        |
      | YOUY                        | OUTCOME VALIDATION | WORK_CONCLUDED_DATE is missing  |
      | YOUY                        | OUTCOME VALIDATION | YOUTH_COURT is missing          |

  Scenario: bulkload Crime Lower stage reached code YOUY validation check for rep order date not earlier to UFN date and profit cost is zero
    is invalid for YOUY

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION |
      | 1 | 061224/001 |     05/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |
      | 2 | 051224/002 |     05/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUY                        | LAR Validation4 | The Representation Order Date must not be before UFN Date. Please enter a valid date.                                     |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for 1a - Higher / YOUY matters. Please enter a valid fee in the profit costs field. |

  Scenario: bulkload Crime Lower stage reached code YOUY validation check for duplicate UFN
    is invalid for YOUY

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |     06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 |
      | 2 | 061224/001 |     06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 |
    Then user should see the outcome results page
    And duplicate outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type               | Description                                                                                                                                                                                                                |
      | YOUY                        | Crime UFN Dup Validation | The UFN you have entered has been used for a previous YOUY outcome reported under this office account number 0P251D. Please enter a unique UFN number. You may need to change the Case ID to ensure that the UFN is valid. |

  Scenario: Bulkload Crime Lower stage reached code YOUY validation check UFN can be before active date
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |     06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 |
    Then user should see the outcome results page
    And successful outcomes should equal 1
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Bulkload Crime Lower stage reached code YOUY validation check rep order date has to be on or after 06/12/2024 which is the pricing scheme date in tst
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 051224/001 |     05/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for 1a - Higher / YOUY matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUY validation check if wrong standard fee category is used
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |     06/12/2024 |              1EW |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                                          |
      | YOUY                        | VALIDATION4     |                                                                                                  1EW is not a valid STANDARD_FEE_CAT |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for Category 1: Either Way / YOUY matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUY VALIDATION4 check for YOUY with wrong profit cost values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 061224/001 |      06/12/2024 |           1A-LSF |           06/12/2024 | Y           | C1013          |                        1 |      822.48 | Y             |            0 |                    0 |                  100 |                20 |
      | 2 | 061224/002 |      06/12/2024 |           1B-LSF |           06/12/2024 | Y           | C1013          |                        1 |      182.02 | Y             |            0 |                    0 |                  100 |                20 |
      | 3 | 061224/003 |      06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |      919.97 | Y             |            0 |                    0 |                  100 |                20 |
      | 4 | 061224/004 |      06/12/2024 |           1B-HSF |           06/12/2024 | Y           | C1013          |                        1 |      321.38 | Y             |            0 |                    0 |                  100 |                20 |
    Then user should see the outcome results page
    And problem outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for 1a - Lower / YOUY matters. Please enter a valid fee in the profit costs field.  |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for 1b - Lower / YOUY matters. Please enter a valid fee in the profit costs field.  |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for 1a - Higher / YOUY matters. Please enter a valid fee in the profit costs field. |
      | YOUY                        | LAR Validation8 | The fee you have entered is not valid for 1b - Higher / YOUY matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUY validation check if DSSC format is validated
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | DSCC_NUMBER |
      | 1 | 061224/001 |     06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 |       12345 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type  | Description                                                                                                                                                              |
      | YOUY                        | DSCC NUMBER | The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field. |

  Scenario: Bulkload Crime Lower stage reached code YOUY validation check if MAAT ID is mandatory
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUY |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | MAAT_ID |
      | 1 | 061224/001 |     06/12/2024 |           1A-HSF |           06/12/2024 | Y           | C1013          |                        1 |     1141.17 | A       |
    Then user should see the outcome results page
    And the invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type  | Description                         |
      | YOUY                        | VALIDATION8 | Value :A is not valid for : MAAT_ID |
