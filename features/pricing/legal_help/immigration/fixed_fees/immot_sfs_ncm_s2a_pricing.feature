@outcomes
Feature: Immigration Standard Fee Scheme Non Child Migrant Stage 2a(CLR) outcome pricing

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
    Scenario: Bulk load non-child migrant Immigration claims and have them priced correctly
      When a user successfully bulk loads "o_sfs_immot_stage2a_clr.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 310313/640 | IMCA:IGOL | £ 227.00 | N |
      | 011119/641 | IMCA:IIRC | £ 227.00 | N |
      | 011119/642 | IMCA:ICZN | £ 227.00 | N |
      | 011119/643 | IMCA:ICZN | £ 227.00 | N |
      | 011119/644 | IMCA:IOTH | £ 227.00 | N |
      | 011119/645 | IMCA:IIRC | £ 227.00 | N |
      | 011119/646 | IMCA:IRVL | £ 327.00 | N |
      | 011119/647 | IMCA:IDOM | £ 327.00 | N |
      | 011119/648 | IMCA:IIRC | £ 327.00 | N |
      | 310313/649 | IMCA:IGOL | £ 347.00 | N |
      | 011119/650 | IMCA:ICZN | £ 347.00 | N |
      | 011119/651 | IMCA:IOTH | £ 347.00 | N |
      | 310313/652 | IMCA:IGOL | £ 272.40 | N |
      | 011119/653 | IMCA:ICZN | £ 272.40 | N |
      | 011119/654 | IMCA:IDOM | £ 272.40 | N |
      | 011119/655 | IMCA:IOTH | £ 272.40 | N |
      | 011119/656 | IMCA:IDOM | £ 272.40 | N |
      | 011119/657 | IMCA:IRVL | £ 272.40 | N |
      | 011119/658 | IMCA:IIRC | £ 372.40 | N |
      | 011119/659 | IMCA:IIRC | £ 372.40 | N |
      | 310313/660 | IMCA:IGOL | £ 372.40 | N |
      | 011119/661 | IMCA:IRVL | £ 392.40 | N |
      | 011119/662 | IMCA:IIRC | £ 392.40 | N |
      | 011119/663 | IMCA:ICZN | £ 392.40 | N |
