@outcomes
Feature: Asylum Standard Fee Scheme Non Child Migrant Stage 2b(CLR) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immas_stage2b_clr.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/592 | IACB:ILEA | £ 567.00 | N |
      | 011119/593 | IACB:ILEA | £ 567.00 | N |
      | 011119/594 | IACB:IIRC | £ 567.00 | N |
      | 011119/595 | IACB:IIRC | £ 567.00 | N |
      | 310313/596 | IACB:IGOL | £ 567.00 | N |
      | 310313/597 | IACB:IGOL | £ 567.00 | N |
      | 011119/598 | IACB:IOTH | £ 667.00 | N |
      | 310313/599 | IACB:IGOL | £ 667.00 | N |
      | 011119/600 | IACB:IASY | £ 667.00 | N |
      | 011119/601 | IACB:IASY | £ 687.00 | N |
      | 011119/602 | IACB:IRVL | £ 687.00 | N |
      | 011119/603 | IACB:IIRC | £ 687.00 | N |
      | 011119/604 | IACB:IFST | £ 680.40 | N |
      | 011119/605 | IACB:IASY | £ 680.40 | N |
      | 310313/606 | IACB:IGOL | £ 680.40 | N |
      | 011119/607 | IACB:ILEA | £ 680.40 | N |
      | 011119/608 | IACB:IRVL | £ 680.40 | N |
      | 011119/609 | IACB:IFST | £ 680.40 | N |
      | 011119/610 | IACB:IASY | £ 780.40 | N |
      | 011119/611 | IACB:IRVL | £ 780.40 | N |
      | 011119/612 | IACB:IFST | £ 780.40 | N |
      | 011119/613 | IACB:IASY | £ 800.40 | N |
      | 011119/614 | IACB:ILEA | £ 800.40 | N |
      | 011119/615 | IACB:IFRA | £ 800.40 | N |
