Feature: Provider Bulk load

Scenario: Bulk load invalid file
  Given user is on CWA Navigation page
  When user bulk loads "invalid-bulkload-file.csv" for the test firm
  Then user should see a validation error

@delete_outcome_after
Scenario: Bulk load valid file
  Given user is on CWA Navigation page
  When user bulk loads "valid-bulkload-file.csv" for the test firm
  Then user should see the outcome results page
  And the following summary for the submission:
    | Total Outcomes | Successful Outcomes | Problem Outcomes | Duplicate Outcomes | Invalid Outcomes/NMS |
    | 3              | 1                   | 1                | 0                  | 1                    |
  And the following errors:
    | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                         | Description                                                                               |
    | FAMA:FADV                   | 020719/002 | Person         | Invalid-civil2018_paa_ validation9 | Please indicate whether a Postal or Remote Application has been accepted.                 |
    | 1234:FADV                   | 020719/002 | Person         | MANDATORY VALIDATION               | An invalid matter type has been used. Please refer to the relevant guidance and re-enter. |
  When user confirms the submission
  Then user should see the submission reference in the submission list page
