Feature: Validation of Home Office UCN for Immigration and Asylum claims

  Background:
    Given user is on their "LEGAL HELP" submission details page

@delete_outcome_after @manual_submission @valid @ho_ucn
Scenario: Add valid Immigration and Asylum claims using new HO_UCN format
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
    | case_id | matter_type | case_start_date | ho_ucn   |
    | 001     | IMCC:IDOM   | 01/11/19        | 12345678 |
    | 002     | IMCC:IDOM   | 01/11/19        | ABCDEFGH |

    Then the outcome saves successfully

@delete_outcome_after @manual_submission @invalid @ho_ucn
Scenario: Add valid Immigration and Asylum claims using new HO_UCN format
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
    | case_id | matter_type | case_start_date | ho_ucn   |
    | 001     | IMCC:IDOM   | 01/11/19        |          |

    Then the outcome does not save and this popup error appears:
    """
    A value must be entered for "Home Office UCN"
    """
