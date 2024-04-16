Feature: procurement area accesspoint tests

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     212 |              | IMLB:IOUT   | IE            |      14/11/2010 | PA00132          | AP00000      |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     213 |              | IALB:IGOL   | IE            |      14/11/2010 | PA00132          | AP00000      |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     215 |              | IMLB:IOUT   | IE            |      14/11/2010 | PA00188          | AP00187      | No          |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     216 |              | IALB:IGOL   | IE            |      14/11/2010 | PA00188          | AP00187      | No          |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     217 |              | IMLB:IOUT   | IE            |      14/11/2010 | PA30000          | AP30000      |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     218 |              | IALB:IGOL   | IE            |      14/11/2010 | PA30000          | AP30000      |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     219 |              | IALB:IGOL   | IE            |      14/11/2010 | PA00188          | AP00186      | No          |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     220 |              | IALB:IGOL   | IE            |      14/11/2010 | PA00187          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded.
      """
