Feature: Validation for Illegal Immigration Act

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: Stage claim with ECF Reference
    When user adds outcomes for "Legal Help" "Immigration" with fields like this for dulplicate claims:
      | case_id | matter_type | case_start_date | excl_case_funding_ref | work_concluded_date | claim_type | ho_ucn   | ho_interview | outcome_code | procurement_area | access_point |
      |     001 | IMMA:IMRN   |      01/05/2023 |             1234567AB |          01/08/2023 | CM         | 12345678 |            0 | --           | PA20000          | AP20000      |
    When user adds outcomes for "Legal Help" "Immigration" with fields like this for dulplicate claims:
      | case_id | matter_type | case_start_date | excl_case_funding_ref | work_concluded_date | claim_type | ho_ucn   | ho_interview | outcome_code | procurement_area | access_point |
      |     001 | IMMA:IMRN   |      01/05/2023 |             1234567AB |          01/08/2023 | CM         | 12345678 |            0 | --           | PA20000          | AP20000      |
    Then the outcome does not save and the error message "<error message>" appears

    Examples: 
      | error message                                                                    |
      | A Completed claim has already been submitted in which the same UFN was reported. |
