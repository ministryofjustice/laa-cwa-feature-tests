Feature: Pricing: IMMA: Illegal Immigration Act

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMMA:IMRN |

  Scenario: 1 - Claims priced with: hourly rates Scheme with pc and zero cc ,with disbursement and disbursement vat
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010523/001 | CM         |      01/05/2023 |          01/08/2023 |          10 |            0 | N             |               1500.0 |               300 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       | Comment                                                                                                          |
      | 1 | 010523/001 | £ 1810.00 | Priced at hourly rates (profit cost(£10) +  counsel cost(£0)) + disbursement vat(£1500) + disbursement vat(£300) |
