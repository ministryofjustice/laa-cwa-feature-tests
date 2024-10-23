Feature: Validate Procurement Area field

  Scenario: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | #  | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      |  1 |     001 | 141110/001 | CM         |        14/11/10 | IE            | PA00142          | AP00187      | N           |
      |  2 |     002 | 141110/002 | CM         |        14/11/10 | IE            | PA00143          | AP00187      | N           |
      |  3 |     003 | 141110/003 | CM         |        14/11/10 | IE            | PA00144          | AP00187      | N           |
      |  4 |     004 | 141110/004 | CM         |        14/11/10 | IE            | PA00145          | AP00187      | N           |
      |  5 |     005 | 141110/005 | CM         |        14/11/10 | IE            | PA00146          | AP00187      | N           |
      |  6 |     006 | 141110/006 | CM         |        14/11/10 | IE            | PA00147          | AP00187      | N           |
      |  7 |     007 | 141110/007 | CM         |        14/11/10 | IE            | PA00148          | AP00187      | N           |
      |  8 |     008 | 141110/008 | CM         |        14/11/10 | IE            | PA00149          | AP00187      | N           |
      |  9 |     009 | 141110/009 | CM         |        14/11/10 | IE            | PA00150          | AP00187      | N           |
      | 10 |     010 | 141110/010 | CM         |        14/11/10 | IE            | PA00177          | AP00187      | N           |
    Then the outcome saves successfully

  Scenario: validate procurement area for IMMIGRATION with case start date < 15/11/2010 with specific PA/AP codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#18"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | #  | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      |  1 |     001 | 141110/001 | CM         |        14/11/10 | IE            | PA00142          | AP00187      | N           |
      |  2 |     002 | 141110/002 | CM         |        14/11/10 | IE            | PA00143          | AP00187      | N           |
      |  3 |     003 | 141110/003 | CM         |        14/11/10 | IE            | PA00144          | AP00187      | N           |
      |  4 |     004 | 141110/004 | CM         |        14/11/10 | IE            | PA00145          | AP00187      | N           |
      |  5 |     005 | 141110/005 | CM         |        14/11/10 | IE            | PA00146          | AP00187      | N           |
      |  6 |     006 | 141110/006 | CM         |        14/11/10 | IE            | PA00147          | AP00187      | N           |
      |  7 |     007 | 141110/007 | CM         |        14/11/10 | IE            | PA00148          | AP00187      | N           |
      |  8 |     008 | 141110/008 | CM         |        14/11/10 | IE            | PA00149          | AP00187      | N           |
      |  9 |     009 | 141110/009 | CM         |        14/11/10 | IE            | PA00150          | AP00187      | N           |
      | 10 |     010 | 141110/010 | CM         |        14/11/10 | IE            | PA00177          | AP00187      | N           |
    Then the outcome saves successfully

  Scenario: validate procurement area for ASYLUM where case start date >= 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      | 1 |     001 | 151110/001 | CM         |        15/11/10 | IE            | PA00500          | AP00000      | N           |
      | 2 |     002 | 151110/002 | CM         |        15/11/10 | IE            |                  |              | N           |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | IALB:IOUT                   | 151110/001 | Invalid-civil2018_irctp_ validation7 | Completion of the IRC Surgery fields are required only when a relevant PA and AP code has been selected: PA00142 (Brook House IRC), PA00143 (Campsfield IRC), PA00144 (Colnbrook IRC), PA00145 (Dover IRC), PA00146 (Haslar IRC), PA00147 (Harmondsworth IRC), PA00148 (Tinsley House IRC), PA00149 (Lindholme IRC), PA00150 (Yarl's Wood IRC), PA00177 (Morton Hall IRC), PA00178 (Cedars IRC) and PA00188 (Derwentside IRC) and AP codes AP00186 (fast track) and AP00187 (non-fast track). |
      | IALB:IOUT                   | 151110/002 | VALIDATION21                         | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                                                                                                                                                                                                                                  |
      | IALB:IOUT                   | 151110/002 | VALIDATION21                         | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                                                                                                                                                                                                                                      |
      | IALB:IOUT                   | 151110/002 | Invalid-civil2018_irctp_ validation7 | Completion of the IRC Surgery fields are required only when a relevant PA and AP code has been selected: PA00142 (Brook House IRC), PA00143 (Campsfield IRC), PA00144 (Colnbrook IRC), PA00145 (Dover IRC), PA00146 (Haslar IRC), PA00147 (Harmondsworth IRC), PA00148 (Tinsley House IRC), PA00149 (Lindholme IRC), PA00150 (Yarl's Wood IRC), PA00177 (Morton Hall IRC), PA00178 (Cedars IRC) and PA00188 (Derwentside IRC) and AP codes AP00186 (fast track) and AP00187 (non-fast track). |

  Scenario: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#18"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      | 1 |     001 | 151110/001 | CM         |        15/11/10 | IE            | PA00500          | AP00000      | N           |
      | 2 |     002 | 151110/002 | CM         |        15/11/10 | IE            |                  |              | N           |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type                           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | IMLB:IOUT                   | 151110/001 | Invalid-civil2018_irctp_ validation7 | Completion of the IRC Surgery fields are required only when a relevant PA and AP code has been selected: PA00142 (Brook House IRC), PA00143 (Campsfield IRC), PA00144 (Colnbrook IRC), PA00145 (Dover IRC), PA00146 (Haslar IRC), PA00147 (Harmondsworth IRC), PA00148 (Tinsley House IRC), PA00149 (Lindholme IRC), PA00150 (Yarl's Wood IRC), PA00177 (Morton Hall IRC), PA00178 (Cedars IRC) and PA00188 (Derwentside IRC) and AP codes AP00186 (fast track) and AP00187 (non-fast track). |
      | IMLB:IOUT                   | 151110/002 | VALIDATION21                         | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                                                                                                                                                                                                                                  |
      | IMLB:IOUT                   | 151110/002 | VALIDATION21                         | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                                                                                                                                                                                                                                      |
      | IMLB:IOUT                   | 151110/002 | Invalid-civil2018_irctp_ validation7 | Completion of the IRC Surgery fields are required only when a relevant PA and AP code has been selected: PA00142 (Brook House IRC), PA00143 (Campsfield IRC), PA00144 (Colnbrook IRC), PA00145 (Dover IRC), PA00146 (Haslar IRC), PA00147 (Harmondsworth IRC), PA00148 (Tinsley House IRC), PA00149 (Lindholme IRC), PA00150 (Yarl's Wood IRC), PA00177 (Morton Hall IRC), PA00178 (Cedars IRC) and PA00188 (Derwentside IRC) and AP codes AP00186 (fast track) and AP00187 (non-fast track). |

  Scenario: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      | 1 |     001 | 141110/001 | CM         |        14/11/10 | IE            |                  |              |             |
      | 2 |     002 | 141110/002 | CM         |        14/11/10 | IE            | PA00188          | AP00187      | N           |
      | 3 |     003 | 141110/003 | CM         |        14/11/10 | IE            | PA00178          | AP00187      | N           |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | IALB:IOUT                   | 141110/002 | VALIDATION22   | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IALB:IOUT                   | 141110/003 | VALIDATION22   | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate procurement area for IMMIGRATION with case start date < 15/11/2010 with specific PA/AP codes
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#18"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      | 1 |     001 | 141110/001 | CM         |        14/11/10 | IE            |                  |              |             |
      | 2 |     002 | 141110/002 | CM         |        14/11/10 | IE            | PA00188          | AP00187      | N           |
      | 3 |     003 | 141110/003 | CM         |        14/11/10 | IE            | PA00178          | AP00187      | N           |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | IMLB:IOUT                   | 141110/002 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IMLB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
