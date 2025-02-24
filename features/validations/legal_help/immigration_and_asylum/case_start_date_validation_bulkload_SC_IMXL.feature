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
      |  1 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IK            |
      |  2 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IM            |
      |  3 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IO            |
      |  4 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IH            |
      |  5 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IG            |
      |  6 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IQ            |
      |  7 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IG            |
      |  8 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IM            |
      |  9 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IG            |
      | 10 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IH            |
      | 11 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IO            |
      | 12 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IM            |
      | 13 | SC         |        30/09/07 | --           | PA00142          | AP00187      | N           | IK            |
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
      |  1 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IK            |
      |  2 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IM            |
      |  3 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IO            |
      |  4 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IH            |
      |  5 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IG            |
      |  6 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IQ            |
      |  7 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IG            |
      |  8 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IO            |
      |  9 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IG            |
      | 10 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IH            |
      | 11 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IG            |
      | 12 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IM            |
      | 13 | SC         |        30/09/07 | --           | PA00177          | AP00186      | N           | IK            |
    Then user should see the outcome results page
    And problem outcomes should equal 52
    And there should be no duplicate outcomes
    And the following error message is expected for each:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """
