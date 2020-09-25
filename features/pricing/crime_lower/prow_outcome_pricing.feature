Feature:PROW outcome pricing
  Rules:
  Pricing calculations:
  Calculation:
  £181.40 * VAT[Y/N] + Disbursements + Disbursements VAT

    Background:
        Given a test firm user is logged in CWA
        And user prepares to submit outcomes for test provider "CRIME LOWER#7"

      @vat_indicator
      Scenario: Bulkload PROW outcomes and test VAT is applied correctly to payments

        Given the following Matter Types are chosen:
          | PROW |
        And the following outcomes are bulkloaded:
          | # | UFN        | REP_ORDER_DATE | PROFIT_COST | VAT_INDICATOR |
          | 1 | 190920/001 | 19/10/2020     | 100.0       | N             |
          | 2 | 190920/002 | 19/10/2020     | 100.0       | Y             |
          | 3 | 190920/003 | 19/10/2020     | 300.0       | Y             |
        When user confirms the submission
        And user is on the pricing outcome details page
        Then user should see the following outcomes:
          | # | UFN        | Value      |
          | 1 | 190920/001 | £ 181.40   |
          | 2 | 190920/002 | £ 217.68   |
          | 3 | 190920/003 | £ 217.68   |

      @disbursements
      Scenario: Bulkload PROW codes outcomes and test disbursements are paid correctly
        Given the following Matter Types are chosen:
          | PROW |
        And the following outcomes are bulkloaded:
          | # | UFN        | REP_ORDER_DATE | PROFIT_COST | DISBURSEMENTS_AMOUNT |
          | 1 | 190920/001 | 19/10/2020     | 100.0       | 100.0                |
        When user confirms the submission
        And user is on the pricing outcome details page
        Then user should see the following outcomes:
          | # | UFN        | Value      |
          | 1 | 190920/001 | £ 281.40   |

      @disbursements_vat
      Scenario: Bulkload PROW code and test disbursement VAT is applied correctly
        Given the following Matter Types are chosen:
          | PROW |
        And the following outcomes are bulkloaded:
          | # | UFN        | REP_ORDER_DATE | PROFIT_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
          | 1 | 190920/001 | 19/10/2020     | 100.0       | 100.0                | 20                |
        When user confirms the submission
        And user is on the pricing outcome details page
        Then user should see the following outcomes:
          | # | UFN        | Value      |
          | 1 | 190920/001 | £ 301.40   |
