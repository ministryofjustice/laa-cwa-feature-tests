Feature: bulk load claims validations for delinking issues for IALB,IMLB

  Scenario: validate access point for ASYLUM where case start date >= 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | PROCUREMENT_AREA | ACCESS_POINT |EXEMPTION_CRITERIA_SATISFIED|PROFIT_COST|
      | 1 |     001 | 151124/001 | SC         |        15/03/23 | IE            | PA00139          | AP00166      |TR001|1239|
    # | 2 |     001 | 151124/001 | CM         |        15/11/24 | IC            | PA00139          | AP00166      |TR001|0|
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes:
      | # | UFN        | Value    | Comment                                     |
      | 1 | 010413/001 | £ 413.00 | Standard fee for MT1 IMCA £227 is the total |
    Then the outcomes are flagged as escape fee cases
      | Comment                                                                                                                |
      | escape threhold 3 * standard fee (£227) = £681, Profit_Cost(£228) + Counsel_Cost(£453) - Additioanal_payments(0)= £681 |

  @delete_outcome_after @manual_submission @valid @irc
  Scenario:
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | outcome_code|exemption_criteria_satisfied|profit_cost|
      |     001 | IMLB:IOUT   |        15/03/23 | PA00139          | AP00166      | IE|TR001|100|
      |     001 | IACB:IOUT   |        15/03/23 | PA00139          | AP00166      |IC|TR001|100|
    Then the outcome saves successfully


  Scenario: validate access point for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#18"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 151110/001 | CM         |        15/11/10 | IE            | PA00136          | AP00137      |
      | 2 |     002 | 151110/002 | CM         |        15/11/10 | IE            |                  |              |
      | 3 |     003 | 151110/003 | CM         |        15/11/10 | IE            | PA00142          |              |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | IMLB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                    |
      | IMLB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IMLB:IOUT                   | 151110/003 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IMLB:IOUT                   | 151110/003 | Inactive PA/AP | The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded. This may be because the combination was end dated prior to this date or because the combination had not yet become active at this date. |

  Scenario: validate access point for ASYLUM where case start date < 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      | 1 |     001 | 141110/001 | CM         |        14/11/10 | IE            | PA00142          | AP00187      | N           |
      | 2 |     002 | 141110/002 | CM         |        14/11/10 | IE            |                  |              |             |
      | 3 |     003 | 141110/003 | CM         |        14/11/10 | IE            | PA00142          |              |             |
      | 4 |     004 | 141110/004 | CM         |        14/11/10 | IE            | PA00136          | AP00137      |             |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                                                                                                                                                                                                        |
      | IALB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IALB:IOUT                   | 141110/004 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate access point for IMMIGRATION where case start date < 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#18"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | IRC_SURGERY |
      | 1 |     001 | 141110/001 | CM         |        14/11/10 | IE            | PA00142          | AP00187      | N           |
      | 2 |     002 | 141110/002 | CM         |        14/11/10 | IE            |                  |              |             |
      | 3 |     003 | 141110/003 | CM         |        14/11/10 | IE            | PA00142          |              |             |
      | 4 |     004 | 141110/004 | CM         |        14/11/10 | IE            | PA00136          | AP00137      |             |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                                                                                                                                                                                                        |
      | IMLB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IMLB:IOUT                   | 141110/004 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate access point for ASYLUM where case start date >= 15/11/2010 with PA/AP code
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#18"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 151110/001 | CM         |        15/11/10 | IE            | PA00136          | AP00137      |
      | 2 |     002 | 151110/002 | CM         |        15/11/10 | IE            |                  |              |
      | 3 |     003 | 151110/003 | CM         |        15/11/10 | IE            | PA00142          |              |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | IALB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                    |
      | IALB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IALB:IOUT                   | 151110/003 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IALB:IOUT                   | 151110/003 | Inactive PA/AP | The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded. This may be because the combination was end dated prior to this date or because the combination had not yet become active at this date. |

  Scenario: validate access point for ASYLUM where case start date >= 15/11/2010 with PA/AP code for stage claims
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#20"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 151110/001 | SC         |        15/11/10 | IR            | PA00136          | AP00137      |
      | 2 |     002 | 151110/002 | SC         |        15/11/10 | IR            |                  |              |
      | 3 |     003 | 151110/003 | SC         |        15/11/10 | IR            | PA00142          |              |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | IALB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                    |
      | IALB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IALB:IOUT                   | 151110/003 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IALB:IOUT                   | 151110/003 | Inactive PA/AP | The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded. This may be because the combination was end dated prior to this date or because the combination had not yet become active at this date. |

  Scenario: validate access point for IMMIGRATION where case start date < 15/11/2010 with PA/AP code for stage claims
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#20"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 141110/001 | SC         |        14/11/10 | IR            | PA00142          | AP00187      |
      | 2 |     002 | 141110/002 | SC         |        14/11/10 | IR            |                  |              |
      | 3 |     003 | 141110/003 | SC         |        14/11/10 | IR            | PA00142          |              |
      | 4 |     004 | 141110/004 | SC         |        14/11/10 | IR            | PA00136          | AP00137      |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                                                                                                                                                                                                        |
      | IMLB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IMLB:IOUT                   | 141110/004 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate access point for ASYLUM where case start date < 15/11/2010 with PA/AP code for stage claims
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#20"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 141110/001 | SC         |        14/11/10 | IR            | PA00142          | AP00187      |
      | 2 |     002 | 141110/002 | SC         |        14/11/10 | IR            |                  |              |
      | 3 |     003 | 141110/003 | SC         |        14/11/10 | IR            | PA00142          |              |
      | 4 |     004 | 141110/004 | SC         |        14/11/10 | IR            | PA00136          | AP00137      |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                                                                                                                                                                                                        |
      | IALB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IALB:IOUT                   | 141110/004 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate access point for IMMIGRATION where case start date < 15/11/2010 with PA/AP code for stage disbursement claims
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#21"
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 141110/001 | DC         |        14/11/10 | IR            | PA00142          | AP00187      |
      | 2 |     002 | 141110/002 | DC         |        14/11/10 | IR            |                  |              |
      | 3 |     003 | 141110/003 | DC         |        14/11/10 | IR            | PA00142          |              |
      | 4 |     004 | 141110/004 | DC         |        14/11/10 | IR            |                  | AP00187      |
      | 5 |     005 | 141110/005 | DC         |        14/11/10 | IR            | PA00136          | AP00137      |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                                                                                                                                                                                                        |
      | IMLB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IMLB:IOUT                   | 141110/004 | VALIDATION4  | AP00187 is not a valid ACCESS_POINT                                                                                                                                                                                                                                                                                                                |
      | IMLB:IOUT                   | 141110/004 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IMLB:IOUT                   | 141110/005 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate access point for ASYLUM where case start date < 15/11/2010 with PA/AP code for stage disbursement claims
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#21"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 141110/001 | DC         |        14/11/10 | IR            | PA00142          | AP00187      |
      | 2 |     002 | 141110/002 | DC         |        14/11/10 | IR            |                  |              |
      | 3 |     003 | 141110/003 | DC         |        14/11/10 | IR            | PA00142          |              |
      | 4 |     004 | 141110/004 | DC         |        14/11/10 | IR            |                  | AP00187      |
      | 5 |     005 | 141110/005 | DC         |        14/11/10 | IR            | PA00136          | AP00137      |
    Then user should see the outcome results page
    And problem outcomes should equal 3
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type   | Description                                                                                                                                                                                                                                                                                                                                        |
      | IALB:IOUT                   | 141110/003 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IALB:IOUT                   | 141110/004 | VALIDATION4  | AP00187 is not a valid ACCESS_POINT                                                                                                                                                                                                                                                                                                                |
      | IALB:IOUT                   | 141110/004 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      | IALB:IOUT                   | 141110/005 | VALIDATION22 | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario: validate access point for ASYLUM where case start date >= 15/11/2010 with PA/AP code for stage disbursement claims
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#21"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 |     001 | 151110/001 | DC         |        15/11/10 | IR            | PA00136          | AP00137      |
      | 2 |     002 | 151110/002 | DC         |        15/11/10 | IR            |                  |              |
      | 3 |     003 | 151110/003 | DC         |        15/11/10 | IR            | PA00142          |              |
    Then user should see the outcome results page
    And problem outcomes should equal 2
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                                                                                                                                                                     |
      | IALB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .                                                                                    |
      | IALB:IOUT                   | 151110/002 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IALB:IOUT                   | 151110/003 | VALIDATION21   | When reporting an outcome with a case start date that is on or after 15-NOV-2010, the Access Point field must be complete. Please populate this field with the appropriate information .                                                                                        |
      | IALB:IOUT                   | 151110/003 | Inactive PA/AP | The Category of Law, Procurement Area and Access Point combination that has been used is not valid for the date that has been recorded. This may be because the combination was end dated prior to this date or because the combination had not yet become active at this date. |
