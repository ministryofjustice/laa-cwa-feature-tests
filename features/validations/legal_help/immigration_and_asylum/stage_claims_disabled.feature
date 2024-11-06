Feature: Bulk load claims validations stage claims disabled for certain imiigration and Asylum codes after 01/09/2024

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IAAP:IOTH |
      | IACA:IOTH |
      | IACB:IOTH |
      | IACC:IOTH |
      | IACD:IOTH |
      | IACE:IOTH |
      | IACF:IOTH |
      | IAXC:IOTH |
      | IMAP:IOTH |
      | IMCA:IOTH |
      | IMCB:IOTH |
      | IMCC:IOTH |
      | IMCD:IOTH |
      | IMCE:IOTH |
      | IMCF:IOTH |
      | IMXC:IOTH |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | SC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 16
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                                                                                                                                                                                                                                            |
      | IAAP:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IAAP:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IACA:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACA:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IACB:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACC:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACD:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACE:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACE:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IACF:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACF:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IAXC:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMAP:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMAP:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IMCA:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCA:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IMCB:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCC:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCD:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCE:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCE:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IMCF:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCF:IOTH                   | 010918/001 | Person 001     | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IMXC:IOTH                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation2 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |

  Scenario: Validate stage claims are enabled for certain Immigration and Asylum MT1 codes prior to 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IAAP:IOTH |
      | IACA:IOTH |
      | IACB:IOTH |
      | IACC:IOTH |
      | IACD:IOTH |
      | IACE:IOTH |
      | IACF:IOTH |
      | IAXC:IOTH |
      | IMAP:IOTH |
      | IMCA:IOTH |
      | IMCB:IOTH |
      | IMCC:IOTH |
      | IMCD:IOTH |
      | IMCE:IOTH |
      | IMCF:IOTH |
      | IMXC:IOTH |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | SC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And successful outcomes should equal 8
    And problem outcomes should equal 8
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type      | Description                                                                               |
      | IAAP:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IACA:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IACE:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IACF:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMAP:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCA:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCE:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCF:IOTH                   | 310818/001 | Person 001     | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are enabled Immigration code combination IMXC:IBAI irrespective of start date 01/09/2018
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IMXC:IBAI |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     100 | 010918/100 | SC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
      | 1 |     101 | 310818/101 | SC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Tests for Stage claims to be accessible for following Matter Type codes for cases opened before 01/09/2018.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IACA:IASY |
      | IACA:ILEA |
      | IMCA:IDOM |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 310818/001 | SC         |        31/08/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 0
    Then user confirms the submission

  Scenario: Tests for Stage claims to be inaccessible for following Matter Type codes for cases opened on or after 01/09/2018.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IACA:IASY |
      | IACA:ILEA |
      | IMCA:IDOM |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | SC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                                                                                                                                                                                                                                            |
      | IACA:IASY                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACA:ILEA                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCA:IDOM                   | 010918/001 | Person 001     | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
