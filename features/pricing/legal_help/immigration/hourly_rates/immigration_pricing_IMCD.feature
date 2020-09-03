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

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  @escape_fee_flag @child_migrant
  Scenario: Bulkload Civil Immigration outcomes with additional fees, with EXEMPTION_CRITERIA_SATISFIED: Child Migrant

    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | SUBSTANTIVE_HEARING | EXEMPTION_CRITERIA_SATISFIED | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 251019/101 | 25/10/2019      | 100.0       | 400.0        | N                   | CM001                        | 0                    | 0                 |
      | 2 | 251019/102 | 25/10/2019      | 100.0       | 400.0        | Y                   | CM001                        | 0                    | 0                 |
      | 3 | 251019/103 | 25/10/2019      | 100.0       | 401.0        | Y                   | CM001                        | 0                    | 0                 |
      | 4 | 251019/104 | 24/10/2019      | 100.0       | 500.0        | N                   | CM001                        | 100                  | 20                |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Escape Fee |
      | 1 | 251019/101 | £ 500.00 | N          |
      | 2 | 251019/102 | £ 600.00 | N          |
      | 3 | 251019/103 | £ 600.00 | Y          |
      | 4 | 251019/104 | £ 720.00 | N          |

  @vat_indicator_add_pay
  Scenario: Bulkload Civil Immigration outcomes and test VAT is applied correctly to additional payments
    
    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | CMRH_ORAL | CMRH_TELEPHONE | 
      | 1 | 010419/101 | 01/04/2019      | 100.0       | Y             | Y                   | 1                     | 1         | 1              |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value       |
      | 1 | 010419/101 | £ 904.80    |
      
  @vat_indicator_hourly_rates
  Scenario: Bulkload Civil Immigration outcomes and test VAT is applied correctly to the hourly rates fee
    
    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010419/101 | 01/04/2019      | 100.0       | 100.00        | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      |
      | 1 | 010419/101 | £ 240.00   |
      
  @cmrh_telephone_fee
  Scenario: Bulkload Civil Immigration outcomes with Telephone Case Management Review Hearing fees

    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | CMRH_TELEPHONE | 
      | 1 | 010419/101 | 01/04/2019      | 100.0       | 9              | 
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/101 | £ 910.00   |

  @cmrh_oral_fee
  Scenario: Bulkload Civil Immigration outcomes with Oral Case Management Review Hearing fees

    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | CMRH_ORAL | 
      | 1 | 010419/101 | 01/04/2019      | 100.0       | 9         |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/101 | £ 1,594.00  |

  @substantive_hearing_fee
  Scenario: Bulkload Civil Immigration outcomes with Substantive AIT Appeal Hearing fees

    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | SUBSTANTIVE_HEARING | 
      | 1 | 010419/101 | 01/04/2019      | 100.0       | Y                   | 
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/101 | £ 337.00  | 
  
  @adjourned_hearing_fee
  Scenario: Bulkload Civil Immigration outcomes with Adjourned/Part-Heard AIT Hearing fees

    Given the following Matter Types are chosen:
      | IMCD:IDOM |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | ADJOURNED_HEARING_FEE | 
      | 1 | 010419/101 | 01/04/2019      | 100.0       | 9                     | 
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/101 | £ 1,549.00 |
