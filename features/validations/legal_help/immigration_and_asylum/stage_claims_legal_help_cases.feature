Feature: Bulk load claims validations stage claims enabled for Legal help Immigration and Asylum codes prior, on or after 01/09/2024
IALA: Asylum - Stage 1 (LH) Including Attendance at a Home Office Interview
IALB: Asylum - Stage 1 (LH)
IALH: Asylum - Legal Help (LH)
IAXL: Asylum - LH Work Not Subject to the GFS  (LH)
IMLA: Immigration - Stage 1 (LH) Including Attendance at a Home Office Interview
IMLB: Immigration - Stage 1 (LH)
IMLH: Immigration Legal Help
IMXL: Immigration - LH Work Not Subject to the GFS (LH)

IALA and IMLA are very old codes and are not in scope rules table so ignoring these codes for the tests

  Scenario: Validate stage claims are enabled for certain Immigration and Asylum MT1 codes prior to 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IALB:IASY |
      | IAXL:IASY |
      | IMLB:ICZN |
      | IMXL:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | SC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 4
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Validate stage claims are enabled for certain Immigration and Asylum MT1 codes prior to 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IMLH:ILEA |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | SC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type      | Description                                                                               |
      | IMLH:ILEA                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are enabled for certain Immigration and Asylum MT1 codes after 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IALB:IASY |
      | IAXL:IASY |
      | IMLB:ICZN |
      | IMXL:IOUT |
      | IMLH:ILEA |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | SC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 5
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Validate stage claims are enabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IALH:IGOL |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED | STAGE_REACHED |
      | 1 |     001 | 310313/001 | SC         |        31/03/13 | PA00142          | AP00187      | TR001                        | IM            |
    Then user should see the outcome results page
    And successful outcomes should equal 1
    And problem outcomes should equal 0
    Then user confirms the submission
