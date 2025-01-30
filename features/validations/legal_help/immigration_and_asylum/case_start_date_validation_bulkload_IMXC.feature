Feature: Validate case start date for IMXC

  Scenario Outline: validate case start date for IMMIGRATION
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMXC:IRHO |
      | IMXC:IIRC |
      | IMXC:IRVL |
      | IMXC:IRAR |
      | IMXC:IIRC |
    And the following outcomes are bulkloaded:
      | #  | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY | STAGE_REACHED |
      |  1 | CM         |        30/09/07 | IA           | PA00142          | AP00187      | N           | IK            |
      |  2 | CM         |        30/09/07 | IB           | PA00142          | AP00187      | N           | IM            |
      |  3 | CM         |        30/09/07 | IC           | PA00142          | AP00187      | N           | IO            |
      |  4 | CM         |        30/09/07 | ID           | PA00142          | AP00187      | N           | IH            |
      |  5 | CM         |        30/09/07 | IE           | PA00142          | AP00187      | N           | IG            |
      |  6 | CM         |        30/09/07 | IF           | PA00142          | AP00187      | N           | IQ            |
      |  7 | CM         |        30/09/07 | IG           | PA00142          | AP00187      | N           | IG            |
      |  8 | CM         |        30/09/07 | IU           | PA00142          | AP00187      | N           | IM            |
      |  9 | CM         |        30/09/07 | IV           | PA00142          | AP00187      | N           | IG            |
      | 10 | CM         |        30/09/07 | IW           | PA00142          | AP00187      | N           | IH            |
      | 11 | CM         |        30/09/07 | IX           | PA00142          | AP00187      | N           | IO            |
      | 12 | CM         |        30/09/07 | IY           | PA00142          | AP00187      | N           | IM            |
      | 13 | CM         |        30/09/07 | IZ           | PA00142          | AP00187      | N           | IK            |
    Then user should see the outcome results page
    And problem outcomes should equal 65
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMXC:IOTH |
      | IMXC:IOUT |
      | IMXC:IBAI |
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
    And problem outcomes should equal 39
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """
      
