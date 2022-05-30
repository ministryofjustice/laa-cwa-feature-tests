Feature: Validation for Immigration and Asylum claims

@delete_outcome_after @manual_submission @valid @irc
Scenario Outline: Add valid Immigration and Asylum claims using Derwentside IRC
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    Examples:
        | case id | mt        | ecs code | ecf ref  | case start date | pa      | ap      |
        | 001     | IAXL:IDAS |          |          | 01/11/19        | PA00188 | AP00186 |
        | 002     | IAXL:IDAS |          |          | 01/11/19        | PA00188 | AP00187 |
