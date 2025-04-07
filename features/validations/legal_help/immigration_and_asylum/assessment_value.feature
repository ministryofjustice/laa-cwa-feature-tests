Feature: Validation for Immigration and Asylum claims

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  @delete_outcome_after @manual_submission @valid @assessment_value
  Scenario Outline: Add valid Immigration and Asylum claims and test the assessment Value
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | claim_type | outcome_code | profit_cost | cmrh_oral |
      |     001 | IALB:IASY   |        18/10/21 | PA00137          | AP00148      | SC         | --           |         100 |         0 |
      |     001 | IACA:IASY   |        18/10/21 | PA00137          | AP00148      | CM         | IW           |         100 |         0 |
      |     002 | IMLB:IDOM   |        18/10/21 | PA00137          | AP00148      | SC         | --           |         100 |         0 |
      |     002 | IMCA:IDOM   |        18/10/21 | PA00137          | AP00148      | CM         | IA           |        2000 |         2 |
    Then the outcome saves successfully
    And the assessment value should be returned for the following outcomes:
      | case_id | assessment_value | linked_lines | escape_flag |
      |     001 |           227.00 |            2 | N           |
      |     002 |          1866.00 |            2 | Y           |

  @delete_outcome_after @manual_submission @valid @assessment_value
  Scenario Outline: Add valid Immigration and Asylum claims and test the assessment Value
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | claim_type | outcome_code | profit_cost | counsel_cost | substantive_hearing | cmrh_telephone | vat_indicator |
      |     001 | IACB:IFRA   |        16/06/20 | PA00136          | AP00137      | CM         | IC           |         300 |      1003.39 | Y                   |              1 | Y             |
    Then the outcome saves successfully
    And the assessment value should be returned for the following outcomes:
      | case_id | assessment_value | linked_lines | escape_flag |
      |     001 |          1150.80 |            1 | N           |
