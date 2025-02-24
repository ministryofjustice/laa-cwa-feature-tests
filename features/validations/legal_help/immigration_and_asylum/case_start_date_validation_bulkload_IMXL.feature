Feature: Validate case start date for IMXL

  Scenario Outline: IMXL outcomes are not valid with a CSD < 01-OCT-2007
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMXL:IRVL |
      | IMXL:IIRC |
      | IMXL:IJRA |
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
    And problem outcomes should equal 39
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  Scenario Outline: IMXL outcomes are not valid with a CSD < 01-OCT-2007
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IMXL:IOUT |
      | IMXL:IOTH |
      | IMXL:IBAI |
      | IMXL:IPST |
    And the following outcomes are bulkloaded:
      | #  | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY | STAGE_REACHED |
      |  1 | CM         |        30/09/07 | IA           | PA00177          | AP00186      | N           | IK            |
      |  2 | CM         |        30/09/07 | IB           | PA00177          | AP00186      | N           | IM            |
      |  3 | CM         |        30/09/07 | IC           | PA00177          | AP00186      | N           | IO            |
      |  4 | CM         |        30/09/07 | ID           | PA00177          | AP00186      | N           | IH            |
      |  5 | CM         |        30/09/07 | IE           | PA00177          | AP00186      | N           | IG            |
      |  6 | CM         |        30/09/07 | IF           | PA00177          | AP00186      | N           | IQ            |
      |  7 | CM         |        30/09/07 | IG           | PA00177          | AP00186      | N           | IG            |
      |  8 | CM         |        30/09/07 | IU           | PA00177          | AP00186      | N           | IO            |
      |  9 | CM         |        30/09/07 | IV           | PA00177          | AP00186      | N           | IG            |
      | 10 | CM         |        30/09/07 | IW           | PA00177          | AP00186      | N           | IH            |
      | 11 | CM         |        30/09/07 | IX           | PA00177          | AP00186      | N           | IG            |
      | 12 | CM         |        30/09/07 | IY           | PA00177          | AP00186      | N           | IM            |
      | 13 | CM         |        30/09/07 | IZ           | PA00177          | AP00186      | N           | IK            |
    Then user should see the outcome results page
    And problem outcomes should equal 52
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """