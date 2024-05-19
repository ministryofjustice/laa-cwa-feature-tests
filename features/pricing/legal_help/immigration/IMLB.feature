Feature: Pricing: IMLB: Immigration - Stage 1 (LH)

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IMLB:IGOL |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         200 |           35 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                            |
      | 1 | 010120/001 | £ 234.00 | Standard fee for MT1 IMLB £234 , priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Additional Payments
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                 |
      | 1 | 010120/001 | £ 500.00 | Standard fee(£234) + HO_INTERVIEW(£266) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010120/001 | £ 354.00 | Standard fee for MT1 IMLB £234  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                            |
      | 1 | 010120/001 | £ 280.80 | Standard fee for MT1 IMLB £234  + 20% vat on standard fee = £46.80 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         500 |          202 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 234.00 | Standard fee for MT1 IMLB £234 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                |
      | escape threhold 3 * standard fee (£234) = £702, Profit_Cost(£500) + Counsel_Cost(£202) - Additioanal_payments(0)= £702 |

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         500 |          201 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 234.00 | Standard fee for MT1 IMLB £234 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                |
      | escape threhold 3 * standard fee (£234) = £702, Profit_Cost(£500) + Counsel_Cost(£201) - Additioanal_payments(0)= £701 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         500 |          468 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                  |
      | 1 | 010120/001 | £ 500.00 | Standard fee(£234) +  HO_INTERVIEW(£266) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                 |
      | escape threhold 3 * standard fee (£234) = £702, Profit_Cost(£500) + Counsel_Cost(£468) - Additioanal_payments(HO_INTERVIEW(£266))= £702 |

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         500 |          467 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                 |
      | 1 | 010120/001 | £ 500.00 | Standard fee(£234) + HO_INTERVIEW(£266) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                 |
      | escape threhold 3 * standard fee (£234) = £702, Profit_Cost(£500) + Counsel_Cost(£467) - Additioanal_payments(HO_INTERVIEW(£266))= £701 |

  Scenario: Claims priced with: Standard Fee Scheme with NRM advice
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | NATIONAL_REF_MECHANISM_ADVICE |
      | 1 | 010423/001 | CM         |      01/04/2023 |          20/04/2023 |         200 |           35 | N             | Y                             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                               |
      | 1 | 010423/001 | £ 384.00 | Standard fee for MT1 IMLB £234 + NRM_ADVICE Bolt On fee (£150) = £384 |

  Scenario: Claims priced with: Standard Fee Scheme without NRM advice bolt-on , ignoring NRM bolt-on as start date earler to 01/04/23
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | NATIONAL_REF_MECHANISM_ADVICE |
      | 1 | 310323/001 | CM         |      31/03/2023 |          31/03/2023 |         200 |           35 | N             | Y                             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                      |
      | 1 | 310323/001 | £ 234.00 | Standard fee for MT1 IMLB £234 priced at standard fee , ignoring NRM bolt-on as start date earler to 01/04/23, NRM_ADVICE Bolt On fee (£150) |
