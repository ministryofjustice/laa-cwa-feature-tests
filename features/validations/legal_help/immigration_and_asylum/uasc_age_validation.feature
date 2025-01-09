Feature: Validate age is below 18 for UASC claim field

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is > 18 years after client DOB
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     101 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             15/11/92 | 15111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is > 18 years after client DOB
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     102 |              | IAXC:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             15/11/92 | 15111992/T/PERS |
    Then the outcome does not save and gives an error containing:
      """
      You cannot submit a claim using matter type combination IAXC:IUAS or IAXL:IUAS if your client was aged 18 or over when the case started.
      """

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is < 18 years after client DOB
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     103 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |             17/11/92 | 17111992/T/PERS |
    Then the outcome saves successfully

  @manual_submission
  Scenario Outline: validate UASC ASYLUM case where case start date is < 18 years after client DOB
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_date_of_birth |             ucn |
      |     104 | 0E403L/2013/15 | IAXC:IUAS   |               |        15/11/13 | PA00136          | AP00137      |             |             16/11/99 | 16111999/T/PERS |
    Then the outcome saves successfully

