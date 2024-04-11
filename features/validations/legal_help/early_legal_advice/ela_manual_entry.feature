Feature: validate case start date

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: Manual entry for EARLY LEGAL ADVICE
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
    | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date |
    |     212 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      01/04/2024 |

    Then the outcome saves successfully
    
  Scenario Outline: Manual entry for EARLY LEGAL ADVICE
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
    | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date |
    |     213 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      31/03/2024 |

    Then the outcome does not save and gives an error containing:
       """
       The reporting code combination that has been used is not valid. Please amend accordingly.
       """