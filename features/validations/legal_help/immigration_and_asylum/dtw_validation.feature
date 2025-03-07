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

  Scenario Outline: validate DTW with ASYLUM codes and DTW "0"
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     402 |              | IALH:IOUT   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                              0 |
    Then the outcome saves successfully

  Scenario Outline: validate DTW with ASYLUM codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | matter_type | stage_reached | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     403 |              | IALH:IOUT   | IE            |      01/01/1996 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     404 | IMLH:ILEA   |      01/04/2023 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     405 | IMAP:ILEA   |      01/04/2023 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate DTW with ASYLUM codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     406 | IAXL:IFRA   |      01/04/2023 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate DTW with ASYLUM codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     407 | IAXC:IOUT   |      01/04/2023 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     408 | IMXL:ILEA   |        01/04/23 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

  Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     409 | IMXC:ILEA   |        01/04/23 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

    Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     410 | IACD:ILEA   |        31/03/23 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """

    Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     411 | IMCD:ICZN   |        31/03/23 | PA00142          | AP00187      | No          |                             10 | TR001                        |
    Then the outcome does not save and gives an error containing:
      """
      Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field.
      """     

  Scenario Outline: validate DTW with ASYLUM codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs |
      |     412 | IAXL:IDAS   |      01/04/2023 | PA00142          | AP00187      | No          |                             10 |
    Then the outcome saves successfully

  Scenario Outline: validate DTW with IMMIGRATION codes and DTW valid
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery | detention_travel_waiting_costs | exemption_criteria_satisfied |
      |     413 | IMLB:ILEA   |      01/04/2023 | PA00142          | AP00187      | No          |                              0 | TR001                        |
    Then the outcome saves successfully
