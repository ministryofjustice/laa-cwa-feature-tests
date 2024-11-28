@bulkload
Feature: INVM code Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#8"
    Given the following Matter Types are chosen:
    | INVM |

  Scenario: Bulkload INVM code outcomes, validating UFN date component and WORK_CONCLUDED_DATE
    And the following outcomes are bulkloaded:
     | # | UFN        | WORK_CONCLUDED_DATE |
     | 1 | 181020/001 | 20/10/2020          |
     | 2 | 211020/002 | 20/10/2020          |
     | 3 | 211020/003 | 20/14/2020          |
    Then the following results are expected:
     | # | ERROR_CODE_OR_MESSAGE      |
     | 1 | <none>                     |
     | 2 | The Case Concluded Date entered is not valid - It must be after the Case Start Date/date element of the UFN, not after today and for Civil cases after the clients date of birth |
     | 3 | Stage:330,ORA-01843: not a valid month |

  Scenario: bulkload Crime Lower stage reached code INVM with case outcome codes
   And the following outcomes are bulkloaded:
    | # | UFN        | OUTCOME_CODE |
    | 1 | 181020/001 | CN01         |
    | 2 | 181020/002 | CN02         |
    | 3 | 181020/003 | CN03         |
    | 4 | 181020/004 | CN04         |
    | 5 | 181020/005 | CN05         |
    | 6 | 181020/006 | CN06         |
    | 7 | 181020/007 | CN07         |
    | 8 | 181020/008 | CN08         |
    | 9 | 181020/009 | CN09         |
    | 10 | 181020/010 | CN10         |
    | 11 | 181020/011 | CN11         |
    | 12 | 181020/012 | CN12         |
    | 13 | 201020/013 | CP27         |
    | 14 | 181020/014 | <blank>      |
  Then the following results are expected:
    | # | ERROR_CODE_OR_MESSAGE      |
    | 1 | <none>                     |
    | 2 | <none>                     |
    | 3 | CN03 is not a valid OUTCOME_CODE |
    | 4 | <none>                     |
    | 5 | <none>                     |
    | 6 | <none>                     |
    | 7 | <none>                     |
    | 8 | <none>                     |
    | 9 | <none>                     |
    | 10 | CN10 is not a valid OUTCOME_CODE |
    | 11 | CN11 is not a valid OUTCOME_CODE |
    | 12 | <none>                     |
    | 13 | CP27 is not a valid OUTCOME_CODE |
    | 14 | OUTCOME_CODE is missing          |

Scenario: bulkload Crime Lower outcomes with DSCC NUMBER
And the following outcomes are bulkloaded:
 | # | UFN        | DSCC_NUMBER |
 | 1 | 181020/001 | <blank>     |
 | 2 | 181020/002 | 12345       |
 | 3 | 181020/003 | 201012345A  |
Then the following results are expected:
 | # | ERROR_CODE_OR_MESSAGE      |
 | 1 | <none>                     |
 | 2 | The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field. |
 | 3 | <none>                     |

 Scenario: bulkload Crime Lower outcomes with SCHEME_ID
 And the following outcomes are bulkloaded:
  | # | UFN        | SCHEME_ID |
  | 1 | 181020/001 | <blank>   |
  | 2 | 181020/002 | 2004      |
  | 3 | 181020/003 | 12345XXXXX |
 Then the following results are expected:
  | # | ERROR_CODE_OR_MESSAGE      |
  | 1 | SCHEME_ID is missing       |
  | 1 | <none>                     |
  | 1 | 12345XXXXX is not a valid SCHEME_ID |
