Feature: Validation of Home Office UCN for Immigration and Asylum claims

@delete_outcome_after @manual_submission @valid @ho_ucn
Scenario: Add valid Immigration and Asylum claims using new HO_UCN format
    Given user is on their submission details page
    When user adds outcomes for Immigration with fields like this:
    | case_id | matter_type | case_start_date | home_office_ucn   |
    | 001     | IAXL:IDAS   | 01/11/19        | 12345678 |
    | 002     | IAXL:IDAS   | 01/11/19        | ABCDEFGH |

    Then the outcome saves successfully

@delete_outcome_after @manual_submission @invalid @ho_ucn
Scenario: Add valid Immigration and Asylum claims using new HO_UCN format
    Given user is on their submission details page
    When user adds outcomes for Immigration with fields like this:
    | case_id | matter_type | case_start_date | home_office_ucn   |
    | 001     | IAXL:IDAS   | 01/11/19        |                   |

    Then the outcome does not save and this popup error appears:
    """
    A value must be entered for "Home Office UCN"
    """
