Feature: Bulk load claims validations stage disbursement claims enabled for Legal help Immigration and Asylum codes prior, on or after 01/09/2024
IALA: Asylum - Stage 1 (LH) Including Attendance at a Home Office Interview
IALB: Asylum - Stage 1 (LH)
IALH: Asylum - Legal Help (LH)
IAXL: Asylum - LH Work Not Subject to the GFS  (LH)
IMLA: Immigration - Stage 1 (LH) Including Attendance at a Home Office Interview
IMLB: Immigration - Stage 1 (LH)
IMLH: Immigration Legal Help
IMXL: Immigration - LH Work Not Subject to the GFS (LH)

IALA and IMLA are very old codes and are not in scope rules table so ignoring these codes for the tests

 Scenario: Validate stage disbursement claims are enabled for certain Immigration and Asylum MT1 codes prior to 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IALB:IASY |
      | IAXL:IASY |
      | IMXL:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | DC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 3
    And problem outcomes should equal 0
    Then user confirms the submission

 Scenario: Validate stage disbursement claims are enabled for certain Immigration and Asylum MT1 codes after 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IALB:IASY |
      | IAXL:IASY |
      | IMXL:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | DC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 3
    And problem outcomes should equal 0
    Then user confirms the submission

Scenario: Validate stage disbursement claims are enabled for certain Immigration and Asylum MT1 codes prior or after 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IALH:IGOL |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310313/001 | DC         |        31/03/13 | PA00142          | AP00187      | TR001                        |
   Then user should see the outcome results page
    And invalid outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type           | Description                                                                                                       |
      | IALH:IGOL                   | 310313/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |

Scenario: Validate stage disbursement claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IMLB:ICZN |
      | IMLH:ILEA |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | DC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And invalid outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type           | Description                                                                                                       |
      | IMLB:ICZN                   | 310818/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |
      | IMLH:ILEA                   | 310818/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |