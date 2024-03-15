Feature: validate case start date

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate case start date for HOUSING
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date |
      |     212 |              | HANT:HHAC   | HA            |      30/09/2007 |
    Then the outcome saves successfully

  Scenario Outline: validate case start date for HOUSING
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date |
      |     213 |              | HANT:HHAC   | HA            |      31/12/1994 |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """

  Scenario Outline: validate case start date for HOUSING
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref   | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     214 | 0J180R/2013/18 | HANT:HHAC   | HA            |      25/02/2024 | PA00007          | AP00000      |
    Then the outcome saves successfully