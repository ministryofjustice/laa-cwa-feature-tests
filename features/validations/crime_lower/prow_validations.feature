Feature: PROW code Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#7"
    Given the following Matter Types are chosen:
    | PROW |

  @XXLSC_TEST_CURRENT_SUBMISSION_PERIOD
   Scenario: Bulkload PROW code outcomes with REP_ORDER_DATE after system date or XXLSC_TEST_CURRENT_SUBMISSION_PERIOD
    And set system date to tomorrow
    And the following outcomes are bulkloaded:
      | # | UFN        |
      | 1 | 070923/001 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE      |
      | 1 | The Representation Order Date must not be after today's date. Please enter a valid value. |
    And reset system date

  Scenario: Bulkload PROW code outcomes with REP_ORDER_DATE around 19 October 2020
    And the following outcomes are bulkloaded:
     | # | UFN        | REP_ORDER_DATE | WORK_CONCLUDED_DATE |
     | 1 | 181020/001 | 19/10/2020     | 20/10/2020          |
     | 2 | 181020/002 | 18/10/2020     | 20/10/2020          |
    Then the following results are expected:
     | # | ERROR_CODE_OR_MESSAGE      |
     | 1 | <none>                     |
     | 2 | The Representation Order Date must be on or after 19/10/2020. Please enter a valid value. |

  Scenario: Bulkoad Crime Lower outcomes with REP_ORDER_DATE between the UFN date and the WORK_CONCLUDED_DATE
   And the following outcomes are bulkloaded:
    | # | UFN        | REP_ORDER_DATE | WORK_CONCLUDED_DATE |
    | 1 | 181020/001 | 19/10/2020     | 20/10/2020          |
    | 2 | 201020/002 | 19/10/2020     | 20/10/2020          |
    | 3 | 181020/003 | 19/10/2020     | 18/10/2020          |
  Then the following results are expected:
    | # | ERROR_CODE_OR_MESSAGE      |
    | 1 | <none>                     |
    | 2 | The Representation Order Date must not be before UFN Date. Please enter a valid date. |
    | 3 | The Representation Order Date must be before the case concluded date. Please enter a valid value. |

  Scenario: Bulkoad Crime Lower outcomes with no FEECATEGORY
  And the following outcomes are bulkloaded:
   | # | UFN        | REP_ORDER_DATE | WORK_CONCLUDED_DATE | STANDARD_FEE_CAT |
   | 1 | 181020/001 | 19/10/2020     | 20/10/2020          | <blank>          |
  Then the following results are expected:
   | # | ERROR_CODE_OR_MESSAGE                                                                                     |
   | 1 | Standard Fee Category must be entered for cases with a Representation Order Date on or after 03-Oct-2011. |

 Scenario: Bulkoad Crime Lower outcomes with REP_ORDER_DATE is NULL
 And the following outcomes are bulkloaded:
  | # | UFN        | REP_ORDER_DATE | WORK_CONCLUDED_DATE |
  | 1 | 181020/001 | <blank>        | 20/10/2020          |
 Then the following results are expected:
  | # | ERROR_CODE_OR_MESSAGE      |
  | 1 | REP_ORDER_DATE is missing |

Scenario: Bulkoad Crime Lower outcomes with DSCC NUMBER
And the following outcomes are bulkloaded:
 | # | UFN        | REP_ORDER_DATE | WORK_CONCLUDED_DATE | DSCC_NUMBER |
 | 1 | 181020/001 | 19/10/2020        | 20/10/2020       | <blank>     |
 | 2 | 181020/002 | 19/10/2020        | 20/10/2020       | 12345       |
 | 3 | 181020/003 | 19/10/2020        | 20/10/2020       | 201012345A  |
Then the following results are expected:
 | # | ERROR_CODE_OR_MESSAGE      |
 | 1 | <none>                     |
 | 2 | The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field. |
 | 3 | <none>                     |

 Scenario: Bulkoad Crime Lower outcomes with MAAT_ID
 And the following outcomes are bulkloaded:
  | # | UFN        | REP_ORDER_DATE    | WORK_CONCLUDED_DATE | MAAT_ID     |
  | 1 | 181020/001 | 19/10/2020        | 20/10/2020          | <blank>     |
  | 2 | 181020/002 | 19/10/2020        | 20/10/2020          | 12345       |
  | 3 | 181020/003 | 19/10/2020        | 20/10/2020          | 201012345A  |
 Then the following results are expected:
  | # | ERROR_CODE_OR_MESSAGE      |
  | 1 | MAAT_ID is missing |
  | 2 | <none>                     |
  | 3 | Value :201012345A is not valid for : MAAT_ID |
