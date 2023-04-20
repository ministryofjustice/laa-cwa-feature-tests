Feature: INVA code Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#8"
    Given the following Matter Types are chosen:
    | INVA |

  @cn13
  Scenario: Bulkoad Crime Lower stage reached code INVM with case outcome code CN13
              NOTE: For correct testing, start_date_active for outcome code CN13 in lookup
                    has to be temporarily set to 01-Oct-2021, and reset to 01-Oct-2022 after testing.

  And the following outcomes are bulkloaded:
   | # | UFN        | OUTCOME_CODE | WORK_CONCLUDED_DATE | youth_court |
 #  | 1 | 011022/001 | CN12         | 02/10/2022          | N           |  # Uncomment this line after 2nd Oct 2022
  | 1 | 011021/001 | CN03         | 02/10/2021          | Y           |   # Delete this line after 2nd Oct 2022
#   | 2 | 011021/001 | CN13         | 02/10/2021          | N           |
  Then the following results are expected:
   | # | ERROR_CODE_OR_MESSAGE            |
   | 1 | <none>                           |
#   | 2 | OUTCOME_CODE CN13 is only valid for case start date on or after 01/Oct/2022 |
