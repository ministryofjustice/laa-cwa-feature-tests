Feature: Pricing for Immigration claims

  Pricing tests for Stage 2c Immigration matter type : IMCC

  Rates:
  - Substantive_Hearing Fee: £237 (Yes or No)
  - Adjourned_Hearing_Fee: £161 (per unit, up to 9)
  - CMRH_Oral Fee: £166 (per unit, up to 9)
  - CMRH_Telephone Fee: £90 (per unit, up to 9)

  Pricing calculations:

  Calculation: 
  (PROFIT_COST + COUNSEL_COST) * VAT[Y/N] + Disbursments + Disbursments VAT +
  [SUBSTANTIVE_HEARING + ADJOURNED_HEARING_FEE (* 0-9) + CMRH_ORAL (* 0-9) + CMRH_TELEPHONE (* 0-9)] * VAT[Y/N]
  
  Child Migrant cases always use hourly rates but do not include additional fixed fees

  Calculation: (PROFIT_COST + COUNSEL_COST){capped to £500} * VAT[Y/N] + Disbursments + Disbursments VAT
  Escape fee flag: (PROFIT_COST + COUNSEL_COST) > £500

@escape_fee_flag @child_migrant
Scenario: Bulkload Civil Immigration outcomes with additional fees, with EXEMPTION_CRITERIA_SATISFIED: Child Migrant

  Given the following Matter Types are chosen:
    | IMCC:IDOM |
    | IMCD:IDOM |
  And the following outcomes are bulkloaded:
    | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | SUBSTANTIVE_HEARING | EXEMPTION_CRITERIA_SATISFIED | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
    | 1 | 251019/001 | 25/10/2019      | 100.0       | 400.0        | N                   | CM001                        | 0                    | 0                 |
    | 2 | 251019/002 | 25/10/2019      | 100.0       | 400.0        | Y                   | CM001                        | 0                    | 0                 |
    | 3 | 251019/003 | 25/10/2019      | 100.0       | 401.0        | Y                   | CM001                        | 0                    | 0                 |
    | 4 | 241019/004 | 24/10/2019      | 100.0       | 500.0        | N                   | CM001                        | 100                  | 20                |
  When user confirms the submission
  And user is on the pricing outcome details page
  Then user should see the following outcomes:
    | # | UFN        | Value    | Escape Fee |
    | 1 | 251019/001 | £ 600.00 | N          |
    | 2 | 251019/002 | £ 600.00 | N          |
    | 3 | 251019/003 | £ 600.00 | Y          |
    | 4 | 241019/004 | £ 720.00 | Y          |
