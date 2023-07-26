Feature: Pricing: IMCC: Immigration - Stage 2c (CLR)

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMCC:IILL |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         300 |          228 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                           |
      | 1 | 010413/001 | £ 527.00 | Standard fee for MT1 IMCC £527, priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Additional Payments
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         528 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010413/001 | £ 1,181.00 | Standard fee(£527) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         528 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010413/001 | £ 647.00 | Standard fee for MT1 IMCC £527  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         455 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                             |
      | 1 | 010413/001 | £ 632.40 | Standard fee for MT1 IMCC £527  + 20% vat on standard fee = £105.40 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |          581 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010413/001 | £ 527.00 | Standard fee for MT1 IMCC £527 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£527) = £1581, Profit_Cost(£1000) + Counsel_Cost(£581) - Additioanal_payments(0)= £1581 |

  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |          580 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010413/001 | £ 527.00 | Standard fee for MT1 IMCC £527 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£527) = £1581, Profit_Cost(£1000) + Counsel_Cost(£580) - Additioanal_payments(0)= £1580 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag, exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |         1235 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010413/001 | £ 1,181.00 | Standard fee(£527) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£527) = £1581, Profit_Cost(£1000) + Counsel_Cost(£1235) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161)= £1581 |

  @escape_fee_flag
  Scenario: Claims priced with: No Escape Fee Flag, not exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |         1234 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010413/001 | £ 1,181.00 | Standard fee(£527) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£527) = £1581, Profit_Cost(£1000) + Counsel_Cost(£1234) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161)= £1580 |
