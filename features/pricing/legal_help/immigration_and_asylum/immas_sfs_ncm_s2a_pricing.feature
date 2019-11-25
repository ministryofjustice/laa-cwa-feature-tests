@outcomes
Feature: Asylum Standard Fee Scheme Non Child Migrant Stage 2a(CLR) outcome pricing

    In order to price standard fee scheme cases correctly
    As a business stakeholder
    I want claims priced with the appropriate standard fee scheme

    Rules:

    There are 2 pricing schemes in place for Immigration/Asylum claims.
    One scheme prices claims using hourly rates(HR), the other via a Standard Fee Scheme (SFS).
    The MT1 code determines the pricing scheme in place
    (see the section on Immigration in
    https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/832905/Guidance_for_Reporting_Controlled_Work_September_2019.pdf)

    For information on pricing via the SFS please see Tables 4(a-d)
    in http://www.legislation.gov.uk/uksi/2013/422/schedule/1/made).

    Background:
      Given a test firm user is logged in CWA

    @slow
    Scenario: Bulk load non-child migrant Asylum claims and have them priced correctly
      When a user successfully bulk loads "o_sfs_immas_stage2a_clr.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/568 | IACA:IFRA | £ 227.00 | N |
      | 011119/569 | IACA:IASY | £ 227.00 | N |
      | 310313/570 | IACA:IGOL | £ 227.00 | N |
      | 011119/571 | IACA:IOTH | £ 227.00 | N |
      | 011119/572 | IACA:ILEA | £ 227.00 | N |
      | 011119/573 | IACA:IFRA | £ 227.00 | N |
      | 011119/574 | IACA:ILEA | £ 327.00 | N |
      | 011119/575 | IACA:IFST | £ 327.00 | N |
      | 310313/576 | IACA:IGOL | £ 327.00 | N |
      | 011119/577 | IACA:IASY | £ 347.00 | N |
      | 011119/578 | IACA:IOTH | £ 347.00 | N |
      | 011119/579 | IACA:IRVL | £ 347.00 | N |
      | 011119/580 | IACA:IFRA | £ 272.40 | N |
      | 011119/581 | IACA:IFRA | £ 272.40 | N |
      | 011119/582 | IACA:IFST | £ 272.40 | N |
      | 011119/583 | IACA:IRVL | £ 272.40 | N |
      | 011119/584 | IACA:ILEA | £ 272.40 | N |
      | 011119/585 | IACA:IFST | £ 272.40 | N |
      | 310313/586 | IACA:IGOL | £ 372.40 | N |
      | 310313/587 | IACA:IGOL | £ 372.40 | N |
      | 310313/588 | IACA:IGOL | £ 372.40 | N |
      | 011119/589 | IACA:IFST | £ 392.40 | N |
      | 011119/590 | IACA:IRVL | £ 392.40 | N |
      | 310313/591 | IACA:IGOL | £ 392.40 | N |
