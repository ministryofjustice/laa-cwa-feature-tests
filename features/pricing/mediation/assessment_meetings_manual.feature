Feature: Pricing for Assessment Meeting claims

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "MEDIATION#15"

  Scenario: Claims priced with: Unit price
   Given the following Matter Types are chosen:
      | ASSM:ASSA |
    When the following outcomes are bulkloaded:
      | UNIQUE_CASE_ID | CASE_START_DATE | WORK_CONCLUDED_DATE | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      |     010420/001 |      01/04/2020 |          31/03/2020 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                     |
      | 1 | 010420/001 | £ 207.00 | Unit price for ASSM:ASSA £87 , priced at unit price + disbursement amount +  disbursement vat = £87 + £100 + £20 |

Scenario: Claims priced with: Unit price
   Given the following Matter Types are chosen:
      | ASSM:ASSS |
    When the following outcomes are bulkloaded:
      | UNIQUE_CASE_ID | CASE_START_DATE | WORK_CONCLUDED_DATE | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      |     010420/001 |      01/04/2020 |          31/03/2020 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                     |
      | 1 | 010420/001 | £ 207.00 | Unit price for ASSM:ASSS £87 , priced at unit price + disbursement amount +  disbursement vat = £87 + £100 + £20 |

Scenario: Claims priced with: Unit price
   Given the following Matter Types are chosen:
      | ASSM:ASST |
    When the following outcomes are bulkloaded:
      | UNIQUE_CASE_ID | CASE_START_DATE | WORK_CONCLUDED_DATE | VAT_INDICATOR | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      |     010420/001 |      01/04/2020 |          31/03/2020 | N             |                100.0 |                20 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                                                                                     |
      | 1 | 010420/001 | £ 250.00 | Unit price for ASSM:ASST £130 , priced at unit price + disbursement amount +  disbursement vat = £130 + £100 + £20 |
