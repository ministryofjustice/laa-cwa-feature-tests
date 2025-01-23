Feature: Validate age is below 18 for UASC claim field

  @manual_submission
  Scenario Outline: validate manual IAXC:UASC ASYLUM case where client is over 18 at CSD
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |  client_date_of_birth |             ucn |
      |     101 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/10 | PA00136          | AP00137      |             |            14/11/1992 | 14111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """


  @manual_submission
  Scenario Outline: validate manual IAXL:UASC ASYLUM case where client is over 18 at CSD
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |  client_date_of_birth |             ucn |
      |     102 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |            14/11/1992 | 14111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """


  @manual_submission
  Scenario Outline: validate manual IAXC:UASC ASYLUM case where client is 18 years old at CSD
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |  client_date_of_birth |             ucn |
      |     103 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/10 | PA00136          | AP00137      |             |            15/11/1992 | 15111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """


  @manual_submission
  Scenario Outline: validate manual IAXL:UASC ASYLUM case where client is 18 years old at CSD
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |  client_date_of_birth |             ucn |
      |     104 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |            15/11/1992 | 15111992/T/PERS |
    Then the outcome does not save and gives an error containing:
    """
    You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
    """


  @manual_submission
  Scenario Outline: validate manual IAXC:UASC ASYLUM case where client is under 18 at CSD
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |  client_date_of_birth |             ucn |   period |
      |     105 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |             |            16/11/1995 | 16111995/T/PERS | OCT-2020 |
    Then the outcome saves successfully


  @manual_submission
  Scenario Outline: validate manual IAXL:UASC ASYLUM case where client is under 18 at CSD
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |  client_date_of_birth |             ucn |
      |     106 | 0E403L/2013/15 | IAXL:IUAS   |               |        15/11/13 | PA00136          | AP00137      |             |            16/11/1995 | 16111995/T/PERS |
    Then the outcome saves successfully


  @bulkload_submission
  Scenario Outline: validate bulkload IAXC:UASC and IAXL:UASC ASYLUM case where client is under 18 at CSD
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXL:IUAS |
      | IAXC:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |  client_date_of_birth |             ucn |
      |     107 |                | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |            Test |         Person |            16/11/1992 | 16111992/T/PERS |
      |     108 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |            Test |         Person |            16/11/1995 | 16111995/T/PERS |
    Then user should see the outcome results page
    And the outcome saves successfully


  @bulkload_submission
  Scenario Outline: validate IAXL:UASC ASYLUM case where case start date is = 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXL:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |  client_date_of_birth |             ucn |
      |     109 |                | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |            Test |         Person |            15/11/1992 | 15111992/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXL:IUAS                   | 151110/109 | UASC_VALIDATION   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |


  @bulkload_submission
  Scenario Outline: validate IAXC:UASC ASYLUM case where case start date is = 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXC:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |  client_date_of_birth |             ucn |
      |     110 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |            Test |         Person |            15/11/1995 | 15111995/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXC:IUAS                   | 151113/110 | UASC_VALIDATION   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |
    

  @bulkload_submission
  Scenario Outline: validate IAXL:UASC ASYLUM case where case start date is > 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXL:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |  client_date_of_birth |             ucn |
      |     111 |                | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |            Test |         Person |            14/11/1992 | 14111992/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXL:IUAS                   | 151110/111 | UASC_VALIDATION   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |


  @bulkload_submission
  Scenario Outline: validate IAXC:UASC ASYLUM case where case start date is > 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXC:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |  client_date_of_birth |             ucn |
      |     112 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |            Test |         Person |            14/11/1995 | 14111995/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXC:IUAS                   | 151113/112 | UASC_VALIDATION   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |

