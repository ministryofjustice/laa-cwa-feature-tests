@outcomes
Feature: Asylum Standard Fee Scheme Child Migrant Stage 1(LH) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immas_stage1_lh_cm.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/400 | IALB:IOTH | £ 499.00 | N |
      | 011119/401 | IALB:IFRA | £ 500.00 | N |
      | 011119/402 | IALB:IRVL | £ 500.00 | Y |
      | 011119/403 | IALB:ILEA | £ 499.00 | N |
      | 310313/404 | IALB:IGOL | £ 500.00 | N |
      | 011119/405 | IALB:IRVL | £ 500.00 | Y |
      | 011119/406 | IALB:IFRA | £ 599.00 | N |
      | 011119/407 | IALB:ILEA | £ 600.00 | N |
      | 310313/408 | IALB:IGOL | £ 600.00 | Y |
      | 011119/409 | IALB:ILEA | £ 619.00 | N |
      | 011119/410 | IALB:IFRA | £ 620.00 | N |
      | 011119/411 | IALB:IIRC | £ 620.00 | Y |
      | 011119/412 | IALB:ILEA | £ 598.80 | N |
      | 011119/413 | IALB:IASY | £ 600.00 | N |
      | 011119/414 | IALB:IIRC | £ 600.00 | Y |
      | 011119/415 | IALB:IFST | £ 598.80 | N |
      | 011119/416 | IALB:IIRC | £ 600.00 | N |
      | 310313/417 | IALB:IGOL | £ 600.00 | Y |
      | 310313/418 | IALB:IGOL | £ 698.80 | N |
      | 310313/419 | IALB:IGOL | £ 700.00 | N |
      | 011119/420 | IALB:ILEA | £ 700.00 | Y |
      | 011119/421 | IALB:ILEA | £ 718.80 | N |
      | 011119/422 | IALB:IFRA | £ 720.00 | N |
      | 011119/423 | IALB:IIRC | £ 720.00 | Y |
