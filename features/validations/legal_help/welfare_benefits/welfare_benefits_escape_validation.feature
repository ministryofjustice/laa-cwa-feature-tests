Feature: Welfare benefits manual and bulkload tests

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
  Scenario: WTAX:WBHC claim post 1/2/25 no escape when below threshold
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | 020225/007 |      02/02/2025 |          03/02/2025 |         623 |            0 | N             | PA00179          | AP00201      |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 020225/007 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£623) + Counsel_Cost(£0)= £623 |

  @bulkload_submission @escape_fee_flag
  Scenario: WTAX:WBHC claim post 1/2/25 escapes when == threshold
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WBHC |
    When the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | 020225/007 |      02/02/2025 |          03/02/2025 |         624 |            0 | N             | PA00179          | AP00201      |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                   |
      | 1 | 020225/007 | £ 208.00 | Standard fee for welfare_benefits is £208 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                    |
      | escape threhold 3 * standard fee (£208) = £624, Profit_Cost(£624) + Counsel_Cost(£0)= £624 |

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

  @bulkload_submission @escape_fee_flag
  Scenario: Claims fails without ECF when PA20000 and AP20000 and mandatory MT2 code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.WB#26"
    Given the following Matter Types are chosen:
      | WTAX:WLGO |
    When the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CASE_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |      02/04/2023 |          04/04/2023 |         451 |            0 | N             | PA20000          | AP20000      |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And there should be no duplicate outcomes
    And the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
