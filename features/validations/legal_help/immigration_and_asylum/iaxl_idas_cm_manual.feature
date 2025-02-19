Feature: Validation for Immigration and Asylum claims with matter type IAXL:IDAS.

  Background:
    Given user is on their "LEGAL HELP" submission details page

  @delete_outcome_after @manual_submission @valid @iaxl @idas
  Scenario Outline: Add valid Immigration and Asylum claims using matter type IAXL:IDAS and completed matters, CM. Only outcome code IX is valid. 
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | claim_type | procurement_area | access_point | outcome_code  | irc_surgery |
      |     001 | IAXL:IDAS   |        18/10/21 |   CM       |  PA00188         | AP00186      | IX            |    No       |  
    Then the outcome saves successfully


  @delete_outcome_after @manual_submission @invalid @iaxl @idas
  Scenario Outline: Add invalid Immigration and Asylum claims using matter type IAXL:IDAS and completed matters, CM. Outcome code -- is not valid. 
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | claim_type | procurement_area | access_point | outcome_code  | irc_surgery |
      |     002 | IAXL:IDAS   |        18/10/21 |   CM       |  PA00188         | AP00186      | --            |    No       |  
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  @delete_outcome_after @manual_submission @invalid @iaxl @idas
  Scenario Outline: Add invalid Immigration and Asylum claims using matter type IAXL:IDAS and completed matters, CM. Outcome code IA is not valid. 
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | claim_type | procurement_area | access_point | outcome_code  | irc_surgery |  
      |     003 | IAXL:IDAS   |        18/10/21 |   CM       |  PA00188         | AP00187      | IA            |    No       |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  @delete_outcome_after @manual_submission @invalid @iaxl @idas
  Scenario Outline: Add invalid Immigration and Asylum claims using matter type IAXL:IDAS and completed matters, CM. Outcome code ID is not valid. 
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | claim_type | procurement_area | access_point | outcome_code  | irc_surgery |  
      |     004 | IAXL:IDAS   |        18/10/21 |   CM       |  PA00188         | AP00187      | ID            |    No       |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  @delete_outcome_after @manual_submission @invalid @iaxl @idas
  Scenario Outline: Add invalid Immigration and Asylum claims using matter type IAXL:IDAS and completed matters, CM. Outcome code IZ is not valid. 
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | claim_type | procurement_area | access_point | outcome_code  | irc_surgery |  
      |     005 | IAXL:IDAS   |        18/10/21 |   CM       |  PA00188         | AP00187      | IZ            |    No       |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """
 
  @delete_outcome_after @manual_submission @invalid @iaxl @idas
  Scenario Outline: Add invalid Immigration and Asylum claims using matter type IAXL:IDAS and stage claim, SC which is not allowed. 
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | matter_type | case_start_date | claim_type | procurement_area | access_point | outcome_code  | 
      |     006 | IAXL:IDAS   |        18/10/21 |   SC       |  PA00188         | AP00187      | --            |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """