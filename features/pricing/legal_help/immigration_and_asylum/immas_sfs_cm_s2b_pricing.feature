@outcomes
Feature: Asylum Standard Fee Scheme Child Migrant Stage 2b(CLR) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immas_stage2b_clr_cm.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 310313/448 | IACB:IGOL | £ 499.00 | N |
      | 011119/449 | IACB:IASY | £ 500.00 | N |
      | 011119/450 | IACB:IFST | £ 500.00 | Y |
      | 011119/451 | IACB:ILEA | £ 499.00 | N |
      | 011119/452 | IACB:IASY | £ 500.00 | N |
      | 011119/453 | IACB:ILEA | £ 500.00 | Y |
      | 011119/454 | IACB:IFRA | £ 599.00 | N |
      | 011119/455 | IACB:ILEA | £ 600.00 | N |
      | 011119/456 | IACB:IIRC | £ 600.00 | Y |
      | 011119/457 | IACB:IIRC | £ 619.00 | N |
      | 011119/458 | IACB:ILEA | £ 620.00 | N |
      | 011119/459 | IACB:IOTH | £ 620.00 | Y |
      | 011119/460 | IACB:IASY | £ 598.80 | N |
      | 011119/461 | IACB:IFST | £ 600.00 | N |
      | 011119/462 | IACB:IIRC | £ 600.00 | Y |
      | 011119/463 | IACB:IIRC | £ 598.80 | N |
      | 011119/464 | IACB:IIRC | £ 600.00 | N |
      | 011119/465 | IACB:ILEA | £ 600.00 | Y |
      | 011119/466 | IACB:IASY | £ 698.80 | N |
      | 011119/467 | IACB:IRVL | £ 700.00 | N |
      | 011119/468 | IACB:IASY | £ 700.00 | Y |
      | 011119/469 | IACB:IFST | £ 718.80 | N |
      | 011119/470 | IACB:ILEA | £ 720.00 | N |
      | 011119/471 | IACB:ILEA | £ 720.00 | Y |
