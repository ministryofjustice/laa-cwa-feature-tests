Feature: Welfare benefits manual and bulkload tests

  @manual_submission
  Scenario Outline: validate manual WTAX:WBHC LEGAL HELP claim to ensure price does not have escape threshold for CSD = 1/4/24
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "welfare_benefits" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point |
      |     101 | WTAX:WBHC   |      15/11/2020 | PA00179          | AP00201      |
    Then the outcome saves successfully

  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 | 010413/001 |      01/04/2013 |          31/03/2023 |         449 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 010413/001 | £ 150.00 | Standard fee for welfare_benefits is £150 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£150) = £450, Profit_Cost(£449) + Counsel_Cost(£0)= £449 |

  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost = the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 | 010413/001 |      01/04/2013 |          31/03/2023 |         450 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 010413/001 | £ 150.00 | Standard fee for welfare_benefits is £150 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£150) = £450, Profit_Cost(£450) + Counsel_Cost(£0)= £450 |
  
  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost > the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 | 010413/001 |      01/04/2013 |          31/03/2023 |         451 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 010413/001 | £ 150.00 | Standard fee for welfare_benefits is £150 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£150) = £450, Profit_Cost(£451) + Counsel_Cost(£0)= £451 |
