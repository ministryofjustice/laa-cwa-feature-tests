Feature: Pricing for Assessment Meeting claims

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "MEDIATION#15"

  Scenario: Claims priced with: Unit price
    Given the following Matter Types are chosen:
      | MEDI:MDAC |
    When the following outcomes are bulkloaded:
      | UNIQUE_CASE_ID | CASE_START_DATE | MED_CONCLUDED_DATE | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | CLIENT2_LEGALLY_AIDED | NUMBER_OF_MEDIATION_SESSIONS | OUTCOME_CODE |
      |     151110/001 |      15/11/2010 |         02/11/2014 | N             |                100.0 |                20 | N                     |                            1 | A            |
      |     031114/002 |      03/11/2014 |         11/10/2023 | Y             |                100.0 |                20 | N                     |                            1 | A            |
      |     151110/003 |      15/11/2010 |         02/11/2014 | N             |                100.0 |                20 | N                     |                            2 | A            |
      |     031114/004 |      03/11/2014 |         11/10/2023 | N             |                100.0 |                20 | N                     |                            2 | A            |
      |     151110/005 |      15/11/2010 |         11/10/2023 | N             |                100.0 |                20 | Y                     |                            1 | A            |
      |     151110/006 |      15/11/2010 |         11/10/2023 | N             |                100.0 |                20 | Y                     |                            2 | A            |
      |     151110/007 |      15/11/2010 |         02/11/2014 | N             |                100.0 |                20 | N                     |                            1 | C            |
      |     031114/008 |      03/11/2014 |         11/10/2023 | N             |                100.0 |                20 | N                     |                            1 | P            |
      |     151110/009 |      15/11/2010 |         02/11/2014 | N             |                100.0 |                20 | N                     |                            2 | P            |
      |     031114/010 |      03/11/2014 |         11/10/2023 | Y             |              10000.0 |              2000 | N                     |                            2 | S            |
      |     151110/011 |      15/11/2010 |         11/10/2023 | Y             |              10000.0 |              2000 | Y                     |                            2 | C            |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | #  | UFN        | Value       | Comment                                                                                                                                                                                                                                                                              |
      |  1 | 151110/001 | £ 235.00    | Unit price for MEDI:MDAC when above start/end date £115 1 mediation session 1 legally aided , priced at unit price + disbursement amount +  disbursement vat = £115 + £100 + £20                                                                                                     |
      |  2 | 031114/002 | £ 396.00    | Unit price for MEDI:MDAC £230 for start/end date 1 mediation session 1 legally aided, priced at unit price + vat amount + disbursement amount +  disbursement vat = £230 + 20%(230) + £100 + £20                                                                                     |
      |  3 | 151110/003 | £ 652.00    | Unit price for MEDI:MDAC £532 for start/end date 2 mediation session 1 legally aided, priced at unit price + disbursement amount +  disbursement vat = £532 + £100 + £20                                                                                                             |
      |  4 | 031114/004 | £ 767.00    | Unit price for MEDI:MDAC £647 for start/end date 2 mediation session 1 legally aided, priced at unit price + disbursement amount +  disbursement vat = £647 + £100 + £20                                                                                                             |
      |  5 | 151110/005 | £ 350.00    | Unit price for MEDI:MDAC £230 for start/end date 1 mediation session 2 legally aided, priced at unit price + disbursement amount +  disbursement vat = £230 + £100 + £20                                                                                                             |
      |  6 | 151110/006 | £ 1,184.00  | Unit price for MEDI:MDAC £1064 for start/end date 2 mediation session 2 legally aided, priced at unit price + disbursement amount +  disbursement vat = £1064 + £100 + £20                                                                                                           |
      |  7 | 151110/007 | £ 298.00    | Unit price for MEDI:MDAC £115 for start/end date 1 mediation session 1 legally aided, outcome code "C" addiional payment(£63) priced at unit price + disbursement amount +  disbursement vat + addiional payment = £115 + £100 + £20 + £63                                           |
      |  8 | 031114/008 | £ 444.50    | Unit price for MEDI:MDAC £230 for start/end date 1 mediation session 1 legally aided, outcome code "P" addiional payment(£94.50) priced at unit price + disbursement amount +  disbursement vat + addiional payment = £230 + £100 + £20 + £94.50                                     |
      |  9 | 151110/009 | £ 746.50    | Unit price for MEDI:MDAC £532 for start/end date 2 mediation session 1 legally aided, outcome code "P" addiional payment(£94.50) priced at unit price + disbursement amount +  disbursement vat + addiional payment = £532 + £100 + £20 + £94.50                                     |
      | 10 | 031114/010 | £ 12,927.60 | Unit price for MEDI:MDAC £647 for start/end date 2 mediation session 1 legally aided, outcome code "S" addiional payment(£126) priced at unit price + disbursement amount +  disbursement vat + addiional payment + vat on (unit+additonal) = £647 + £10000 + £2000 + £126 + £154.60 |
      | 11 | 151110/011 | £ 13,428.00 | Unit price for MEDI:MDAC £1064 for start/end date 2 mediation session 2 legally aided, outcome code "C" addiional payment(£126) priced at unit price + disbursement amount +  disbursement vat + addiional payment + vat on (unit+additonal) = £1064 + £10000 + £2000 + £126 + £238  |

  Scenario: Claims priced with: Unit price
    Given the following Matter Types are chosen:
      | MEDI:MDAS |
    When the following outcomes are bulkloaded:
      | UNIQUE_CASE_ID | CASE_START_DATE | MED_CONCLUDED_DATE | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT | CLIENT2_LEGALLY_AIDED | NUMBER_OF_MEDIATION_SESSIONS | OUTCOME_CODE |
      |     031114/001 |      03/11/2014 |         11/10/2023 | Y             |                100.0 |                20 | N                     |                            1 | C            |
      |     151110/002 |      15/11/2010 |         11/10/2023 | N             |                100.0 |                20 | Y                     |                            2 | S            |
      |     151110/003 |      15/11/2010 |         11/10/2023 | N             |                 0.00 |                 0 | Y                     |                            1 | P            |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                                                                                                                                    |
      | 1 | 031114/001 | £ 397.20   | Unit price for MEDI:MDAS £168 for start/end date 1 mediation session 1 legally aided, outcome code "C" addiional payment(£63) priced at unit price + vat amount + disbursement amount +  disbursement vat + addiional payment + vat on (unit+additonal) = £168 + £100 + £20 + £63 + £46.20 |
      | 2 | 151110/002 | £ 1,128.00 | Unit price for MEDI:MDAS £756 for start/end date 2 mediation session 2 legally aided, outcome code "S" addiional payment(£252) priced at unit price + disbursement amount +  disbursement vat + addiional payment = £756 + £100 + £20 + £252                                               |
      | 2 | 151110/003 | £ 357.00   | Unit price for MEDI:MDAS £168 for start/end date 1 mediation session 2 legally aided, outcome code "P" addiional payment(£189) priced at unit price + disbursement amount +  disbursement vat + addiional payment = £168 + £0 + £0 + £189                                                  |
