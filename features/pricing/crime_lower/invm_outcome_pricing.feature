Feature: INVM outcome pricing
  Rules:
  Pricing calculations:
  Calculation:
  PROFIT_COST * VAT[Y/N] + Disbursements + Disbursements VAT

    Background:
        Given a test firm user is logged in CWA
        And user prepares to submit outcomes for test provider "CRIME LOWER#8"

      @vat_indicator
      Scenario: Bulkload INVM outcomes and test VAT is applied correctly to payments

        Given the following Matter Types are chosen:
          | INVM |
        And the following outcomes are bulkloaded:
          | # | UFN        | PROFIT_COST | VAT_INDICATOR |
          | 1 | 190920/001 | 100.0       | N             |
          | 2 | 190920/002 | 100.0       | Y             |
          | 3 | 190920/003 | 300.0       | Y             |
        When user confirms the submission
        And user is on the pricing outcome details page
        Then user should see the following outcomes:
          | # | UFN        | Value      |
          | 1 | 190920/001 | £ 100.00   |
          | 2 | 190920/002 | £ 120.00   |
          | 3 | 190920/003 | £ 360.00   |

      @disbursements
      Scenario: Bulkload INVM codes outcomes and test disbursements are paid correctly
        Given the following Matter Types are chosen:
          | INVM |
        And the following outcomes are bulkloaded:
          | # | UFN        | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT |
          | 1 | 190920/001 | 100.0       | N             | 100.0                |
          | 2 | 190920/002 | 100.0       | Y             | 100.0                |
        When user confirms the submission
        And user is on the pricing outcome details page
        Then user should see the following outcomes:
          | # | UFN        | Value      |
          | 1 | 190920/001 | £ 200.00   |
          | 2 | 190920/002 | £ 220.00   |

      @disbursements_vat
      Scenario: Bulkload INVM code and test disbursement VAT is applied correctly
        Given the following Matter Types are chosen:
          | INVM |
        And the following outcomes are bulkloaded:
          | # | UFN        | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
          | 1 | 190920/001 | 300.0       | N             | 100.0                | 20                |
          | 2 | 190920/002 | 300.0       | Y             | 100.0                | 20                |
          | 3 | 190920/003 | 300.0       | Y             | 100.0                | 40                |
        When user confirms the submission
        And user is on the pricing outcome details page
        Then user should see the following outcomes:
          | # | UFN        | Value      |
          | 1 | 190920/001 | £ 420.00   |
          | 2 | 190920/002 | £ 480.00   |
          | 3 | 190920/003 | £ 500.00   |
