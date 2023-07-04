Feature: Pricing: EDOT: Other

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.EDU#9"
    Given the following Matter Types are chosen:
      | EDOT:EDSC |

  Scenario: Claims priced with: Standard Fee Scheme
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         200 |           73 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                            |
      | 1 | 010120/001 | £ 272.00 | Standard fee for MT1 EDAM £272 , priced at fixed fee even though PC+CC > Fixed fee |

  Scenario: Claims priced with: Disbursements
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         273 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                              |
      | 1 | 010120/001 | £ 392.00 | Standard fee for MT1 EDAM £272  + DibursementAmount= £100 + DisbursementVat = £20.00 |

  Scenario: Claims priced with: VAT Indicator enabled
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         273 | Y             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                            |
      | 1 | 010120/001 | £ 326.40 | Standard fee for MT1 EADM £272  + 20% vat on standard fee = £54.40 |

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (profit cost + counsel cost => the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         400 |          416 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 272.00 | Standard fee for MT1 EADM £272 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                                                     |
      | escape threhold 3 * standard fee (£272) = £816, Profit_Cost(£400) + Counsel_Cost(£416) - No Additioanal_payments(0) as category of law is  Education = £816 |

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (profit cost + counsel cost < the escape threshold)
    When the following outcomes are bulkloaded:
      | # | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR |
      | 1 | 010120/001 | CM         |      01/01/2020 |          31/03/2020 |         400 |          415 | N             |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010120/001 | £ 272.00 | Standard fee for MT1 EADM £272 is the total |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                                                     |
      | escape threhold 3 * standard fee (£272) = £816, Profit_Cost(£400) + Counsel_Cost(£415) - No Additioanal_payments(0) as category of law is  Education = £815 |