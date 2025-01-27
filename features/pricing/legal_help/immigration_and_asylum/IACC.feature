Feature: Pricing: IACC: Asylum - Stage 2c (CLR)

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IACC:IRVL |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         428 |          200 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                           |
      | 1 | 010120/001 | £ 627.00 | Standard fee for MT1 IACC £627, priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Additional Payments
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         428 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010120/001 | £ 1,346.00 | Standard fee(£627) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         628 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010120/001 | £ 747.00 | Standard fee for MT1 IACC £627  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         628 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                             |
      | 1 | 010120/001 | £ 752.40 | Standard fee for MT1 IACC £627  + 20% vat on standard fee = £125.40 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |          881 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 627.00 | Standard fee for MT1 IACC £627 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£627) = £1881, Profit_Cost(£1000) + Counsel_Cost(£881) - Additioanal_payments(0)= £1881 |

  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |          880 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 627.00 | Standard fee for MT1 IACC £627 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£627) = £1881, Profit_Cost(£1000) + Counsel_Cost(£880) - Additioanal_payments(0)= £1880 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag, exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |         1600 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010120/001 | £ 1,346.00 | Standard fee(£627) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£627) = £1881, Profit_Cost(£1000) + Counsel_Cost(£1600) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161)= £1881 |

  @escape_fee_flag
  Scenario: Claims priced with: No Escape Fee Flag, not exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |         1599 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010120/001 | £ 1,346.00 | Standard fee(£627) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£627) = £1881, Profit_Cost(£1000) + Counsel_Cost(£1599) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161)= £1880 |
