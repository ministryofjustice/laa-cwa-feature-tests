@outcomes
Feature: Immigration Standard Fee Scheme Non Child Migrant Stage 1(LH) outcome pricing

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
      When a user successfully bulk loads "o_sfs_immot_stage1_lh.xml" for the test firm
      And user is on the "LEGAL HELP" pricing outcome details page
      Then user should see the following outcomes:
			| UFN        | Matter Type | Value | Escape Fee |
      | 011119/400 | IMLB:ICZN | £ 234.00 | N |
      | 011119/401 | IMLB:IIRC | £ 234.00 | N |
      | 011119/402 | IMLB:IOTH | £ 234.00 | N |
      | 011119/403 | IMLB:ICZN | £ 234.00 | N |
      | 011119/404 | IMLB:IEMP | £ 234.00 | N |
      | 011119/405 | IMLB:IOTH | £ 234.00 | N |
      | 310313/406 | IMLB:IGOL | £ 334.00 | N |
      | 011119/407 | IMLB:IOTH | £ 334.00 | N |
      | 011119/408 | IMLB:IRVL | £ 334.00 | N |
      | 310313/409 | IMLB:IGOL | £ 354.00 | N |
      | 310313/410 | IMLB:IGOL | £ 354.00 | N |
      | 011119/411 | IMLB:IOTH | £ 354.00 | N |
      | 011119/412 | IMLB:IRVL | £ 280.80 | N |
      | 011119/413 | IMLB:IRVL | £ 280.80 | N |
      | 011119/414 | IMLB:IDOM | £ 280.80 | N |
      | 011119/415 | IMLB:IRVL | £ 280.80 | N |
      | 310313/416 | IMLB:IGOL | £ 280.80 | N |
      | 011119/417 | IMLB:IRVL | £ 280.80 | N |
      | 011119/418 | IMLB:IRVL | £ 380.80 | N |
      | 310313/419 | IMLB:IGOL | £ 380.80 | N |
      | 310313/420 | IMLB:IGOL | £ 380.80 | N |
      | 011119/421 | IMLB:ICZN | £ 400.80 | N |
      | 310313/422 | IMLB:IGOL | £ 400.80 | N |
      | 011119/423 | IMLB:IEMP | £ 400.80 | N |
