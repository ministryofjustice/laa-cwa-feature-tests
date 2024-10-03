@bulkload
Feature: Stage billing validations for Mental health

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.MHE#6"

  Scenario: Add new stage Disbursement claim when there are no existing claims
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
    When the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | CASE_STAGE_LEVEL | OUTCOME_CODE |
      | 1 | DC         |      01/01/2020 |          01/04/2020 | MHL10            | --           |
    Then there should be no problem outcomes
    Then user confirms the submission