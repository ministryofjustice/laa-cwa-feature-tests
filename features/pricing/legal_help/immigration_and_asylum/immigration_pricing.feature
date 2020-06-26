Feature: Pricing for Immigration claims

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Bulkload Civil Immigration outcomes with additional fees, with EXEMPTION_CRITERIA_SATISFIED: <NONE>

    This is using fixed fees:

    - Base fee: £527
    - Substantive Hearing Fee: £237 (Yes or No)
    - Adjourned Hearing Fee: £161 (per unit, up to 9)
    - CMRH Oral Fee: £166 (per unit, up to 9)
    - CMRH Telephone Fee: £90 (per unit, up to 9)

    Calculation: [Fixed fee + SUBSTANTIVE_HEARING + ADJOURNED_HEARING_FEE (* 0-9) + CMRH_ORAL (* 0-9) + CMRH_TELEPHONE (* 0-9)] * VAT[Y/N] + Disbursments + Disbursments VAT
    Escape fee flag: (PROFIT_COST + COUNSEL_COST) > (3 * Base fee £527)

    Given the following Matter Types are chosen:
      | IMCC:ICZN |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | CMRH_ORAL | CMRH_TELEPHONE | EXEMPTION_CRITERIA_SATISFIED | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 010419/001 | 01/04/2019      | 100.0       | 500.0        | N             | N                   | 0                     | 0         | 0              | <blank>                      | 0                    | 0                 |
      | 2 | 010419/002 | 01/04/2019      | 100.0       | 500.0        | Y             | N                   | 0                     | 0         | 0              | <blank>                      | 0                    | 0                 |
      | 3 | 010419/003 | 01/04/2019      | 100.0       | 500.0        | Y             | Y                   | 0                     | 0         | 0              | <blank>                      | 0                    | 0                 |
      | 4 | 010419/004 | 01/04/2019      | 100.0       | 500.0        | Y             | Y                   | 2                     | 0         | 0              | <blank>                      | 0                    | 0                 |
      | 5 | 010419/005 | 01/04/2019      | 100.0       | 500.0        | Y             | Y                   | 2                     | 2         | 0              | <blank>                      | 0                    | 0                 |
      | 6 | 010419/006 | 01/04/2019      | 100.0       | 500.0        | Y             | Y                   | 2                     | 2         | 3              | <blank>                      | 0                    | 0                 |
      | 7 | 010419/007 | 01/04/2019      | 100.0       | 500.0        | Y             | Y                   | 2                     | 2         | 3              | <blank>                      | 100                  | 20                |
      | 8 | 010419/008 | 01/04/2019      | 1582        | 0            | Y             | Y                   | 2                     | 2         | 3              | <blank>                      | 100                  | 20                |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Escape Fee |
      | 1 | 010419/001 | £ 527.00   | N          |
      | 2 | 010419/002 | £ 632.40   | N          |
      | 3 | 010419/003 | £ 916.80   | N          |
      | 4 | 010419/004 | £ 1,303.20 | N          |
      | 5 | 010419/005 | £ 1,701.60 | N          |
      | 6 | 010419/006 | £ 2,025.60 | N          |
      | 7 | 010419/007 | £ 2,145.60 | N          |
      | 8 | 010419/008 | £ 2,145.60 | Y          |

  Scenario: Bulkload Civil Immigration outcomes with additional fees, with EXEMPTION_CRITERIA_SATISFIED: Child Migrant

    This is using hourly rates

    Calculation: (PROFIT_COST + COUNSEL_COST){capped to £500} * VAT[Y/N] + Disbursments + Disbursments VAT
    Escape fee flag: (PROFIT_COST + COUNSEL_COST) > £500

    Given the following Matter Types are chosen:
      | IMCC:ICZN |
    And the following outcomes are bulkloaded:
      | # | UFN        | CASE_START_DATE | PROFIT_COST | COUNSEL_COST | VAT_INDICATOR | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | CMRH_ORAL | CMRH_TELEPHONE | EXEMPTION_CRITERIA_SATISFIED | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 1 | 251019/001 | 25/10/2019      | 100.0       | 400.0        | Y             | N                   | 0                     | 0         | 0              | CM001                        | 0                    | 0                 |
      | 2 | 251019/002 | 25/10/2019      | 100.0       | 400.0        | Y             | Y                   | 0                     | 0         | 0              | CM001                        | 0                    | 0                 |
      | 3 | 251019/003 | 25/10/2019      | 100.0       | 401.0        | Y             | Y                   | 1                     | 0         | 0              | CM001                        | 0                    | 0                 |
      | 4 | 241019/004 | 24/10/2019      | 100.0       | 500.0        | Y             | N                   | 0                     | 0         | 0              | CM001                        | 100                  | 20                |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Escape Fee |
      | 1 | 251019/001 | £ 600.00 | N          |
      | 2 | 251019/002 | £ 600.00 | N          |
      | 3 | 251019/003 | £ 600.00 | Y          |
      | 4 | 241019/004 | £ 720.00 | Y          |
