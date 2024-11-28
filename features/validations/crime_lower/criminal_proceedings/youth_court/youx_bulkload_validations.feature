Feature: YOUX code Manual and Bulk load validations

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX check for mandatory fields
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN | SCHEDULE_REF | CLIENT_FORENAME | GENDER | ETHNICITY | DISABILITY | STANDARD_FEE_CAT | PROFIT_COST | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | REP_ORDER_DATE | WORK_CONCLUDED_DATE | MAAT_ID | NO_OF_SUSPECTS | YOUTH_COURT | POLICE_STATION | NO_OF_POLICE_STATION |
      | 1 |     |              |                 |        |           |            |                  |             |              |                      |               |                      |                   |                |                     |         |                |             |                |                      |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type         | Description                     |
      | YOUX                        | OUTCOME VALIDATION | CLIENT_FORENAME is missing      |
      | YOUX                        | OUTCOME VALIDATION | DISABILITY is missing           |
      | YOUX                        | OUTCOME VALIDATION | DISBURSEMENTS_AMOUNT is missing |
      | YOUX                        | OUTCOME VALIDATION | DISBURSEMENTS_VAT is missing    |
      | YOUX                        | OUTCOME VALIDATION | ETHNICITY is missing            |
      | YOUX                        | OUTCOME VALIDATION | GENDER is missing               |
      | YOUX                        | OUTCOME VALIDATION | MAAT_ID is missing              |
      | YOUX                        | OUTCOME VALIDATION | NO_OF_POLICE_STATION is missing |
      | YOUX                        | OUTCOME VALIDATION | NO_OF_SUSPECTS is missing       |
      | YOUX                        | OUTCOME VALIDATION | POLICE_STATION is missing       |
      | YOUX                        | OUTCOME VALIDATION | PROFIT_COST is missing          |
      | YOUX                        | OUTCOME VALIDATION | REP_ORDER_DATE is missing       |
      | YOUX                        | OUTCOME VALIDATION | STANDARD_FEE_CAT is missing     |
      | YOUX                        | OUTCOME VALIDATION | TRAVEL_COSTS is missing         |
      | YOUX                        | OUTCOME VALIDATION | TRAVEL_WAITING_COSTS is missing |
      | YOUX                        | OUTCOME VALIDATION | UFN is missing                  |
      | YOUX                        | OUTCOME VALIDATION | VAT_INDICATOR is missing        |
      | YOUX                        | OUTCOME VALIDATION | WORK_CONCLUDED_DATE is missing  |
      | YOUX                        | OUTCOME VALIDATION | YOUTH_COURT is missing          |

  Scenario: bulkload Crime Lower stage reached code YOUX validation check for rep order date not earlier to UFN date and profit cost is zero
    is invalid for YOUX

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION |
      | 1 | 010924/001 |     31/08/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |
      | 2 | 310824/002 |     31/08/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUX                        | LAR Validation4 | The Representation Order Date must not be before UFN Date. Please enter a valid date.                                     |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUX matters. Please enter a valid fee in the profit costs field. |

  Scenario: bulkload Crime Lower stage reached code YOUX validation check for duplicate UFN
    is invalid for YOUX

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 010924/001 |     01/09/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |
      | 2 | 010924/001 |     01/09/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And duplicate outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type               | Description                                                                                                                                                                                                                |
      | YOUX                        | Crime UFN Dup Validation | The UFN you have entered has been used for a previous YOUX outcome reported under this office account number 0P251D. Please enter a unique UFN number. You may need to change the Case ID to ensure that the UFN is valid. |

  Scenario: Bulkload Crime Lower stage reached code YOUX validation check UFN can be before active date
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 311223/001 |     01/09/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And successful outcomes should equal 1
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Bulkload Crime Lower stage reached code YOUX validation check rep order date has to be after 01/01/2024 which is the pricing scheme date in tst
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 311223/001 |     31/12/2023 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUX matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUX validation check if wrong standard fee category is used
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 311223/001 |     01/09/2024 |              1EW |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                                          |
      | YOUX                        | VALIDATION4     |                                                                                                  1EW is not a valid STANDARD_FEE_CAT |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 1: Either Way / YOUX matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUX VALIDATION4 check for YOUX with wrong profit cost values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT  WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010924/001 |      01/9/2024 |       1a - Lower            01/9/2024 | Y           | C1013          |                        1 |      822.48 | Y             |            0 |                    0 |                  100 |                20 |
      | 2 | 010924/002 |      01/9/2024 |        1b - Lower           01/9/2024 | Y           | C1013          |                        1 |      182.02 | Y             |            0 |                    0 |                  100 |                20 |
      | 3 | 010924/003 |      01/9/2024 |       1a - Higher           01/9/2024 | Y           | C1013          |                        1 |      919.97 | Y             |            0 |                    0 |                  100 |                20 |
      | 4 | 010924/004 |      01/9/2024 |      1b - Higher            01/9/2024 | Y           | C1013          |                        1 |      321.38 | Y             |            0 |                    0 |                  100 |                20 |
    Then user should see the outcome results page
    And problem outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUX matters. Please enter a valid fee in the profit costs field. |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 1B / YOUX matters. Please enter a valid fee in the profit costs field. |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 2A / YOUX matters. Please enter a valid fee in the profit costs field. |
      | YOUX                        | LAR Validation8 | The fee you have entered is not valid for Category 2B / YOUX matters. Please enter a valid fee in the profit costs field. |

  Scenario: Bulkload Crime Lower stage reached code YOUX validation check if DSSC format is validated
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | DSCC_NUMBER |
      | 1 | 311223/001 |     01/09/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |      822.47 |       12345 |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type  | Description                                                                                                                                                              |
      | YOUX                        | DSCC NUMBER | The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field. |

  Scenario: Bulkload Crime Lower stage reached code YOUX validation check if MAAT ID is mandatory
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST | MAAT_ID |
      | 1 | 311223/001 |     01/09/2024 |      1a - Higher |           01/9/2024 | Y           | C1013          |                        1 |      822.47 | A       |
    Then user should see the outcome results page
    And the invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | Error Type  | Description                         |
      | YOUX                        | VALIDATION8 | Value :A is not valid for : MAAT_ID |

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUX with case outcome code CP19
    is invalid for YOUX

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#25"
    Given the following Matter Types are chosen:
      | YOUX |
    And the following outcomes are bulkloaded:
      | # | UFN        | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION |
      | 1 | 010924/001 |           01/9/2024 | Y           | C1013          |                        1 |
    Then the outcome saves successfully
