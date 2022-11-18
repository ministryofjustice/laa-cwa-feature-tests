Feature: Validation for Housing claims

  Background:
    Given user is on their "LEGAL HELP" submission details page

    @delete_outcome_after @manual_submission @valid @disability_code
    Scenario Outline: Add valid Housing claims using Disability Code
        When user adds outcomes for "Legal Help" "Housing" with fields like this:
        | case_id | matter_type | case_start_date | procurement_area | access_point | disability |
        | 001     | HHOM:HPRI   | 01/11/19        | PA00119          | AP00000      | COG        |

        Then the outcome saves successfully
