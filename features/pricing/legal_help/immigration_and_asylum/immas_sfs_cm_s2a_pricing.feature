@outcomes
Feature: Asylum Standard Fee Scheme Child Migrant Stage 2a(CLR) outcome pricing

    In order to price child migrant Asylum cases correctly
    As a business stakeholder
    I want claims priced with hourly rates

    Rules:

    There are 2 pricing schemes in place for Immigration/Asylum claims.
    One scheme prices claims using hourly rates(HR), the other via a Standard Fee Scheme (SFS).
    The MT1 code determines the pricing scheme in place
    (see the section on Immigration in
    https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/832905/Guidance_for_Reporting_Controlled_Work_September_2019.pdf)

    For information on pricing via the SFS please see Tables 4(a-d)
    in http://www.legislation.gov.uk/uksi/2013/422/schedule/1/made).

    Child Migrant claims must be priced via hourly rates and there there is a £500
    cap above which the case must be flagged as an Escape Fee Case.  The rules on
    pricing Child Migrant cases are as follows:-

    • If Profit Costs ex. VAT + Counsel Costs ex. VAT < £500 AND VAT_INDICATOR = 'Y'
    then Price = (Profit Costs + VAT) + (Counsel Costs + VAT) + (Disbursements + VAT)

    • If Profit Costs ex. VAT + Counsel Costs ex. VAT < £500 AND VAT_INDICATOR = 'N'
    then Price = (Profit Costs) + (Counsel Costs) + (Disbursements + VAT)

    • If Profit Costs ex. VAT + Counsel Costs ex. VAT = £500 AND VAT_INDICATOR = 'Y'
    then Price = (Profit Costs + VAT) + (Counsel Costs + VAT) + (Disbursements + VAT)

    • If Profit Costs ex. VAT + Counsel Costs ex. VAT = £500 AND VAT_INDICATOR = 'N'
    then Price = (Profit Costs) + (Counsel Costs) + (Disbursements + VAT)

    • If Profit Costs ex. VAT + Counsel Costs ex. VAT > £500 AND VAT_INDICATOR = 'Y'
    then Price = (£500 + VAT) + (Disbursements + VAT) & flag as Escape Fee case

    • If Profit Costs ex. VAT + Counsel Costs ex. VAT > £500 AND VAT_INDICATOR = 'N'
    then Price = (£500) + (Disbursements + VAT) & flag as Escape Fee case

    Background:
      Given a test firm user is logged in CWA

    @slow
    Scenario: Bulk load child migrant Asylum claims and have them priced correctly
      When a user successfully bulk loads "o_sfs_immas_stage2a_clr_cm.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/424 | IACA:IOTH | £ 499.00 | N |
      | 011119/425 | IACA:IASY | £ 500.00 | N |
      | 011119/426 | IACA:IFST | £ 500.00 | Y |
      | 011119/427 | IACA:IFST | £ 499.00 | N |
      | 011119/428 | IACA:IASY | £ 500.00 | N |
      | 011119/429 | IACA:IFST | £ 500.00 | Y |
      | 011119/430 | IACA:ILEA | £ 599.00 | N |
      | 011119/431 | IACA:IFST | £ 600.00 | N |
      | 011119/432 | IACA:IOTH | £ 600.00 | Y |
      | 011119/433 | IACA:IFST | £ 619.00 | N |
      | 011119/434 | IACA:IFRA | £ 620.00 | N |
      | 011119/435 | IACA:ILEA | £ 620.00 | Y |
      | 011119/436 | IACA:IFRA | £ 598.80 | N |
      | 011119/437 | IACA:IFRA | £ 600.00 | N |
      | 011119/438 | IACA:IFST | £ 600.00 | Y |
      | 011119/439 | IACA:IASY | £ 598.80 | N |
      | 011119/440 | IACA:IOTH | £ 600.00 | N |
      | 011119/441 | IACA:IFRA | £ 600.00 | Y |
      | 011119/442 | IACA:IFRA | £ 698.80 | N |
      | 011119/443 | IACA:IFST | £ 700.00 | N |
      | 011119/444 | IACA:ILEA | £ 700.00 | Y |
      | 011119/445 | IACA:IRVL | £ 718.80 | N |
      | 011119/446 | IACA:ILEA | £ 720.00 | N |
      | 011119/447 | IACA:IIRC | £ 720.00 | Y |
