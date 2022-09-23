Feature: For Mental health code MHDC,  new Case Stage Level code MHL10 billing pricing.
         MHL10 is priced at fixed rate of £129, whether profit cost is lower or higher.
         Fixed rate cannot be escaped, so 3 X £129 still priced at £129.
         Code MHL10 is only valid on or after 3-Oct-2011.

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.MHE#11"

  @mental_health @mlh10 @mhl10_pricing
  Scenario: For Completed Matter claim, using Case Stage/Level MHL10 always prices
            £129.00
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

 @mhl10_validate @mental_health @mlh10
 Scenario: For completed Matters MT1 value MHDC, when Case Stage/Level MHL10 is used, the
           Designated Accredited Rep (DESI_ACC_REP) must NOT be selected. If its, then an
           error is raised.
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
