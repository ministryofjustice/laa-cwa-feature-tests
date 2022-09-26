Feature: For Mental health code MHDC,  new Case Stage Level code MHL10 billing pricing.
         MHL10 is priced at fixed rate of £129, whether profit cost is lower or higher.
         Fixed rate cannot be escaped, so 3 X £129 still priced at £129.
         Code MHL10 is only valid on or after 3-Oct-2011.

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.MHE#11"
    Given the following Matter Types are chosen:
      | MHDC:MCOM |
      | MHDC:MCON |
      | MHDC:MGUA |
      | MHDC:MINF |
      | MHDC:MOTH |
      | MHDC:MPAT |
      | MHDC:MREL |
      | MHDC:MSCR |
      | MHDC:MSUP |

  @mental_health @mlh10 @mhl10_pricing
  Scenario: For Completed Matter claim, using Case Stage/Level MHL10 always prices £129.00, whatever the profit cost,
            VAT is applied if flag is Y.

   When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | PROFIT_COST | VAT_INDICATOR |
      | 1 | 190920/001 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | N             |
      | 2 | 190920/002 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 130.00      | N             |
      | 3 | 190920/003 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 388.00      | N             |
      | 4 | 190920/004 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | Y             |
      | 5 | 190920/005 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 130.00      | Y             |
      | 6 | 190920/006 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 388.00      | Y             |

   When user confirms the submission
   And user is on the pricing outcome details page
   Then user should see the following outcomes:
      | # | UFN        | Value      |
      | 1 | 190920/001 | £ 129.00   |
      | 2 | 190920/002 | £ 129.00   |
      | 3 | 190920/003 | £ 129.00   |
      | 4 | 190920/004 | £ 154.80   |
      | 5 | 190920/005 | £ 154.80   |
      | 6 | 190920/006 | £ 154.80   |


  @mental_health @mlh10 @mhl10_pricing
  Scenario: For Completed Matter claim, using Case Stage/Level MHL10 always prices £129.00, whatever the profit cost,
            plus disbursement.

  When the following outcomes are bulkloaded:
     | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | PROFIT_COST | DISBURSEMENTS_AMOUNT | VAT_INDICATOR |
     | 1 | 190920/001 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 100.00               | N             |
     | 2 | 190920/002 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 100.00               | Y             |

  When user confirms the submission
  And user is on the pricing outcome details page
  Then user should see the following outcomes:
     | # | UFN        | Value      |
     | 1 | 190920/001 | £ 229.00   |
     | 2 | 190920/002 | £ 254.80   |

  @mental_health @mlh10 @mhl10_pricing
  Scenario: For Completed Matter claim, using Case Stage/Level MHL10 always prices £129.00, whatever the profit cost,
            plus disbursement and disbursement vat.

  When the following outcomes are bulkloaded:
    | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | PROFIT_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | VAT_INDICATOR |
    | 1 | 190920/001 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 100.00               | 20                | N             |
    | 2 | 190920/002 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 100.00               | 20                | Y             |

     When user confirms the submission
     And user is on the pricing outcome details page
     Then user should see the following outcomes:
        | # | UFN        | Value      |
        | 1 | 190920/001 | £ 249.00   |
        | 2 | 190920/002 | £ 274.80   |

   @mental_health @mlh10 @mhl10_pricing
   Scenario: For Completed Matter claim, using Case Stage/Level MHL10 always prices £129.00, whatever the profit cost,
             plus cost of adjourned hearing fee.

   When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | PROFIT_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | ADJOURNED_HEARING_FEE | VAT_INDICATOR |
      | 1 | 190920/001 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 0                    | 0                 | 1                     | N             |
      | 2 | 190920/002 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 0                    | 0                 | 1                     | Y             |

   When user confirms the submission
   And user is on the pricing outcome details page
   Then user should see the following outcomes:
      | # | UFN        | Value      |
      | 1 | 190920/001 | £ 246.00   |
      | 2 | 190920/002 | £ 295.20   |

   @mental_health @mlh10 @mhl10_pricing
   Scenario: For Completed Matter claim, using Case Stage/Level MHL10 always prices £129.00, whatever the profit cost,
             plus additional travel payment.

   When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | PROFIT_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | ADJOURNED_HEARING_FEE | ADDITIONAL_TRAVEL_PAYMENT | VAT_INDICATOR |
      | 1 | 190920/001 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 0                    | 0                 | 0                     | Y                         | N             |
      | 2 | 190920/002 | CM         | 01/01/2020      | 31/03/2020          | MHL10            | 128.00      | 0                    | 0                 | 0                     | Y                         | Y             |

   When user confirms the submission
   And user is on the pricing outcome details page
   Then user should see the following outcomes:
      | # | UFN        | Value      |
      | 1 | 190920/001 | £ 198.00   |
      | 2 | 190920/002 | £ 237.60   |
