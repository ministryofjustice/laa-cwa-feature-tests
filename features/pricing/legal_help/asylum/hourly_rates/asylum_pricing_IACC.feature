Feature: Pricing for Asylum claims

  Rates:
  - CMRH_Telephone Fee: £90 (per unit, up to 9)
  - CMRH_Oral Fee: £166 (per unit, up to 9)
  - Adjourned_Hearing_Fee: £161 (per unit, up to 9)
  - Substantive_Hearing Fee: £302 (Yes or No)
  
  Calculation: [PROFIT_COST + COUNSEL_COST]* VAT[Y/N] 
  + Disbursments + Disbursments VAT
  + [SUBSTANTIVE_HEARING + ADJOURNED_HEARING_FEE (* 0-9) + CMRH_ORAL (* 0-9) + CMRH_TELEPHONE (* 0-9)] * VAT[Y/N]
  
  Child migrant cases always use hourly rates but do not include additional fixed fees.
  Child migrant cases can trigger the escape fee flag.

  Calculation: [PROFIT_COST + COUNSEL_COST]{capped to £500} * VAT[Y/N] + Disbursments + Disbursments VAT
  Escape fee flag: [PROFIT_COST + COUNSEL_COST] > £500

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"
    
@escape_fee_flag @child_migrant
Scenario: Bulkload Civil Asylum outcomes with additional fees, with EXEMPTION_CRITERIA_SATISFIED: Child Migrant

  Given the following Matter Types are chosen:
    | IACC:IFRA |
  And the following outcomes are bulkloaded:
    | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | CMRH_ORAL | CMRH_TELEPHONE | EXEMPTION_CRITERIA_SATISFIED | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
    | 1 | 251019/001 | 25/10/2019      | 100.0       | 400.0        | Y             | N                   | 0                     | 0         | 0              | CM001                        | 0                    | 0                 |
    | 2 | 251019/002 | 25/10/2019      | 100.0       | 400.0        | Y             | Y                   | 0                     | 0         | 0              | CM001                        | 0                    | 0                 |
    | 3 | 251019/003 | 25/10/2019      | 100.0       | 401.0        | Y             | Y                   | 1                     | 0         | 0              | CM001                        | 0                    | 0                 |
    | 4 | 251019/004 | 25/10/2019      | 100.0       | 500.0        | Y             | N                   | 0                     | 0         | 0              | CM001                        | 100                  | 20                |
  When user confirms the submission
  And user is on the pricing outcome details page
  Then user should see the following outcomes:
    | # | UFN        | Value    | Escape Fee |
    | 1 | 251019/001 | £ 600.00 | Y          |
    | 2 | 251019/002 | £ 600.00 | N          |
    | 3 | 251019/003 | £ 600.00 | Y          |
    | 4 | 241019/004 | £ 720.00 | Y          |
