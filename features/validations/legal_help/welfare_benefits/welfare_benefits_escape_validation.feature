Feature: bulk load claims validations for Access point

  @manual_submission
  Scenario Outline: validate manual WTAX:WBHC LEGAL HELP claim to ensure price does not have escape threshold for CSD = 1/4/24
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "welfare_benefits" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point |
      |     101 | WTAX:WBHC   |      15/11/2020 | PA00179          | AP00201      |
    Then the outcome saves successfully

  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | CASE_START_DATE | PROFIT_COST | procurement_area | access_point |
      | 1 |      01/04/2013 |         623 | PA00179          | AP00201      |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010413/001 | £ 227.00 | Standard fee for MT1 IMCA £227 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                |
      | escape threhold 3 * standard fee (£227) = £681, Profit_Cost(£228) + Counsel_Cost(£452) - Additioanal_payments(0)= £680 |

  Scenario: Claims priced with: Standard Fee Scheme , no impact of detention travel & waiting costs
  Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
      When the following outcomes are bulkloaded:
        | # | CASE_START_DATE | PROFIT_COST | procurement_area | access_point | TOLERANCE_INDICATOR | outcome_code | COUNSEL_COST | excl_case_funding_ref | delivery_location |
        | 1 |      02/04/2020 |         624 | PA00179          | AP00201      |                   N |           WA |            0 |             1234567AB |           DL00003 |
        | 2 |      02/04/2020 |         625 | PA20000          | AP20000      |                   N |           WA |            0 |             1234567AB |           DL00003 |
      When user confirms the submission
      And user is on the pricing outcome details page
      Then the outcomes are flagged as escape fee cases

