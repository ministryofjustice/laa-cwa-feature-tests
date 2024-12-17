Feature: Validate case start date for IMCB

  Scenario Outline: validate case start date for IMMIGRATION
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMCB:IEUL |
      | IMCB:IGOL |
      | IMCB:IRVL |
      | IMCB:IFME |
      | IMCB:ISTU |
      | IMCB:IFVI |
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
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMCB:IOTH |
      | IMCB:IOUT |
      | IMCB:IILL |
      | IMCB:ILEA |
      | IMCB:ITWE |
      | IMCC:IDOM |
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
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """
      
