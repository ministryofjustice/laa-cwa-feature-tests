Feature: Db claims test for consice elements(prod bug)

  Scenario: Disbursement claim for IMMA:IMRN with relevant fields only
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#19"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |           0 |            0 | N             |            0 |                 1501 |                 0 | A000000             |
    Then there should be no problem outcomes
    Then user confirms the submission

Scenario: Disbursement claim for IAXL:IBAI with relevant fields only
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#19"
    Given the following Matter Types are chosen:
      | IAXL:IBAI |
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | OUTCOME_CODE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | TRAVEL_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | PRIOR_AUTHORITY_REF |
      | 1 | 010523/001 | DC         | --           |      01/05/2023 |          01/08/2023 |          100|            0 | N             |            0 |                 1501 |                 0 | A000000             |
    Then there should be no problem outcomes
    Then user confirms the submission
