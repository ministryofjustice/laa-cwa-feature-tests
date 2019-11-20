@outcomes
Feature: Immigration Standard Fee Scheme Child Migrant Stage 2a(CLR) outcome pricing

    In order to price child migrant Immigration cases correctly
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
    Scenario: Bulk load child migrant Immigration claims and have them priced correctly
      When a user successfully bulk loads "o_sfs_immot_stage2a_clr_cm.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/496 | IMCA:ICZN | £ 499.00 | N |
      | 011119/497 | IMCA:IIRC | £ 500.00 | N |
      | 011119/498 | IMCA:IDOM | £ 500.00 | Y |
      | 011119/499 | IMCA:IIRC | £ 499.00 | N |
      | 310313/500 | IMCA:IGOL | £ 500.00 | N |
      | 011119/501 | IMCA:IIRC | £ 500.00 | Y |
      | 011119/502 | IMCA:IOTH | £ 599.00 | N |
      | 011119/503 | IMCA:IDOM | £ 600.00 | N |
      | 011119/504 | IMCA:IDOM | £ 600.00 | Y |
      | 011119/505 | IMCA:IOTH | £ 619.00 | N |
      | 011119/506 | IMCA:IDOM | £ 620.00 | N |
      | 310313/507 | IMCA:IGOL | £ 620.00 | Y |
      | 310313/508 | IMCA:IGOL | £ 598.80 | N |
      | 011119/509 | IMCA:IOTH | £ 600.00 | N |
      | 011119/510 | IMCA:IOTH | £ 500.00 | Y |
      | 011119/511 | IMCA:IRVL | £ 598.80 | N |
      | 011119/512 | IMCA:IRVL | £ 600.00 | N |
      | 310313/513 | IMCA:IGOL | £ 500.00 | Y |
      | 011119/514 | IMCA:IDOM | £ 698.80 | N |
      | 011119/515 | IMCA:IRVL | £ 700.00 | N |
      | 310313/516 | IMCA:IGOL | £ 600.00 | Y |
      | 310313/517 | IMCA:IGOL | £ 718.80 | N |
      | 011119/518 | IMCA:IRVL | £ 720.00 | N |
      | 011119/519 | IMCA:IDOM | £ 620.00 | Y |
