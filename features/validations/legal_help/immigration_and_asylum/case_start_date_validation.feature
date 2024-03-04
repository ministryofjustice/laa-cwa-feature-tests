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

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMCA:IOUT   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMCB:IOUT   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |    201 |              | IMXL:IOUT   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMXC:IOUT   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IACA:IGOL   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IACA:IGOL   | IE            |       31/12/1994| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMLB:IOUT   | IE            |       02/01/1995| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Oct-2007
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMLB:IOUT   | IE            |       31/12/1994| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IMCA:IOUT   | IE            |       25/02/2024| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is greater than today's date
      """

# IA/IM CODE NOT IN LIST
Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IACA:IGOL   | IE            |       30/12/1993| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | IACA:IGOL   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome saves successfully

# NON IM/IA CODE 
Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | HANT:HHAC   | IE            |       30/09/2007| PA00178          | AP00187      |
    Then the outcome saves successfully

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | HANT:HHAC   | IE            |       31/12/1994| PA00178          | AP00187      |
    Then the outcome does not save and gives an error containing:
      """
      Case Start Date is before 01-Jan-1995
      """

Scenario Outline: validate procurement area for IMMIGRATION where case start date >= 15/11/2010 with PA/AP code
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point |
      |     201 |              | HANT:HHAC   | IE            |       25/02/2024| PA00178          | AP00187      |
    Then the outcome saves successfully