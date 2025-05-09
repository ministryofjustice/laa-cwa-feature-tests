Feature: Validate case start date for IMCA

  Background:
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: IMCA outcomes are not valid with a CSD < 01-OCT-2007
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | case_start_date | matter_type | outcome_code | procurement_area | access_point | claim_type | stage_reached | irc_surgery |
      |     101 |              |      30/09/2007 | IMCA:IFME   | IU           | PA00177          | AP00186      | CM         | IG            | N           |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  Scenario Outline: IMCA outcomes are not valid with a CSD < 01-OCT-2007
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_id | schedule_ref | case_start_date | matter_type | outcome_code | procurement_area | access_point | claim_type | stage_reached | irc_surgery |
       |     102 |              |      30/09/2007 | IMCA:IOTH   | IF           | PA00177          | AP00186      | CM         | IG            | N           |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """
