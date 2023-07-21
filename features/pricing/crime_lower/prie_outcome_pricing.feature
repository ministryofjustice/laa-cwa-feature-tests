Feature: PRIE outcome pricing
  Rules:
  • New Stage reached code `PRIE` should price the same as existing `PRIC`
  • Fixed fee starts from 19/7/2019, which is part of the Unique File Number (UFN) date
  • If profit < £49.82 then price = £0.00
  • If profit costs > £49.81 and (profit + waiting < £933.94) then price = (£437.21 + VAT) + disbursements + disbursements VAT
  • If profit costs > £49.81 and (profit + waiting > £933.93) then price = (£1454.44 + VAT) + disbursements + disbursements VAT
  • If profit + waiting > £4362.53 then flag as Escape Fee case

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#8"
    And the following Matter Types are chosen:
      | PRIE |

  Scenario: Bulkload PRIE outcomes
    And the following outcomes are bulkloaded:
      | UFN        | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS_EXCLUDING_VAT | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 190719/001 |       49.81 | N             |                       0.00 |                 0.00 |                 0.00 |              0.00 |
      | 190719/002 |       49.82 | N             |                       0.00 |                 0.00 |                 0.00 |              0.00 |
      | 190719/003 |       49.81 | N             |                       0.00 |               100.00 |                  100 |             20.00 |
      | 190719/004 |       49.81 | N             |                    1000.00 |                 0.00 |                 0.00 |              0.00 |
      | 190719/005 |       49.82 | N             |                       0.00 |               884.11 |               100.00 |             20.00 |
      | 190719/006 |       49.82 | N             |                       0.00 |               884.12 |                 0.00 |              0.00 |
      | 190719/007 |       49.82 | Y             |                       0.00 |               884.12 |                 0.00 |              0.00 |
      | 190719/008 |       49.82 | Y             |                       0.00 |               884.12 |               100.00 |             20.00 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                                                                                                   |
      | 1 | 190719/001 | £ 0.00     | Fixed fee = 0 where Profit Costs less than 49.82 hence total value = £0.00                                                                                                                                                                                |
      | 2 | 190719/002 | £ 437.21   | Fixed fee = 437.21 where Profit Costs greater than 49.81 and Profit plus Waiting < 933.94                                                                                                                                                                 |
      | 3 | 190719/003 | £ 0.00     | Fixed fee = 0 where Profit Costs less than 49.82, waiting cost = £100 does not add up with PC > 933.93, no impact of disbursement or disbursement vat, hence total value = £0.00                                                                          |
      | 4 | 190719/004 | £ 0.00     | Fixed fee = 0 where Profit Costs less than 49.82, no impact of travel cost for PRIE code,  hence total value = £0.00                                                                                                                                      |
      | 5 | 190719/005 | £ 557.21   | Fixed fee = 437.21 where Profit Costs greater than 49.81 also PC+ waiting cost = £933.33, total value = fixed fee(437.21) + disbursements(£100.00) + disbursement vat(£20) = £557.21                                                                      |
      | 6 | 190719/006 | £ 1,454.44 | Fixed fee = 1454.44 where Profit Costs greater than 49.81 also PC+ waiting cost > £933.33, total value = fixed fee(1454.44) = £1454.44                                                                                                                    |
      | 7 | 190719/007 | £ 1,745.33 | Fixed fee = 1454.44 where Profit Costs greater than 49.81 also PC+ waiting cost > £933.33, vat indicator = Y , total value = fixed fee(1454.44) + 20% vat on fixed fee(20% of £1454.44 = £290.89) = £1745.33                                              |
      | 8 | 190719/008 | £ 1,865.33 | Fixed fee = 1454.44 where Profit Costs greater than 49.81 also PC+ waiting cost > £933.33, vat indicator = Y , total value = fixed fee(1454.44) + 20% vat on fixed fee(20% of £1454.44 = £290.89) + Disbursements(£100) + DisbursementVat(£20) = £1865.33 |

  Scenario: Bulkload PRIE outcomes and If profit >= escape threshold, escape case
    And the following outcomes are bulkloaded:
      | UFN        | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS_EXCLUDING_VAT | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 190719/009 |     4362.54 | Y             |                       0.00 |                 0.00 |               100.00 |             20.00 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value      | Comment                                                                                                                                                                                                                    |
      | 9 | 190719/009 | £ 1,865.33 | Fixed fee = 1454.44 where Profit Costs greater than 49.81 , vat indicator = Y , total value = fixed fee(1454.44) + 20% vat on fixed fee(20% of £1454.44 = £290.89) + Disbursements(£100) + DisbursementVat(£20) = £1865.33 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                              |
      | escape fee threshold capped at £4362.54 in CWA ,Profit cost £4362.54 >= threshold, hence escape case |

  Scenario: Bulkload PRIE outcomes and If profit + waiting cost >= escape threshold, escape case
    And the following outcomes are bulkloaded:
      | UFN        | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS_EXCLUDING_VAT | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 190719/010 |       49.82 | Y             |                       0.00 |              4312.72 |               100.00 |             20.00 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | #  | UFN        | Value      | Comment                                                                                                                                                                                                                    |
      | 10 | 190719/010 | £ 1,865.33 | Fixed fee = 1454.44 where Profit Costs greater than 49.81 , vat indicator = Y , total value = fixed fee(1454.44) + 20% vat on fixed fee(20% of £1454.44 = £290.89) + Disbursements(£100) + DisbursementVat(£20) = £1865.33 |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                               |
      | escape fee threshold capped at £4362.54 in CWA ,PC + waiting cost = £4362.54 >= threshold(£4362.54) hence escape case |

  Scenario: Bulkload PRIE outcomes and If profit + waiting costs < escape threshold, not an escape case
    And the following outcomes are bulkloaded:
      | UFN        | PROFIT_COST | VAT_INDICATOR | TRAVEL_COSTS_EXCLUDING_VAT | TRAVEL_WAITING_COSTS | DISBURSEMENTS_AMOUNT | DISBURSEMENTS_VAT |
      | 190719/011 |       49.82 | Y             |                       0.00 |              4312.71 |               100.00 |             20.00 |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | #  | UFN        | Value      | Comment                                                                                                                                                                                                                    |
      | 11 | 190719/011 | £ 1,865.33 | Fixed fee = 1454.44 where Profit Costs greater than 49.81 , vat indicator = Y , total value = fixed fee(1454.44) + 20% vat on fixed fee(20% of £1454.44 = £290.89) + Disbursements(£100) + DisbursementVat(£20) = £1865.33 |
    Then the outcomes are NOT flagged as escape fee cases
      | Comment                                                                                                                   |
      | escape fee threshold capped at £4362.54 in CWA ,PC + waiting cost = £4362.54 < threshold(£4362.54) hence not escape case, |
