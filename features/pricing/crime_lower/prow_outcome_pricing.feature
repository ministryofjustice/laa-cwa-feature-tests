Feature:PROW outcome pricing
  Rules:
  Pricing calculations:
  Calculation:
  £181.40 * VAT[Y/N] + Disbursements + Disbursements VAT

    Background:
        Given a test firm user is logged in CWA
        And user prepares to submit outcomes for test provider "CRIME LOWER#7"

      @vat_indicator
      Scenario: Bulkload Civil Asylum outcomes and test VAT is applied correctly to additional payments

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

      @disbursments
      Scenario: Bulkload PROW codes outcomes and test VAT is applied correctly to additional payments
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

      @disbursments_vat
      Scenario: Bulkload Civil Asylum outcomes and test VAT is applied correctly to additional payments
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
