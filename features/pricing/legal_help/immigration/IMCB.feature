Feature: Pricing: IMCB: Immigration - Stage 2b (CLR)

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMCB:IEUL |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         255 |          200 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                           |
      | 1 | 010413/001 | £ 454.00 | Standard fee for MT1 IMCB £454, priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Additional Payments
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         455 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010413/001 | £ 1,108.00 | Standard fee(£454) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         455 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010413/001 | £ 574.00 | Standard fee for MT1 IMCB £454  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         455 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                            |
      | 1 | 010413/001 | £ 544.80 | Standard fee for MT1 IMCB £454  + 20% vat on standard fee = £90.80 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |          362 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010413/001 | £ 454.00 | Standard fee for MT1 IMCB £454 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£454) = £1362, Profit_Cost(£1000) + Counsel_Cost(£362) - Additioanal_payments(0)= £1362 |

  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |          361 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010413/001 | £ 454.00 | Standard fee for MT1 IMCB £454 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£454) = £1362, Profit_Cost(£1000) + Counsel_Cost(£361) - Additioanal_payments(0)= £1361 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag, exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |         1016 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010413/001 | £ 1,108.00 | Standard fee(£454) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£454) = £1362, Profit_Cost(£1000) + Counsel_Cost(£1016) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161)= £1362 |

  @escape_fee_flag
  Scenario: Claims priced with: No Escape Fee Flag, not exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |        1000 |         1015 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010413/001 | £ 1,108.00 | Standard fee(£454) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£454) = £1362, Profit_Cost(£1000) + Counsel_Cost(£1015) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£237) +  ADJOURNED_HEARING(£161)= £1361 |
