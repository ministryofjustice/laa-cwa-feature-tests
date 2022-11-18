Feature: Validation of Legal Aid Mental Health Stage/Level code MHL10

@delete_outcome_after @manual_submission @valid @mhl10 @mental_health
Scenario Outline: Validation of Legal Aid Mental Health. Able to select Stage/Level code MHL10 via manual input
Given user is on their "LEGAL HELP" submission details page
When user adds outcomes for "Legal Help" "Mental Health" with fields like this:
    | case_id | matter_type | case_start_date | case_stage_level | work_concluded_date | profit_cost |
    | 010     | MHDC:MCOM   | 01/01/2020      | MHL10            | 31/03/2020          | 50          |

Then the outcome saves successfully


@mhl10_validate @mental_health @mhl10
Scenario: For completed Matters MT1 value MHDC, when the new Case Stage/Level MHL10 is used, then
          the Designated Accredited Rep field must be null.

  Given a test firm user is logged in CWA
  And user prepares to submit outcomes for test provider "LEGAL HELP.MHE#11"
  Given the following Matter Types are chosen:
     | MHDC:MCOM |
  When the following outcomes are bulkloaded:
     | # | CASE_ID    | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | DESI_ACC_REP | MHT_REF_NUMBER |
     | 1 | 001        | CM         | 01/01/2020      | 31/03/2020          | MHL10            |              | AA/1234/12345  |
     | 2 | 002        | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 1            | AA/1234/12345  |
  Then the following results are expected:
     | # | ERROR_CODE_OR_MESSAGE      |
     | 1 | <none>                     |
     | 2 | You do not need to complete the Designated Accredited Representative field where you are not claiming a Level 3 Fee. This field should be left blank. |
