Feature: bulk load claims validations for Access point and Procurement area

  Scenario: validate access point for HOUSING where case start date < 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#19"
    Given the following Matter Types are chosen:
      | HHOM:HPRI |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 141110/001 |        14/11/10 | HA            | PA00006          | AP00006      |
      | 2 |     002 | 141110/002 |        14/11/10 | HA            |                  |              |
      | 3 |     003 | 141110/003 |        14/11/10 | HA            | PA00142          |              |
      | 4 |     004 | 141110/004 |        14/11/10 | HA            | PA00136          | AP00137      |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                          |
      | HHOM:HPRI                   | 141110/001 | VALIDATION23 | The case start date of this matter is prior to 15-NOV-2010 . A Procurement Area cannot be recorded against this matter. Please amend the outcome details accordingly |
      | HHOM:HPRI                   | 141110/001 | VALIDATION26 | The case start date of this matter is prior to 15-NOV-2010 . An Access Point cannot be recorded against this matter. Please amend the outcome details accordingly    |
      | HHOM:HPRI                   | 141110/003 | VALIDATION4  | PA00142 is not a valid PROCUREMENT_AREA                                                                                                                              |
      | HHOM:HPRI                   | 141110/003 | VALIDATION23 | The case start date of this matter is prior to 15-NOV-2010 . A Procurement Area cannot be recorded against this matter. Please amend the outcome details accordingly |
      | HHOM:HPRI                   | 141110/004 | VALIDATION4  | AP00137 is not a valid ACCESS_POINT                                                                                                                                  |
      | HHOM:HPRI                   | 141110/004 | VALIDATION4  | PA00136 is not a valid PROCUREMENT_AREA                                                                                                                              |
      | HHOM:HPRI                   | 141110/004 | VALIDATION23 | The case start date of this matter is prior to 15-NOV-2010 . A Procurement Area cannot be recorded against this matter. Please amend the outcome details accordingly |
      | HHOM:HPRI                   | 141110/004 | VALIDATION26 | The case start date of this matter is prior to 15-NOV-2010 . An Access Point cannot be recorded against this matter. Please amend the outcome details accordingly    |

  Scenario: validate access point for HOUSING where case start date >= 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#19"
    Given the following Matter Types are chosen:
      | HHOM:HPRI |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 151110/001 |        15/11/10 | HA            | PA00006          | AP00006      |
      | 2 |     002 | 151110/002 |        15/11/10 | HA            |                  |              |
      | 3 |     003 | 151110/003 |        15/11/10 | HA            | PA00006          |              |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | HHOM:HPRI                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                    |
      | HHOM:HPRI                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | HHOM:HPRI                   | 151110/003 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | HHOM:HPRI                   | 151110/003 | Inactive PA/AP | The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded. This may be because the combination was end dated prior to this date or because the combination had not yet become active at this date. |
