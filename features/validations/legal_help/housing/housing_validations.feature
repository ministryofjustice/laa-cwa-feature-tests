Feature: Housing Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

  Scenario: Bulkload Civil Housing outcomes with CASE_START_DATE on 1 April 2013
    The following Matter Types are valid only from 01/04/2013 with an ECF
    When user bulkloads outcomes for "Legal Help" "Housing" with fields like this:
      | MATTER_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF | OUTCOME_CODE | STAGE_REACHED |
      | HBFT:HHAC   | 01/04/2013      | PA20000 | AP20000 | 1234567AB | HA | HB |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE          |
      | 1 | <none>                         |
