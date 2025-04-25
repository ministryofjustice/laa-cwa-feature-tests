@skip
Feature: claims validations for Illegal migration act miscllaneous

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | COUNSEL_COST |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |            0 |
      | 2 |     002 | 010323/002 | CM         |      01/03/2023 |          01/05/2023 | IB           |            1 |
      | 3 |     003 | 010323/003 | SC         |      01/03/2023 |          01/05/2023 | --           |            0 |
      | 4 |     004 | 010323/004 | SC         |      01/03/2023 |          01/06/2023 | --           |            1 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                      |
      | 1 | <none>                                                                     |
      | 2 | Counsel fees cannot be claimed under Legal Help, except as a disbursement. |
      | 3 | <none>                                                                     |
      | 4 | Counsel fees cannot be claimed under Legal Help, except as a disbursement. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                          |
      | 1 | -- may not be used where a completed claim is being submitted. |
