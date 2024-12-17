Feature: Pricing: IACB: Asylum - Stage 2b (CLR)

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IACB:ILEA |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         368 |          200 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                           |
      | 1 | 010120/001 | £ 567.00 | Standard fee for MT1 IACB £567, priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Additional Payments
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         228 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010120/001 | £ 1,286.00 | Standard fee(£567) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         568 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010120/001 | £ 687.00 | Standard fee for MT1 IACB £567  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         568 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                             |
      | 1 | 010120/001 | £ 680.40 | Standard fee for MT1 IACB £567  + 20% vat on standard fee = £113.40 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |          701 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 567.00 | Standard fee for MT1 IACB £567 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£567) = £1701, Profit_Cost(£1000) + Counsel_Cost(£701) - Additioanal_payments(0)= £1701 |

  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |          700 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 567.00 | Standard fee for MT1 IACB £567 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£567) = £1701, Profit_Cost(£1000) + Counsel_Cost(£700) - Additioanal_payments(0)= £1700 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag, exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |         1420 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010120/001 | £ 1,286.00 | Standard fee(£567) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£567) = £1701, Profit_Cost(£1000) + Counsel_Cost(£1420) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161)= £1701 |

  @escape_fee_flag
  Scenario: Claims priced with: No Escape Fee Flag, not exceeding (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |        1000 |         1419 | N             |         1 |              1 | Y                   |                     1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                           |
      | 1 | 010120/001 | £ 1,286.00 | Standard fee(£567) + CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                                                                                              |
      | escape threhold 3 * standard fee (£567) = £1701, Profit_Cost(£1000) + Counsel_Cost(£1419) - Additioanal_payments(CMRH_ORAL(£166) + CMRH_TELEPHONE(£90) + SUBSTANTIVE_HEARING(£302) +  ADJOURNED_HEARING(£161)= £1700 |
