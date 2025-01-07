Feature: Validate age is below 18 for UASC claim field

  Background: 
    Given user is on their "LEGAL HELP" submission details page

@manual_submission
  Scenario Outline: validate access point for ASYLUM where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Asylum" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | client_dob |
      |     101 |              | IAXL:IUAS   | IE            |        15/11/10 | PA00136          | AP00137      |             |
    Then the outcome saves successfully
