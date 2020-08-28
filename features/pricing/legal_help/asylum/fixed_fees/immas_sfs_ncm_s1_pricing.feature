@outcomes
Feature: Asylum Standard Fee Scheme Non Child Migrant Stage 1(LH) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immas_stage1_lh.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/544 | IALB:IFST | £ 413.00 | N |
      | 011119/545 | IALB:IFST | £ 413.00 | N |
      | 011119/546 | IALB:IRVL | £ 413.00 | N |
      | 011119/547 | IALB:IRVL | £ 413.00 | N |
      | 011119/548 | IALB:IOTH | £ 413.00 | N |
      | 011119/549 | IALB:IFRA | £ 413.00 | N |
      | 011119/550 | IALB:IIRC | £ 513.00 | N |
      | 310313/551 | IALB:IGOL | £ 513.00 | N |
      | 011119/552 | IALB:IFRA | £ 513.00 | N |
      | 011119/553 | IALB:IOTH | £ 533.00 | N |
      | 011119/554 | IALB:ILEA | £ 533.00 | N |
      | 011119/555 | IALB:ILEA | £ 533.00 | N |
      | 011119/556 | IALB:IFST | £ 495.60 | N |
      | 011119/557 | IALB:IASY | £ 495.60 | N |
      | 011119/558 | IALB:ILEA | £ 495.60 | N |
      | 011119/559 | IALB:ILEA | £ 495.60 | N |
      | 011119/560 | IALB:IFST | £ 495.60 | N |
      | 011119/561 | IALB:IFST | £ 495.60 | N |
      | 011119/562 | IALB:IASY | £ 595.60 | N |
      | 011119/563 | IALB:IRVL | £ 595.60 | N |
      | 011119/564 | IALB:IFST | £ 595.60 | N |
      | 011119/565 | IALB:IOTH | £ 615.60 | N |
      | 011119/566 | IALB:IOTH | £ 615.60 | N |
      | 011119/567 | IALB:IFST | £ 615.60 | N |
