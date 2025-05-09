@skip
Feature: Validation for Illegal Immigration Act

  Scenario Outline: IAXL:IDAS pricing before start date 14 dec 2023. Testing pricing for effective date for DTW pricing.
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | work_concluded_date | claim_type | profit_cost | counsel_cost | disbursements_amount | disbursements_vat | vat_indicator | travel_costs |
      |     001 | IAXL:IDAS   |      01/05/2023 |          01/08/2023 | CM         |         100 |            0 |                  100 |                20 | N             |          100 |
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                          |
      | 1 | 010523/001 | £ 220.00 | Priced at hourly rates (profit cost(£10) +  counsel cost(£0)) + disbursement vat(£1500) + disbursement vat(£300) |

  Scenario: IAXL:IDAS pricing after start date 14 dec 2023. Testing pricing for effective date for DTW pricing.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | #  | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      |  1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |         100 |          100 | Y             |               100.00 |                20 | TR001                        |
      |  2 |     002 | 151223/002 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |         100 |          100 | Y             |               100.00 |                20 | TR001                        |
      |  3 |     003 | 151223/003 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |           0 |          100 | Y             |               100.00 |                20 | TR001                        |
      |  4 |     004 | 151223/004 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |         100 |          100 | Y             |                    0 |                 0 | TR001                        |
      |  5 |     005 | 151223/005 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |         100 |          100 | Y             |                  100 |                 0 | TR001                        |
      |  6 |     006 | 151223/006 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |         100 |          100 | Y             |                    0 |                 0 | TR001                        |
      |  7 |     007 | 151223/007 | CM         |      15/12/2023 |          15/12/2023 | IX           |              |           0 |            0 | Y             |                  100 |                 0 | TR001                        |
      |  8 |     008 | 151223/008 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |           0 |            0 | Y             |                    0 |                 0 | TR001                        |
      |  9 |     009 | 151223/009 | CM         |      15/12/2023 |          15/12/2023 | IX           |          100 |           0 |          100 | Y             |                    0 |                 0 | TR001                        |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | #  | UFN        | Value    | Comment                                                                                                                                                                                |
      |  1 | 151223/001 | £ 480.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£100)) + disbursement amount(£100) + disbursement vat(£20) + pc/cc vat(£60) + DTW cost(£100)                                 |
      |  2 | 151223/002 | £ 360.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£100)) + disbursement amount(£100) + disbursement vat(£20) + pc/cc vat(£40)                                                  |
      |  3 | 151223/003 | £ 360.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£100)) + disbursement amount(£100) + disbursement vat(£20) + pc/cc vat(£40) + DTW cost(£100)                                   |
      |  4 | 151223/004 | £ 360.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£100)) + disbursement amount(£0) + disbursement vat(£60) + pc/cc vat(£0) + DTW cost(£100)                                    |
      |  5 | 151223/005 | £ 340.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£100)) + disbursement amount(£100) + disbursement vat(£0) + pc/cc vat(£40) + DTW cost(£0)                                    |
      |  6 | 151223/006 | £ 240.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£100)) + disbursement amount(£0) + disbursement vat(£0) + pc/cc vat(£40) + DTW cost(£0)                                      |
      |  7 | 151223/007 | £ 100.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement amount(£100) + disbursement vat(£0) + pc/cc vat(£0) + DTW cost(£0)                                         |
      |  8 | 151223/008 | £ 0.00   | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement amount(£0) + disbursement vat(£0) + pc/cc vat(£0) + DTW cost(£0) ignores as PC and CC are zero(nil claims) |
      |  9 | 151223/009 | £ 240.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£100)) + disbursement amount(£0) + disbursement vat(£0) + pc/cc vat(£40) + DTW cost(£100)                                      |

  Scenario: IAXL:IDAS pricing before start date 14 dec 2023. Testing pricing for effective date for DTW pricing.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 131223/001 | CM         |      13/12/2023 |          15/12/2023 | IX           |          100 |         100 |          100 | Y             |               100.00 |                20 | TR001                        |
      | 2 |     002 | 131223/002 | CM         |      13/12/2023 |          15/12/2023 | IX           |          100 |           0 |            0 | Y             |               100.00 |                20 | TR001                        |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                                                                                                                                                                       |
      | 1 | 131223/001 | £ 360.00 | Priced at hourly rates (profit cost(£100) +  counsel cost(£100)) + disbursement amount(£100) + disbursement vat(£20) + pc/cc vat(£40) + DTW cost(£100) ignores as code comnination does not price DTW prior to 14 dec in tst(effective date(01/01/24 in prod) |
      | 2 | 131223/002 | £ 120.00 | Priced at hourly rates (profit cost(£0) +  counsel cost(£0)) + disbursement amount(£100) + disbursement vat(£20) + pc/cc vat(£0) + DTW cost(£100) ignores as code comnination does not price DTW prior to 14 dec in tst(effective date(01/01/24 in prod)      |