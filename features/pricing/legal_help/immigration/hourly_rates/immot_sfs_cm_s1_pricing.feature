@outcomes
Feature: Immigration Standard Fee Scheme Child Migrant Stage 1(LH) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immot_stage1_lh_cm.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/472 | IMLB:ICZN | £ 499.00 | N |
      | 011119/473 | IMLB:IOTH | £ 500.00 | N |
      | 310313/474 | IMLB:IGOL | £ 500.00 | Y |
      | 011119/475 | IMLB:IRVL | £ 499.00 | N |
      | 011119/476 | IMLB:ICZN | £ 500.00 | N |
      | 011119/477 | IMLB:IOTH | £ 500.00 | Y |
      | 011119/478 | IMLB:IDOM | £ 599.00 | N |
      | 310313/479 | IMLB:IGOL | £ 600.00 | N |
      | 011119/480 | IMLB:IEMP | £ 600.00 | Y |
      | 011119/481 | IMLB:IOTH | £ 619.00 | N |
      | 011119/482 | IMLB:IOTH | £ 620.00 | N |
      | 011119/483 | IMLB:IEMP | £ 620.00 | Y |
      | 011119/484 | IMLB:IIRC | £ 598.80 | N |
      | 011119/485 | IMLB:ICZN | £ 600.00 | N |
      | 011119/486 | IMLB:ICZN | £ 600.00 | Y |
      | 011119/487 | IMLB:IDOM | £ 598.80 | N |
      | 011119/488 | IMLB:ICZN | £ 600.00 | N |
      | 011119/489 | IMLB:IIRC | £ 600.00 | Y |
      | 011119/490 | IMLB:IEMP | £ 698.80 | N |
      | 011119/491 | IMLB:IOTH | £ 700.00 | N |
      | 011119/492 | IMLB:IEMP | £ 700.00 | Y |
      | 011119/493 | IMLB:ICZN | £ 718.80 | N |
      | 011119/494 | IMLB:ICZN | £ 720.00 | N |
      | 011119/495 | IMLB:IRVL | £ 720.00 | Y |
