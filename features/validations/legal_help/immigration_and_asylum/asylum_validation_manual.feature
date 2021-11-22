Feature: Validation for Immigration and Asylum claims

@delete_outcome_after @manual_submission @valid @irc
Scenario: Add valid Immigration and Asylum claims using Derwentside IRC
    Given user is on their submission details page
    When user adds outcomes for Immigration with fields like this:
        | case_id | matter_type | case_start_date | pa      | ap      |
        | 001     | IAXL:IDAS   | 01/11/19        | PA00188 | AP00186 |
        | 002     | IAXL:IDAS   | 01/11/19        | PA00188 | AP00186 |
        | 003     | IAXL:IDAS   | 01/11/19        | PA00188 | AP00186 |
    Then the outcomes save successfully
