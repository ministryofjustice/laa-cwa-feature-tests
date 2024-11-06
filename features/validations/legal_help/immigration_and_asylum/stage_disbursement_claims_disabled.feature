Feature: Bulk load claims validations stage disbursement claims disabled for certain imiigration and Asylum codes after 01/09/2024

  Scenario: Validate stage disbursement claims are enabled for certain Immigration and Asylum MT1 codes prior after 01/09/2018 using 01/04/23 as strat date because the start date active of these codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IACE:IOTH |
      | IACF:IOTH |
      | IMCE:IOTH |
      | IMCF:IOTH |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010423/001 | DC         |        01/04/23 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 4
    And problem outcomes should equal 0

  Scenario: Validate stage disbursement claims are enabled for certain Immigration and Asylum MT1 codes irrespective of disabled date 01/09/2018 for certain codes, some do not have claim type DC
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IAAP:IOTH |
      | IACA:IOTH |
      | IACB:IOTH |
      | IACC:IOTH |
      | IACD:IOTH |
      | IAXC:IOTH |
      | IMAP:IOTH |
      | IMCA:IOTH |
      | IMCB:IOTH |
      | IMCC:IOTH |
      | IMCD:IOTH |
      | IMXC:IOTH |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | DC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 8
    And invalid outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type           | Description                                                                                                       |
      | IAAP:IOTH                   | 010918/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |
      | IACA:IOTH                   | 010918/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |
      | IMAP:IOTH                   | 010918/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |
      | IMCA:IOTH                   | 010918/001 | Person 001     | MANDATORY VALIDATION | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |

  Scenario: Tests for Stage Disbursement claims not to be accessible for following Matter Type codes for cases opened on or after 01/09/2018.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IACA:IASY |
      | IACA:ILEA |
      | IMCA:IDOM |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | DC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                                                                                                                                                                                                                                            |
      | IACA:IASY                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation3 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACA:ILEA                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation3 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCA:IDOM                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation3 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |

  Scenario: Tests for Stage Disbursement claims to be accessible for following Matter Type codes for cases opened before 01/09/2018.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IACA:IASY |
      | IACA:ILEA |
      | IMCA:IDOM |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | DC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Validate stage disbursement claims are enabled for certain Immigration and Asylum MT1 codes after 01/09/2018 , some codes error for other validation rules
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#23"
    Given the following Matter Types are chosen:
      | IACB:IOTH |
      | IACC:IOTH |
      | IACD:IOTH |
      | IACE:IOTH |
      | IACF:IOTH |
      | IAXC:IOTH |
      | IMCB:IOTH |
      | IMCC:IOTH |
      | IMCD:IOTH |
      | IMCE:IOTH |
      | IMCF:IOTH |
      | IMXC:IOTH |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310323/001 | DC         |        31/03/23 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type      | Description                                                                               |
      | IACE:IOTH                   | 310323/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IACF:IOTH                   | 310323/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCE:IOTH                   | 310323/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCF:IOTH                   | 310323/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
