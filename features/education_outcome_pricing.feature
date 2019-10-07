@outcomes
Feature: Education outcome pricing
    Rules:
    • Education claims can be made starting 1/9/2019, which is part of the Unique File Number (UFN) date
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT < £816 AND VAT_INDICATOR = 'Y'
    then Price = Fixed Fee £272 + VAT + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT < £816 AND VAT_INDICATOR = 'N'
    then Price = Fixed Fee £272 + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT == £816 AND VAT_INDICATOR = 'Y'
    then Price = Fixed Fee £272 + VAT + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT == £816 AND VAT_INDICATOR = 'N'
    then Price = Fixed Fee £272 + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT > £816 AND VAT_INDICATOR = 'Y'
    then Price = Fixed Fee £272 + VAT + (Disbursements + VAT) & flag as Escape Fee case
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT > £816 AND VAT_INDICATOR = 'N'
    then Price = Fixed Fee £272 + (Disbursements + VAT) & flag as Escape Fee case

    Background: User bulk loads a file with Education outcomes
        Given user bulk loads monthly statement with "LEGAL HELP" - "Education" outcomes
        And user is on the "LEGAL HELP" pricing outcome details page

    Scenario Outline: Education outcome pricing
        When user is looking at outcome "<UFN>"
        Then user should see the outcome with one of these stage reached codes:
        | EA                |
        | EB                |
        | EC                |
        | ED                |
        And user should see the outcome priced at "£ <Price>"
        And the Escape Fee flag is "<Escape Fee>"
Examples:
        |  UFN             |  Profit ex. VAT    |  Counsel ex. VAT      |    Vat Indicator    |  Disbursements ex. VA |  Disbursements VAT |  Price       |    Escape Fee    |
        |  010919/100      |             815.00 |                  0.00 |          N          |                  0.00 |               0.00 |       272.00 |         N        |
        |  010919/101      |             817.00 |                  0.00 |          N          |                  0.00 |               0.00 |       272.00 |         Y        |
        |  010919/102      |             816.00 |                  0.00 |          N          |                  0.00 |               0.00 |       272.00 |         Y        |
        |  010919/103      |             715.00 |                100.00 |          N          |                  0.00 |               0.00 |       272.00 |         N        |
        |  010919/104      |             717.00 |                100.00 |          N          |                  0.00 |               0.00 |       272.00 |         Y        |
        |  010919/105      |             716.00 |                100.00 |          N          |                  0.00 |               0.00 |       272.00 |         Y        |
        |  010919/106      |             715.00 |                100.00 |          N          |                100.00 |               0.00 |       372.00 |         N        |
        |  010919/107      |             717.00 |                100.00 |          N          |                100.00 |               0.00 |       372.00 |         Y        |
        |  010919/108      |             716.00 |                100.00 |          N          |                100.00 |               0.00 |       372.00 |         Y        |
        |  010919/109      |             715.00 |                100.00 |          N          |                100.00 |              20.00 |       392.00 |         N        |
        |  010919/110      |             717.00 |                100.00 |          N          |                100.00 |              20.00 |       392.00 |         Y        |
        |  010919/111      |             716.00 |                100.00 |          N          |                100.00 |              20.00 |       392.00 |         Y        |
        |  010919/112      |             715.00 |                  0.00 |          Y          |                  0.00 |               0.00 |       326.40 |         N        |
        |  010919/113      |             717.00 |                  0.00 |          Y          |                  0.00 |               0.00 |       326.40 |         N        |
        |  010919/114      |             716.00 |                  0.00 |          Y          |                  0.00 |               0.00 |       326.40 |         N        |
        |  010919/115      |             715.00 |                100.00 |          Y          |                  0.00 |               0.00 |       326.40 |         N        |
        |  010919/116      |             717.00 |                100.00 |          Y          |                  0.00 |               0.00 |       326.40 |         Y        |
        |  010919/117      |             716.00 |                100.00 |          Y          |                  0.00 |               0.00 |       326.40 |         Y        |
        |  010919/118      |             715.00 |                100.00 |          Y          |                100.00 |               0.00 |       426.40 |         N        |
        |  010919/119      |             717.00 |                100.00 |          Y          |                100.00 |               0.00 |       426.40 |         Y        |
        |  010919/120      |             716.00 |                100.00 |          Y          |                100.00 |               0.00 |       426.40 |         Y        |
        |  010919/121      |             715.00 |                100.00 |          Y          |                100.00 |              20.00 |       446.40 |         N        |
        |  010919/122      |             717.00 |                100.00 |          Y          |                100.00 |              20.00 |       446.40 |         Y        |
        |  010919/123      |             716.00 |                100.00 |          Y          |                100.00 |              20.00 |       446.40 |         Y        |
