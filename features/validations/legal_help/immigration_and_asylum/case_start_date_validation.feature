Feature: validate case start date

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate case start date for IMMIGRATION
    And set system date to tomorrow
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id  | matter_type | procurement_area | access_point | exemption_criteria_satisfied |
      |     201                 | IMLB:IOUT   | PA00136          | AP00137      | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
    Case Concluded Date is before Case Start Date
    Case Start Date is greater than today's date
      """
    And reset system date

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     202 |              | IMLB:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     203 |              | IMCA:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     204 |              | IMCB:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     205 |              | IMXL:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for IMMIGRATION
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     206 |              | IMXC:IOUT   | IE            |      30/09/2007 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

  Scenario Outline: validate case start date for ASYLUM
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     207 |              | IACA:IGOL   | IE            |      31/12/1994 | PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """
