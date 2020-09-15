Feature: Pricing for Asylum claims

  Pricing tests for Stage 2c Asylum matter type : IACC
  
  Rates:
  - Base fee: £627
  - Substantive_Hearing Fee: £302 (Yes or No)
  - Adjourned_Hearing_Fee: £161 (per unit, up to 9)
  - CMRH_Oral Fee: £166 (per unit, up to 9)
  - CMRH_Telephone Fee: £90 (per unit, up to 9)
  
  Pricing calculations:
  
  Calculation: 
  Fixed Fee * VAT[Y/N] +
  [SUBSTANTIVE_HEARING + ADJOURNED_HEARING_FEE (* 0-9) + CMRH_ORAL (* 0-9) + CMRH_TELEPHONE (* 0-9)] * VAT[Y/N] + 
  Disbursements + Disbursements VAT
  
  Escape fee flag: (PROFIT_COST + COUNSEL_COST) > (3 * Base fee £627) i.e. £1881
  
  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"
    
  @vat_indicator_add_pay
  Scenario: Bulkload Civil Asylum outcomes and test VAT is applied correctly to additional payments
    
    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | CMRH_ORAL | CMRH_TELEPHONE | 
      | 1 | 010419/001 | 01/04/2019      | 100.0       | Y             | Y                   | 1                     | 1         | 1              |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      |
      | 1 | 010419/001 | £ 1,615.20  |
      
  @vat_indicator_fixed_fee
  Scenario: Bulkload Civil Asylum outcomes and test VAT is applied correctly to the fixed fee
    
    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010419/001 | 01/04/2019      | 100.0       | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      |
      | 1 | 010419/001 | £ 752.40   |
    
  @escape_fee_flag
  Scenario: Bulkload Civil Asylum outcomes and test the Escape Fee Flag is set correctly

    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | CMRH_TELEPHONE |
      | 1 | 010419/001 | 01/04/2019      | 1882.0      | 0            | 0                    | 0                 | 0              |
      | 2 | 010419/002 | 01/04/2019      | 1000.0      | 882.0        | 0                    | 0                 | 0              |
      | 3 | 010419/003 | 01/04/2019      | 1000.0      | 800.0        | 82.0                 | 0                 | 0              |
      | 4 | 010419/004 | 01/04/2019      | 1000.0      | 800.0        | 72.0                 | 10.0              | 0              |
      | 5 | 010419/005 | 01/04/2019      | 1792.0      | 0            | 0                    | 0                 | 1              |

    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Escape Fee |
      | 1 | 010419/001 | £ 627.00   | Y          |
      | 2 | 010419/002 | £ 627.00   | Y          |
      | 3 | 010419/003 | £ 709.00   | N          |
      | 4 | 010419/004 | £ 709.00   | N          |
      | 5 | 010419/005 | £ 717.00   | N          |

  @cmrh_telephone_fee
  Scenario: Bulkload Civil Asylum outcomes with Telephone Case Management Review Hearing fees

    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | CMRH_TELEPHONE | 
      | 1 | 010419/001 | 01/04/2019      | 100.0       | 9              |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/001 | £ 1,437.00  | 
      
  @cmrh_oral_fee
  Scenario: Bulkload Civil Asylum outcomes with Oral Case Management Review Hearing fees

    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | CMRH_ORAL | 
      | 1 | 010419/001 | 01/04/2019      | 100.0       | 9         |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/001 | £ 2,121.00  |

  @substantive_hearing_fee
  Scenario: Bulkload Civil Asylum outcomes with Substantive AIT Appeal Hearing fees

    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | SUBSTANTIVE_HEARING | 
      | 1 | 010419/001 | 01/04/2019      | 100.0       | Y                   | 
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value     | 
      | 1 | 010419/001 | £ 929.00  | 
  
  @adjourned_hearing_fee
  Scenario: Bulkload Civil Asylum outcomes with Adjourned/Part-Heard AIT Hearing fees

    Given the following Matter Types are chosen:
      | IACC:IFRA |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | ADJOURNED_HEARING_FEE | 
      | 1 | 010419/001 | 01/04/2019      | 100.0       | 9                     | 
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | 
      | 1 | 010419/001 | £ 2,076.00  |
