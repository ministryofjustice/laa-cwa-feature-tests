Feature: validate case start date

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate case start date for IMMIGRATION
    And set system date to tomorrow
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | procurement_area | access_point | exemption_criteria_satisfied |
      |     201 | IMLB:IOUT   | PA00136          | AP00137      | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Case Concluded Date is before Case Start Date
      Case Start Date is greater than today's date
      """
    And reset system date

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery |
      |     202 |              | IMLB:IOUT   | IE            |        15/11/10 | PA00136          | AP00137      |             |
    Then the outcome saves successfully

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     203 |              | IMLB:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     204 |              | IMCA:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     205 |              | IMCB:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     206 |              | IMXL:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     207 |              | IMXC:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for ASYLUM
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     208 |              | IALB:IGOL   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome saves successfully

  Scenario Outline: validate case start date for ASYLUM
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | exemption_criteria_satisfied |
      |     209 |              | IACA:IGOL   | IE            |      31/12/1994 | PA00178          | AP00187      | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     210 |              | IMLB:IOUT   | IE            |      02/01/1995 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     211 |              | IMLB:IOUT   | IE            |      31/12/1994 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

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
