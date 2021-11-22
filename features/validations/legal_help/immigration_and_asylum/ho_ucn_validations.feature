Feature: Immigration Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#6"

  Scenario: Bulkload Civil Immigration outcomes with HO_UCN
    Given the following Matter Types are chosen:
      | IACC:IASY |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | HO_UCN |
      | 1 | 01/04/2013      |        |
      | 2 | 01/04/2013      | 1AAAAAAA1AAAAAAA1AAAAAAA |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE          |
      | 1 | HO_UCN is missing              |
      | 2 | Value :1AAAAAAA1AAAAAAA1AAAAAAA is not valid for : HO_UCN |

  Scenario: Bulkload Civil Immigration outcomes with HO_UCN
    Given the following Matter Types are chosen:
      | IACC:IASY |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | HO_UCN   |
      | 1 | 01/04/2013      | 1AAAAAAA |
      | 2 | 01/04/2013      | 1AAAAAAA1AAAAAAA |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |
