Feature: Discrimination outcome pricing
    Rules:
    • Discrimination claims can be made starting 1/9/2019, which is part of the Unique File Number (UFN) date
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT < £700 AND VAT_INDICATOR = 'Y'
    then Price = (Profit Costs + VAT) + (Counsel Costs + VAT) + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT < £700 AND VAT_INDICATOR = 'N'
    then Price = (Profit Costs) + (Counsel Costs) + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT == £700 AND VAT_INDICATOR = 'Y'
    then Price = (Profit Costs + VAT) + (Counsel Costs + VAT) + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT == £700 AND VAT_INDICATOR = 'N'
    then Price = (Profit Costs) + (Counsel Costs) + (Disbursements + VAT)
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT > £700 AND VAT_INDICATOR = 'Y'
    then Price = (£700 + VAT) + (Disbursements + VAT) & flag as Escape Fee case
    • If Profit Costs ex. VAT + Counsel Costs ex. VAT > £700 AND VAT_INDICATOR = 'N'
    then Price = (£700) + (Disbursements + VAT) & flag as Escape Fee case

    Background: User bulk loads a file with Discrimination outcomes
        Given user bulk loads monthly statement with "LEGAL HELP" - "Discrimination" outcomes
        And user is on the "LEGAL HELP" pricing outcome details page

    Scenario Outline: Discrimination outcome pricing
        When user is looking at outcome "<UFN>"
        Then user should see the outcome with stage reached "QA"
        And user should see the outcome priced at "£ <Price>"
        And the Escape Fee flag is "<Escape Fee>"

        Examples:
            | UFN        | Profit ex. VAT | Counsel ex. VAT | Vat Indicator | Disbursements ex. VAT | Disbursements VAT | Price  | Escape Fee |
            | 010919/001 | 699.99         | 0.00            | N             | 0.00                  | 0.00              | 699.99 | N          |
            | 010919/002 | 701.00         | 0.00            | N             | 0.00                  | 0.00              | 700.00 | Y          |
            | 010919/003 | 700.00         | 0.00            | N             | 0.00                  | 0.00              | 700.00 | N          |
            | 010919/004 | 599.99         | 100.00          | N             | 0.00                  | 0.00              | 699.99 | N          |
            | 010919/005 | 601.00         | 100.00          | N             | 0.00                  | 0.00              | 700.00 | Y          |
            | 010919/006 | 600.00         | 100.00          | N             | 50.00                 | 10.00             | 760.00 | N          |
            | 010919/007 | 599.00         | 100.00          | N             | 100.00                | 0.00              | 799.00 | N          |
            | 010919/008 | 601.00         | 100.00          | N             | 100.00                | 0.00              | 800.00 | Y          |
            | 010919/009 | 600.00         | 100.00          | N             | 100.00                | 0.00              | 800.00 | N          |
            | 010919/010 | 599.00         | 100.00          | N             | 100.00                | 20.00             | 819.00 | N          |
            | 010919/011 | 601.00         | 100.00          | N             | 100.00                | 20.00             | 820.00 | Y          |
            | 010919/012 | 600.00         | 100.00          | N             | 100.00                | 20.00             | 820.00 | N          |
            | 010919/013 | 699.99         | 0.00            | Y             | 0.00                  | 0.00              | 839.99 | N          |
            | 010919/014 | 701.00         | 0.00            | Y             | 0.00                  | 0.00              | 840.00 | Y          |
            | 010919/015 | 700.00         | 0.00            | Y             | 0.00                  | 0.00              | 840.00 | N          |
            | 010919/016 | 599.99         | 100.00          | Y             | 0.00                  | 0.00              | 839.99 | N          |
            | 010919/017 | 601.00         | 100.00          | Y             | 0.00                  | 0.00              | 840.00 | Y          |
            | 010919/018 | 600.00         | 100.00          | Y             | 50.00                 | 10.00             | 900.00 | N          |
            | 010919/019 | 599.00         | 100.00          | Y             | 100.00                | 0.00              | 938.80 | N          |
            | 010919/020 | 601.00         | 100.00          | Y             | 100.00                | 0.00              | 940.00 | Y          |
            | 010919/021 | 600.00         | 100.00          | Y             | 100.00                | 0.00              | 940.00 | N          |
            | 010919/022 | 599.00         | 100.00          | Y             | 100.00                | 20.00             | 958.80 | N          |
            | 010919/023 | 601.00         | 100.00          | Y             | 100.00                | 20.00             | 960.00 | Y          |
            | 010919/024 | 600.00         | 100.00          | Y             | 100.00                | 20.00             | 960.00 | N          |
