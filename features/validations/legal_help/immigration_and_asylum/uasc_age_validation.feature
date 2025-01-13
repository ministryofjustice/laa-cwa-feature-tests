Feature: Validate age is below 18 for UASC claim field

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is > 18 years after client DOB
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     101 |              | IAXC:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             14/11/92 | 14111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is > 18 years after client DOB
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     102 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             14/11/92 | 14111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is = 18 years after client DOB
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     103 |              | IAXC:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             15/11/92 | 15111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is = 18 years after client DOB
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     104 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             15/11/92 | 15111992/T/PERS |
    Then the outcome does not save and gives an error containing:
    """
    You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
    """

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is < 18 years after client DOB
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     105 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |             |             16/11/95 | 16111995/T/PERS |
    Then the outcome saves successfully

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is < 18 years after client DOB
  Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     106 | 0E403L/2013/15 | IAXL:IUAS   |               |        15/11/13 | PA00136          | AP00137      |             |             16/11/95 | 16111995/T/PERS |
    Then the outcome saves successfully


  @bulkload_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is < 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXL:IUAS |
      | IAXC:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |client_date_of_birth |             ucn |
      |     107 |                | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |            Test |         Person |            16/11/92 | 16111992/T/PERS |
      |     108 |                | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |            Test |         Person |            16/11/95 | 16111995/T/PERS |
    Then user should see the outcome results page
    And the outcome saves successfully

  @bulkload_submission
  Scenario Outline: validate IAXL:UASC ASYLUM case where case start date is = 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#26"
    Given the following Matter Types are chosen:
      | IAXL:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |client_date_of_birth |             ucn |
      |     109 |                | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |            Test |         Person |            15/11/92 | 15111992/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXL:IUAS                   | 151110/109 | VALIDATION21   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |

  @bulkload_submission
  Scenario Outline: validate IAXC:UASC ASYLUM case where case start date is = 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXC:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |client_date_of_birth |             ucn |
      |     110 |                | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |            Test |         Person |            15/11/95 | 15111995/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXC:IUAS                   | 151110/110 | VALIDATION21   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |
    

  @bulkload_submission
  Scenario Outline: validate IAXL:UASC ASYLUM case where case start date is > 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#26"
    Given the following Matter Types are chosen:
      | IAXL:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |client_date_of_birth |             ucn |
      |     111 |                | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |            Test |         Person |            14/11/92 | 14111992/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXL:IUAS                   | 151110/111 | VALIDATION21   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |

    @bulkload_submission
  Scenario Outline: validate IAXC:UASC ASYLUM case where case start date is > 18 years after client DOB
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#13"
    Given the following Matter Types are chosen:
      | IAXC:IUAS |
    And the following outcomes are bulkloaded:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | client_forename | client_surname |client_date_of_birth |             ucn |
      |     112 |                | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |            Test |         Person |            14/11/95 | 14111995/T/PERS |
    Then user should see the outcome results page
    And problem outcomes should equal 1
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Error Type     | Description                                                                                                                              |
      | IAXC:IUAS                   | 151110/112 | VALIDATION21   | You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started. |