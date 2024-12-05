Feature: Validation for Prior authority number

  Scenario: PAN validation check for special characters and invalid format uisng bulkload
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When the following outcomes are bulkloaded:
      | #  | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      |  1 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | AP00000             |
      |  2 |     002 | 010523/002 | CM         | IA           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                  400 |                 0 | a000000             |
      |  3 |     003 | 010523/003 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                 2999 |                 0 | £000000             |
      |  4 |     004 | 010523/004 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | { } ~ DEL           |
      |  5 |     005 | 010523/005 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | !000000             |
      |  6 |     006 | 010523/006 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | "000000             |
      |  7 |     007 | 010523/007 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | #000000             |
      |  8 |     008 | 010523/008 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | $000000             |
      |  9 |     009 | 010523/009 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | %000000             |
      | 10 |     010 | 010523/010 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | &000000             |
      | 11 |     011 | 010523/011 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | ()000000            |
      | 12 |     012 | 010523/012 | CM         | IA           |      01/05/2023 |          01/09/2023 |           0 |            0 | N             |            0 |                   51 |                 0 | @000000             |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                   | Description                                                                                                           |
      | IMXL:IIRC                   | 010523/001 | Person 001     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/002 | Person 002     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/003 | Person 003     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/004 | Person 004     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/005 | Person 005     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/006 | Person 006     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/007 | Person 007     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/008 | Person 008     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/009 | Person 009     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/010 | Person 010     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/011 | Person 011     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |
      | IMXL:IIRC                   | 010523/012 | Person 012     | Priority Authority Reference | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |

  Scenario: PAN validation check for valid format uisng bulkload
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | A000000             |
    Then user should see the outcome results page
    And successful outcomes should equal 1

  Scenario: Claims priced with: hourly rates with 4 claims without PAN with DB threshold breached
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 |     001 | 010523/001 | CM         | IA           |      01/05/2023 |          30/05/2023 |           0 |            0 | N             |            0 |                 1000 |                 0 | a000000             |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                 |
      | 1 | The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number. |

  @delete_outcome_after @manual_submission
  Scenario Outline: Manual submission PAN validation
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | exemption_criteria_satisfied | work_concluded_date | prior_authority_ref |
      |     001 | IAXL:IDIF   |        25/04/22 | --           | PA00137          | AP00153      | TR001                        |            26/04/22 | a000000             |
    Then the outcome does not save and gives an error containing:
      """
      The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number.
      """

  @delete_outcome_after @manual_submission
  Scenario Outline: Manual submission PAN validation
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | exemption_criteria_satisfied | work_concluded_date | prior_authority_ref |
      |     001 | IAXL:IDIF   |        25/04/22 | --           | PA00137          | AP00153      | TR001                        |            26/04/22 | A00000              |
    Then the outcome does not save and gives an error containing:
      """
      The Prior Authority Reference number entered is incorrect. Please check again and enter the correct reference number.
      """

  @delete_outcome_after @manual_submission
  Scenario Outline: Manual submission PAN validation
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | exemption_criteria_satisfied | work_concluded_date | prior_authority_ref |
      |     001 | IAXL:IDIF   |        25/04/22 | --           | PA00137          | AP00153      | TR001                        |            26/04/22 | A000000             |
    Then user should see the outcome results page
