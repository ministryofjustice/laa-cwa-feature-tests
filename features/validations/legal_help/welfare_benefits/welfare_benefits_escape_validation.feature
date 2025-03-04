Feature: Welfare benefits manual and bulkload tests

  @manual_submission
  Scenario Outline: validate manual WTAX:WBHC LEGAL HELP claim to ensure price does not have escape threshold for CSD = 1/4/24
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "welfare_benefits" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point |
      |     101 | WTAX:WBHC   |      15/11/2020 | PA00179          | AP00201      |
    Then the outcome saves successfully

  @manual_submission
  Scenario Outline: validate manual WTAX:WBHC LEGAL HELP claim cannot use PA20000 without ECF
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "welfare_benefits" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | delivery_location | type_of_advice |
      |     101 | WTAX:WBHC   |      15/11/2020 | PA20000          | AP20000      |                   |                |
    Then the outcome does not save and gives an error containing:
    """
    The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.
    """

  @manual_submission
  Scenario Outline: validate manual WTAX:WLGO LEGAL HELP claim to ensure claim saves with ECF
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "welfare_benefits" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | excl_case_funding_ref | delivery_location | type_of_advice |
      |     101 | WTAX:WLGO   |      15/11/2020 | PA20000          | AP20000      |             1234567AB |                   |                |
    Then the outcome saves successfully

  @manual_submission
  Scenario Outline: validate manual WTAX:WLGO LEGAL HELP claim to ensure claim fails without ECF
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "welfare_benefits" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | schedule_ref   | delivery_location |
      |     101 | WTAX:WLGO   |      15/11/2020 | PA20000          | AP20000      | 0Q801N/2013/15 |                   |
    Then the outcome does not save and gives an error containing:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """

  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: pre 1/4/23 Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | excl_case_funding_ref |
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
  Scenario: Claims priced with: pre 1/4/23 Escape Fee Flag (profit cost + counsel cost = the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | excl_case_funding_ref |
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
  Scenario: Claims priced with: pre 1/4/23 Escape Fee Flag (profit cost + counsel cost > the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | excl_case_funding_ref |
      | 1 | 010413/002 |      01/04/2013 |          31/03/2023 |         451 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 010413/002 | £ 150.00 | Standard fee for welfare_benefits is £150 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£150) = £450, Profit_Cost(£451) + Counsel_Cost(£0)= £451 |

  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: post 1/4/23 does not escape (profit cost + counsel cost < the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | excl_case_funding_ref |
      | 1 | 020423/003 |      02/04/2023 |          31/04/2023 |         623 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 020423/003 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£623) + Counsel_Cost(£0)= £623 |

  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: post 1/4/23 does not escape (profit cost + counsel cost = the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | excl_case_funding_ref |
      | 1 | 020423/004 |      02/04/2023 |          31/04/2023 |         624 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 020423/004 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£624) + Counsel_Cost(£0)= £624 |
  
  @bulkload_submission @escape_fee_flag
  Scenario: Claims priced with: post 1/4/23 does not escape (profit cost + counsel cost > the escape threshold)
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT | excl_case_funding_ref |
      | 1 | 020423/005 |      02/04/2023 |          31/04/2023 |         625 |            0 | N             | PA20000          | AP20000      |             1234567AB |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 020423/005 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£625) + Counsel_Cost(£0)= £625 |

  @bulkload_submission @escape_fee_flag
  Scenario: WTAX:WBHC claim pre 1/4/23 does not escape
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | 280223/006 |      28/02/2023 |          01/03/2023 |         999 |            0 | N             | PA00179          | AP00201      |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 280223/006 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£999) + Counsel_Cost(£0)= £999 |

  @bulkload_submission @escape_fee_flag
  Scenario: WTAX:WLGO claim post 1/5/25 escapes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | 010525/008 |      01/05/2025 |          02/05/2025 |         624 |            0 | N             | PA00179          | AP00201      |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 010525/008 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£624) + Counsel_Cost(£0)= £624 |

