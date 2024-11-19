Feature: Validate case start date for IMCA

  Scenario Outline: validate case start date for IMMIGRATION
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMCA:ICZN |
      | IMCA:IEMP |
      | IMCA:IEUL |
      | IMCA:IFME |
      | IMCA:IFVI |
      | IMCA:IGOL |
      | IMCA:IILL |
    And the following outcomes are bulkloaded:
      | #  | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY | STAGE_REACHED |
      |  1 | CM         |        30/09/07 | IA           | PA00177          | AP00186      | N           | IG            |
      |  2 | CM         |        30/09/07 | IB           | PA00177          | AP00186      | N           | IG            |
      |  3 | CM         |        30/09/07 | IC           | PA00177          | AP00186      | N           | IG            |
      |  4 | CM         |        30/09/07 | ID           | PA00177          | AP00186      | N           | IG            |
      |  5 | CM         |        30/09/07 | IE           | PA00177          | AP00186      | N           | IG            |
      |  6 | CM         |        30/09/07 | IF           | PA00177          | AP00186      | N           | IG            |
      |  7 | CM         |        30/09/07 | IG           | PA00177          | AP00186      | N           | IG            |
      |  8 | CM         |        30/09/07 | IU           | PA00177          | AP00186      | N           | IG            |
      |  9 | CM         |        30/09/07 | IV           | PA00177          | AP00186      | N           | IG            |
      | 10 | CM         |        30/09/07 | IW           | PA00177          | AP00186      | N           | IG            |
      | 11 | CM         |        30/09/07 | IX           | PA00177          | AP00186      | N           | IG            |
      | 12 | CM         |        30/09/07 | IY           | PA00177          | AP00186      | N           | IG            |
      | 13 | CM         |        30/09/07 | IZ           | PA00177          | AP00186      | N           | IG            |
    Then user should see the outcome results page
    And problem outcomes should equal 91
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      | #  | ERROR_CODE_OR_MESSAGE      |
      |  1 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  2 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  3 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  4 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  5 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  6 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  7 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  8 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  9 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 10 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 11 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 12 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 13 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 14 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 15 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 16 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 17 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 18 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 19 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 20 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 21 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 22 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 23 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 24 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 25 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 26 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 27 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 28 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 29 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 30 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 31 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 32 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 33 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 34 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 35 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 36 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 37 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 38 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 39 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 40 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 41 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 42 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 43 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 44 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 45 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 46 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 47 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 48 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 49 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 50 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 51 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 52 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 53 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 54 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 55 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 56 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 57 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 58 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 59 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 60 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 61 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 62 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 63 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 64 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 65 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 66 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 67 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 68 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 69 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 70 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 71 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 72 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 73 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 74 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 75 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 76 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 77 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 78 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 79 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 80 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 81 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 82 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 83 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 84 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 85 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 86 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 87 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 88 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 89 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 90 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 91 | XXLSC_AM_PRE_LAR2_COMB_MSG |

  Scenario Outline: validate case start date for IMMIGRATION
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMCA:IIRC |
      | IMCA:IOTH |
      | IMCA:IOUT |
      | IMCA:IRVL |
      | IMCA:ISTU |
      | IMCA:ITWE |
    And the following outcomes are bulkloaded:
      | #  | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY | STAGE_REACHED |
      |  1 | CM         |        30/09/07 | IA           | PA00177          | AP00186      | N           | IG            |
      |  2 | CM         |        30/09/07 | IB           | PA00177          | AP00186      | N           | IG            |
      |  3 | CM         |        30/09/07 | IC           | PA00177          | AP00186      | N           | IG            |
      |  4 | CM         |        30/09/07 | ID           | PA00177          | AP00186      | N           | IG            |
      |  5 | CM         |        30/09/07 | IE           | PA00177          | AP00186      | N           | IG            |
      |  6 | CM         |        30/09/07 | IF           | PA00177          | AP00186      | N           | IG            |
      |  7 | CM         |        30/09/07 | IG           | PA00177          | AP00186      | N           | IG            |
      |  8 | CM         |        30/09/07 | IU           | PA00177          | AP00186      | N           | IG            |
      |  9 | CM         |        30/09/07 | IV           | PA00177          | AP00186      | N           | IG            |
      | 10 | CM         |        30/09/07 | IW           | PA00177          | AP00186      | N           | IG            |
      | 11 | CM         |        30/09/07 | IX           | PA00177          | AP00186      | N           | IG            |
      | 12 | CM         |        30/09/07 | IY           | PA00177          | AP00186      | N           | IG            |
      | 13 | CM         |        30/09/07 | IZ           | PA00177          | AP00186      | N           | IG            |
    Then user should see the outcome results page
    And problem outcomes should equal 78
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      | #  | ERROR_CODE_OR_MESSAGE      |
      |  1 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  2 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  3 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  4 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  5 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  6 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  7 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  8 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      |  9 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 10 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 11 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 12 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 13 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 14 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 15 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 16 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 17 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 18 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 19 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 20 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 21 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 22 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 23 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 24 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 25 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 26 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 27 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 28 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 29 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 30 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 31 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 32 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 33 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 34 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 35 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 36 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 37 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 38 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 39 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 40 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 41 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 42 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 43 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 44 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 45 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 46 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 47 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 48 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 49 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 50 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 51 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 52 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 53 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 54 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 55 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 56 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 57 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 58 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 59 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 60 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 61 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 62 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 63 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 64 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 65 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 66 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 67 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 68 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 69 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 70 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 71 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 72 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 73 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 74 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 75 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 76 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 77 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 78 | XXLSC_AM_PRE_LAR2_COMB_MSG |     