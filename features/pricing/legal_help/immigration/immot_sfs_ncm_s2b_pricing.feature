@outcomes
Feature: Immigration Standard Fee Scheme Non Child Migrant Stage 2b(CLR) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immot_stage2b_clr.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 310313/664 | IMCB:IGOL | £ 454.00 | N |
      | 011119/665 | IMCB:IRVL | £ 454.00 | N |
      | 011119/666 | IMCB:IDOM | £ 454.00 | N |
      | 011119/667 | IMCB:IIRC | £ 454.00 | N |
      | 011119/668 | IMCB:IOTH | £ 454.00 | N |
      | 011119/669 | IMCB:IILL | £ 454.00 | N |
      | 011119/670 | IMCB:IOTH | £ 554.00 | N |
      | 011119/671 | IMCB:IILL | £ 554.00 | N |
      | 011119/672 | IMCB:IRVL | £ 554.00 | N |
      | 011119/673 | IMCB:IIRC | £ 574.00 | N |
      | 310313/674 | IMCB:IGOL | £ 574.00 | N |
      | 011119/675 | IMCB:IDOM | £ 574.00 | N |
      | 011119/676 | IMCB:IDOM | £ 544.80 | N |
      | 310313/677 | IMCB:IGOL | £ 544.80 | N |
      | 011119/678 | IMCB:IILL | £ 544.80 | N |
      | 310313/679 | IMCB:IGOL | £ 544.80 | N |
      | 011119/680 | IMCB:IILL | £ 544.80 | N |
      | 011119/681 | IMCB:IIRC | £ 544.80 | N |
      | 011119/682 | IMCB:IILL | £ 644.80 | N |
      | 310313/683 | IMCB:IGOL | £ 644.80 | N |
      | 011119/684 | IMCB:IIRC | £ 644.80 | N |
      | 310313/685 | IMCB:IGOL | £ 664.80 | N |
      | 011119/686 | IMCB:IILL | £ 664.80 | N |
      | 310313/687 | IMCB:IGOL | £ 664.80 | N |
