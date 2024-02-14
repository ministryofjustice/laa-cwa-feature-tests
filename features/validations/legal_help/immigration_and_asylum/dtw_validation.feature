Feature: Validate Procurement Area field

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate DTW  , IMMIGRATION and DTW invalid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | stage_reached | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     401 |              |               | IMLB:IOUT   |        14/11/10 | PA00142          | AP00187      | No          | abcd                           |
    Then the outcome does not save and this popup error appears:
      """
      Value "abcd" in "Detention Travel & Waiting Costs Excluding VAT" is not a number.
      """

  Scenario Outline: validate DTW with ASYLUM codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     402 |              | IALH:IOUT   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     403 |              | IAAP:IGOL   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     404 |              | IMLH:ILEA   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     405 |              | IMAP:ILEA   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     406 |              | IAXL:IEAP   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     407 |              | IAXC:IOUT   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     408 |              | IMXL:ILEA   | IE            |        01/11/07 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     409 |              | IMXC:ILEA   | IE            |        01/11/07 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     410 |              | IAXL:IDAS   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome saves successfully
