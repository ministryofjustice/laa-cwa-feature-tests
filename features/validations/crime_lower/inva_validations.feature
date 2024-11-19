Feature: INVA code Bulk load validations

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#8"
    Given the following Matter Types are chosen:
      | INVA |

  @cn13
  Scenario: bulkload Crime Lower stage reached code INVA with case outcome code CN12, CN13
  Codes CN12 and CN13 are invalid for INVA for any start date

    And the following outcomes are bulkloaded:
      | # | UFN        | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT |
      | 1 | 011021/001 | CN12         |          01/10/2021 | N           |
      | 2 | 011022/002 | CN13         |          01/10/2022 | N           |
      | 3 | 011021/003 | CN13         |          01/10/2021 | N           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE            |
      | 1 | CN12 is not a valid OUTCOME_CODE |
      | 2 | CN13 is not a valid OUTCOME_CODE |
      | 3 | CN13 is not a valid OUTCOME_CODE |
