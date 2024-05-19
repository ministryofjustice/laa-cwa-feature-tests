Feature: Stage billing validations for Mental health

    @delete_outcome_after @manual_submission @invalid @mental_health
    Scenario: test
    Given user is on their "LEGAL HELP" submission details page
    And user adds outcomes for "Legal Help" "Mental Health" with fields like this:
    | case_id | matter_type | case_start_date | work_concluded_date | claim_type |
    | 099     | MHAS:MCOM   | 01/01/2020      | 01/04/2020          | DC         |
    When the outcome saves successfully
    And user adds outcomes for "Legal Help" "Mental Health" with fields like this again:
    | case_id | matter_type | case_start_date | work_concluded_date | claim_type |
    | 099     | MHAS:MCOM   | 01/01/2020      | 01/06/2020          | DC         |
    Then the outcome does not save and gives an error containing:
    """
    Stage disbursement claims can only be claimed where 3 months have elapsed since the entitlement to claim arose or an application for payment was made. Please refer to guidelines.
    """

    @delete_outcome_after @manual_submission @valid @mental_health
    Scenario: test
    Given user is on their "LEGAL HELP" submission details page
    And user adds outcomes for "Legal Help" "Mental Health" with fields like this:
    | case_id | matter_type | case_start_date | work_concluded_date | claim_type |
    | 099     | MHAS:MCOM   | 01/01/2020      | 01/04/2020          | DC         |
    When the outcome saves successfully
    And user adds outcomes for "Legal Help" "Mental Health" with fields like this again:
    | case_id | matter_type | case_start_date | work_concluded_date | claim_type |
    | 099     | MHAS:MCOM   | 01/01/2020      | 01/07/2020          | DC         |
    Then the outcome saves successfully