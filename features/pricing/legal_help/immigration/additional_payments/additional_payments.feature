Feature: Pricing: Additioanal payments

  Background: 
    Given a test firm user is logged in CWA

  Scenario: Claims priced with: Standard Fee Scheme
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMCB:IEMP |
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010708/001 | CM         |      01/07/2008 |          02/10/2011 |         228 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                                                        |
      | 1 | 010708/001 | £ 1,230.00 | Standard fee for IMCB for start date and end date above (£504) + Additional payments w.r.t start and end dates (CMRH_ORAL(£184) + CMRH_TELEPHONE(£100) + SUBSTANTIVE_HEARING(£263) +  ADJOURNED_HEARING(£179)) |

  Scenario: Claims priced with: Standard Fee Scheme
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMCB:IEMP |
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 011007/001 | CM         |      01/10/2007 |          30/06/2008 |         228 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                                                       |
      | 1 | 011007/001 | £ 1,170.00 | Standard fee for IMCB for start date and end date above (£480) + Additional payments w.r.t start and end dates (CMRH_ORAL(£175) + CMRH_TELEPHONE(£95) + SUBSTANTIVE_HEARING(£250) +  ADJOURNED_HEARING(£170)) |

  Scenario: Claims priced with: Standard Fee Scheme
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMLB:IOTH |
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 011007/001 | CM         |      01/10/2007 |          30/06/2008 |         228 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                            |
      | 1 | 011007/001 | £ 545.00 | Standard fee for IMLB for start date and end date above (£255) + Additional payments w.r.t start and end dates (HO_INTERVIEW(£290) |
