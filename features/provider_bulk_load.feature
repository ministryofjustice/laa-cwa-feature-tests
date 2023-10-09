Feature: Provider Bulk load

  Scenario: Bulk load invalid file
    Given a test firm user is logged in CWA
    When user bulk loads "invalid.csv" for the test firm
    Then user should see a validation error

  @delete_outcome_after
  Scenario: Bulk load valid file
    Given a test firm user is logged in CWA
    When user bulk loads "valid.csv" for the test firm
    Then user should see the outcome results page
    And successful outcomes should equal 1
    And there should be other outcomes like follows
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                         | Description                                                                               |
      | FAMA:FADV                   | 020719/002 | Person         | Invalid-civil2018_paa_ validation9 | Please indicate whether a Postal or Remote Application has been accepted.                 |
      | 1234:FADV                   | 020719/002 | Person         | MANDATORY VALIDATION               | An invalid matter type has been used. Please refer to the relevant guidance and re-enter. |
    Then user confirms the submission
