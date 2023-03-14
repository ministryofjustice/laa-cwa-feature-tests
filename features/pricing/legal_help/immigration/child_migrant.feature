Feature: Pricing: IMXL: Immigration Child Migrant
         
         Base price = profit cost+ councel cost 
         20 % of base price if vat flag yes (20% of Base price is calculated)
         Disbursement amount 
         Disbursement vat
         E.g Value £10,800 is arrived using . Base Price + 20% of Base Price as vat flag is "yes" + Disbursement amount + Disbursement vat = {3000+3000) + {1200} + {3000} + {600} = £10,800

 Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

   Scenario: For Completed Matter claim, using Child Migrant ECS for Immigration
   Given the following Matter Types are chosen:
    | IMXL:IOUT |
   When the following outcomes are bulkloaded:
      | # | UFN          | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE |  PROFIT_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | COUNSEL_COST  | EXEMPTION_CRITERIA_SATISFIED  | VAT_INDICATOR |
      | 1 | 010120/001   | CM         | 01/01/2020      | 31/03/2020          |  3000.00     | 3000.00              | 600.00            | 3000.00       |             CM001             |       Y       |
      | 3 | 010120/002   | CM         | 01/01/2020      | 31/03/2020          |  1500.00     | 1000.00              | 200.00            | 500.00        |             CM001             |       N       |
   When user confirms the submission
   And user is on the pricing outcome details page
   Then user should see the following outcomes:
      | # | UFN        | Value         |
      | 1 | 010120/001 | £ 10,800.00   |
      | 2 | 010120/002 | £ 3,200.00    |


