Feature: Pricing: IALB: Asylum - Stage 1 (LH)

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IALB:IASY |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 |           14 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                            |
      | 1 | 010120/001 | £ 413.00 | Standard fee for MT1 IALB £413 , priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Additional Payments
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                 |
      | 1 | 010120/001 | £ 679.00 | Standard fee(£413) + HO_INTERVIEW(£266) |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010120/001 | £ 533.00 | Standard fee for MT1 IALB £413  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |         400 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                            |
      | 1 | 010120/001 | £ 495.60 | Standard fee for MT1 IALB £413  + 20% vat on standard fee = £82.60 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |        1000 |          240 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 413.00 | Standard fee for MT1 IALB £413 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£413) = £1239, Profit_Cost(£1000) + Counsel_Cost(£240) - Additioanal_payments(0)= £1240 |

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |        1000 |          238 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 413.00 | Standard fee for MT1 IALB £413 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape threhold 3 * standard fee (£413) = £1239, Profit_Cost(£1000) + Counsel_Cost(£238) - Additioanal_payments(0)= £1238 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |        1200 |          305 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                  |
      | 1 | 010120/001 | £ 679.00 | Standard fee(£413) +  HO_INTERVIEW(£266) |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                    |
      | escape threhold 3 * standard fee (£413) = £1239, Profit_Cost(£1200) + Counsel_Cost(£305) - Additioanal_payments(HO_INTERVIEW(£266))= £1239 |

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (additional payments)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | HO_INTERVIEW |
      | 1 | 010120/001 | CM         |      03/10/2011 |          31/03/2023 |        1200 |          304 | N             |            1 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                 |
      | 1 | 010120/001 | £ 679.00 | Standard fee(£413) + HO_INTERVIEW(£266) |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                    |
      | escape threhold 3 * standard fee (£413) = £1239, Profit_Cost(£1200) + Counsel_Cost(£304) - Additioanal_payments(HO_INTERVIEW(£266))= £1238 |

  Scenario: Claims priced with: Standard Fee Scheme with NRM advice
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | NATIONAL_REF_MECHANISM_ADVICE |
      | 1 | 010423/001 | CM         |      01/04/2023 |          20/04/2023 |         400 |           28 | N             | Y                             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                               |
      | 1 | 010423/001 | £ 563.00 | Standard fee for MT1 IALB £413 + NRM_ADVICE Bolt On fee (£150) = £563 |

  Scenario: Claims priced with: Standard Fee Scheme without NRM advice bolt-on , ignoring NRM bolt-on as start date earler to 01/04/23
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | NATIONAL_REF_MECHANISM_ADVICE |
      | 1 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 |         400 |           28 | N             | Y                             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                      |
      | 1 | 010413/001 | £ 413.00 | Standard fee for MT1 IALB £413 priced at standard fee , ignoring NRM bolt-on as start date earler to 01/04/23, NRM_ADVICE Bolt On fee (£150) |
