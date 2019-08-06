Feature: PRIE outcome pricing
  Rules:
    • New PRIE should price the same as existing PRIC
    • Fixed fee starts from 19/7/2019, which is part of the UFN date
    • If profit < 49.82 then price = £0.00
    • If profit costs > 49.81 and (profit + waiting < 933.94) then price = (437.21 + VAT) + disbursements + disbursements VAT
    • If profit costs > 49.81 and (profit + waiting > 933.93) then price = (1454.44 + VAT) + disbursements + disbursements VAT
    • If profit + waiting > 4362.53 then flag as Escape Fee case

Background: User bulk loads a file with PRIE outcomes
  Given user bulk loaded a file with PRIE outcomes
  And user is on the pricing outcome details page

Scenario Outline: PRIE outcome pricing
  When user is looking at outcome "<UFN>"
  Then user should see the outcome priced at "£ <Price>"
  And the Escape Fee flag is "<Escape Fee>"

  Examples:
    |        UFN | Profit ex. VAT | Waiting ex. VAT | Disbursements ex. VAT | Disbursements VAT | Fixed Fee ex. VAT | Fixed Fee VAT |    Price | Escape Fee |
    | 180719/001 |          49.81 |            0.00 |                  0.00 |              0.00 |              0.00 |          0.00 |    49.81 |          N |
    | 190719/002 |          49.81 |            0.00 |                  0.00 |              0.00 |              0.00 |          0.00 |     0.00 |          N |
    | 190719/003 |          49.81 |            0.00 |                100.00 |             20.00 |              0.00 |          0.00 |     0.00 |          N |
    | 190719/004 |          49.82 |          884.11 |                  0.00 |              0.00 |            437.21 |         87.44 |   524.65 |          N |
    | 190719/005 |          49.82 |          884.11 |                100.00 |             20.00 |            437.21 |         87.44 |   644.65 |          N |
    | 190719/006 |          49.82 |          884.12 |                  0.00 |              0.00 |           1454.44 |        290.89 | 1,745.33 |          N |
    | 190719/007 |          49.82 |          884.12 |                100.00 |             20.00 |           1454.44 |        290.89 | 1,865.33 |          N |
    | 190719/008 |          49.82 |         4312.71 |                  0.00 |              0.00 |           1454.44 |        290.89 | 1,745.33 |          N |
    | 190719/009 |          49.82 |         4312.72 |                  0.00 |              0.00 |           1454.44 |        290.89 | 1,745.33 |          Y |
