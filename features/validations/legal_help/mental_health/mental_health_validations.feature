Feature: Mental Health Bulk load validations
  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.MHE#6"

  Scenario: Bulkoad Civil Mental Health outcomes with CLAIM_TYPE: Stage Disbursment Claim and WORK_CONCLUDED_DATE
    The 3 month Stage Billing rule is validated between Case Start Date and Claim Date (Work Concluded Date).
    Given the following Matter Types are chosen:
      | MHAS:MCOM |
      | MHAS:MCON |
      | MHAS:MGUA |
      | MHAS:MINF |
      | MHAS:MOTH |
      | MHAS:MPAT |
      | MHAS:MREL |
      | MHAS:MSCR |
      | MHAS:MSUP |
      | MHBW:MCON |
      | MHBW:MGUA |
      | MHBW:MINF |
      | MHBW:MOTH |
      | MHBW:MOUT |
      | MHBW:MREL |
      | MHBW:MSUP |
      | MHCM:MCOM |
      | MHCM:MCON |
      | MHCM:MGUA |
      | MHCM:MINF |
      | MHCM:MOTH |
      | MHCM:MOUT |
      | MHCM:MPAT |
      | MHCM:MREL |
      | MHCM:MSCR |
      | MHCM:MSUP |
      | MHDC:MCOM |
      | MHDC:MCON |
      | MHDC:MGUA |
      | MHDC:MINF |
      | MHDC:MOTH |
      | MHDC:MPAT |
      | MHDC:MREL |
      | MHDC:MSCR |
      | MHDC:MSUP |
      | MHDR:MCOM |
      | MHDR:MCON |
      | MHDR:MGUA |
      | MHDR:MINF |
      | MHDR:MOTH |
      | MHDR:MPAT |
      | MHDR:MREL |
      | MHDR:MSCR |
      | MHDR:MSUP |
      | MHHA:MCOM |
      | MHHA:MCON |
      | MHHA:MGUA |
      | MHHA:MINF |
      | MHHA:MOTH |
      | MHHA:MOUT |
      | MHHA:MPAT |
      | MHHA:MREL |
      | MHHA:MSCR |
      | MHHA:MSUP |
      | MHMC:MCOM |
      | MHMC:MCON |
      | MHMC:MGUA |
      | MHMC:MINF |
      | MHMC:MOTH |
      | MHMC:MOUT |
      | MHMC:MPAT |
      | MHMC:MREL |
      | MHMC:MSCR |
      | MHMC:MSUP |
      | MHNS:MCOM |
      | MHNS:MCON |
      | MHNS:MGUA |
      | MHNS:MOTH |
      | MHNS:MOUT |
      | MHNS:MREL |
      | MHNS:MSUP |
      | MHOR:MCOM |
      | MHOR:MCON |
      | MHOR:MGUA |
      | MHOR:MINF |
      | MHOR:MOTH |
      | MHOR:MOUT |
      | MHOR:MPAT |
      | MHOR:MREL |
      | MHOR:MSCR |
      | MHOR:MSUP |
      | MHTM:MCOM |
      | MHTM:MCON |
      | MHTM:MGUA |
      | MHTM:MINF |
      | MHTM:MOTH |
      | MHTM:MOUT |
      | MHTM:MPAT |
      | MHTM:MREL |
      | MHTM:MSCR |
      | MHTM:MSUP |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | DC         | 01/01/2020      | 01/04/2020          | --           |
      | 2 | DC         | 01/01/2020      | 31/03/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                          |
      | 1 | <none>                                                                                                                                         |
      | 2 | Stage disbursement claims can only be claimed where 3 months have elapsed from the date the matter was opened. Please refer to the guidelines. |