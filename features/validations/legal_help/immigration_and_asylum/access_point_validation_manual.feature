Feature: Validate Access Point field

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate access point for ASYLUM where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     101 |              | IALB:IOUT   | IE            |        15/11/10 | PA00136          | AP00137      |             |
    Then the outcome saves successfully

  Scenario Outline: validate access point for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     102 |              | IMLB:IOUT   | IE            |        15/11/10 | PA00136          | AP00137      |             |
    Then the outcome saves successfully

  Scenario Outline: validate access point for ASYLUM where case start date >= 15/11/2010 with null PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     104 |              | IALB:IOUT   | IE            |        15/11/10 |                  |              |             |
    Then the outcome does not save and gives an error containing:
      """
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Access Point field must be complete. Please populate this field with the appropriate information .
      """

  Scenario Outline: validate access point for IMMIGRATION for null PA/AP where case start date >= 15/11/2010
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     105 |              | IMLB:IOUT   | IE            |        15/11/10 |                  |              |             |
    Then the outcome does not save and gives an error containing:
      """
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information .
      When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Access Point field must be complete. Please populate this field with the appropriate information .
      """

  Scenario Outline: validate access point for IMMIGRATION for null AP where case start date < 15/11/2010
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     107 |              | IMLB:IOUT   | IE            |        14/11/10 | PA00142          |              |             |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate access point for IMMIGRATION for null AP where case start date < 15/11/2010
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     108 |              | IMLB:IOUT   | IE            |        14/11/10 |                  |              |             |
    Then the outcome saves successfully

  Scenario Outline: validate access point for IMMIGRATION for null AP where case start date < 15/11/2010
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     109 |              | IALB:IOUT   | IE            |        14/11/10 |                  |              |             |
    Then the outcome saves successfully

  Scenario Outline: validate access point for ASYLUM for null AP where case start date < 15/11/2010
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     110 |              | IALB:IOUT   | IE            |        14/11/10 | PA00142          |              |             |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-NOV-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """
