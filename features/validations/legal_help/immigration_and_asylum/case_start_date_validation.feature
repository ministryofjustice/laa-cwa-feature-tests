Feature: Validate Procurement Area field

  Background: 
    Given user is on their "LEGAL HELP" submission details page


Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMLB:IOUT   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """