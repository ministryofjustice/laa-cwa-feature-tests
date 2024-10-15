Feature: Manual claims validations for Access point and Procurement area

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate procurement area for Housing for null PA where case start date >= 15/11/2010
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     529 |              | HHOM:HPRI   | HA            |        15/11/10 |                  |              |             |
    Then the outcome does not save and gives an error containing:
      """
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .
      """

  Scenario Outline: validate procurement area for Housing for null PA case start date < 15/11/2010
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     530 |              | HHOM:HPRI   | HA            |        14/11/10 |                  |              |             |
    Then the outcome saves successfully

  Scenario Outline: validate procurement area for Housing case start date prior 15/11/2010 with PA code
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     531 |              | HHOM:HPRI   | HA            |        14/11/10 | PA00010          |              |             |
    Then the outcome does not save and gives an error containing:
      """
      The case start date of this matter is prior to 15-Nov-2010 . A Procurement Area cannot be recorded against this matter. Please amend the outcome details accordingly
      """

  Scenario Outline: validate access point for Housing where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     103 |              | HHOM:HPRI   | HA            |        15/11/10 | PA00006          | AP00006      |
    Then the outcome saves successfully

  Scenario Outline: validate access point for Housing for null PA where case start date >= 15/11/2010
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     106 |              | HHOM:HPRI   | HA            |        15/11/10 |                  |              |
    Then the outcome does not save and gives an error containing:
      """
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Access Point field must be complete. Please populate this field with the appropriate information .
      """

  Scenario Outline: validate access point for Housing for null PA where case start date < 15/11/2010
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     111 |              | HHOM:HPRI   | HA            |        14/11/10 |                  | AP00187      |
    Then the outcome saves successfully

  Scenario Outline: validate access point for Housing case start date prior 15/11/2010 with PA code
    When user adds outcomes for "Legal Help" "Housing" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     113 |              | HHOM:HPRI   | HA            |        14/11/10 | PA00010          | AP00000      |             |
    Then the outcome does not save and gives an error containing:
      """
      The case start date of this matter is prior to 15-Nov-2010 . A Procurement Area cannot be recorded against this matter. Please amend the outcome details accordingly
      The case start date of this matter is prior to 15-Nov-2010 . An Access Point cannot be recorded against this matter. Please amend the outcome details accordingly
      """
