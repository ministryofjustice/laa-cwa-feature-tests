Feature: Bulk load claims validations stage claims disabled for certain imiigration and Asylum codes after 01/09/2024

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IAAP:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010912/001 | SC         |        01/09/12 |            31/03/13 | IR            | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                | Description                                                                               |
      | IAAP:IOUT                   | 010912/001 | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IACA:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010413/001 | SC         |        01/04/13 |            31/03/23 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type      | Description                                                                               |
      | IACA:IOUT                   | 010413/001 | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IACB:IOUT |
      | IAXC:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010918/001 | SC         |        01/09/18 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                        | Description                                                                                                                                                                                                                                                                                                                                            |
      | IACB:IOUT                   | 010918/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IAXC:IOUT                   | 010918/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IACC:IOUT |
      | IACD:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010413/001 | SC         |        01/04/13 |            31/03/23 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type      | Description                                                                               |
      | IACC:IOUT                   | 010413/001 | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IACD:IOUT                   | 010413/001 | ECF Ref-Scope 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IACE:IOUT |
      | IACF:IOUT |
      | IMCE:IOUT |
      | IMCF:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010423/001 | SC         |        01/04/23 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                        | Description                                                                                                                                                                                                                                                                                                                                            |
      | IACE:IOUT                   | 010423/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IACF:IOUT                   | 010423/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCE:IOUT                   | 010423/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
      | IMCF:IOUT                   | 010423/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IMAP:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010912/001 | SC         |        01/09/12 |            31/03/13 | IR            | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                | Description                                                                               |
      | IMAP:IOUT                   | 010912/001 | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IMCA:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010912/001 | SC         |        01/09/12 |            31/03/23 | IR            | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                | Description                                                                               |
      | IMCA:IOUT                   | 010912/001 | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IMCB:IOUT |
      | IMCC:IOUT |
      | IMCD:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010912/001 | SC         |        01/09/12 |            31/03/23 | IR            | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                | Description                                                                               |
      | IMCA:IOUT                   | 010912/001 | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCB:IOUT                   | 010912/001 | ECF Ref-Scope 2           | The reporting code combination that has been used is not valid. Please amend accordingly. |
      | IMCD:IOUT                   | 010912/001 | ECF Ref-Scope 2           | The reporting code combination that has been used is not valid. Please amend accordingly. |

  Scenario: Validate stage claims are disabled for certain Immigration and Asylum MT1 codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#22"
    Given the following Matter Types are chosen:
      | IMCE:IOUT |
      | IMCF:IOUT |
      | IMXC:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010423/001 | SC         |        01/04/23 | PA00142          | AP00187      | TR001                        |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                        | Description                                                                                                                                                                                                                                                                                                                                            |
      | IMCE:IOUT                   | 010423/001 | Invalid SR-OC Combination         | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IMCF:IOUT                   | 010423/001 | ECF Ref-Scope 2                   | The reporting code combination that has been used is not valid. Please amend accordingly.                                                                                                                                                                                                                                                              |
      | IMXC:IOUT                   | 010423/001 | Invalid-civil2018_UTW Validation1 | Stage claims are no longer possible where an appeal is proceeding to the Upper Tribunal for cases opened on/after 1st September 2018. Such work is now dealt with under Licensed Work and therefore a completed claim should be made for any Controlled Work undertaken to date. Please check the claim type, matter type and outcome codes used here. |
