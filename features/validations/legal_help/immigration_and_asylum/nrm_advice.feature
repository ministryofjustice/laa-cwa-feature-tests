@bulkload
Feature: Asylum Bulk load validations for NRM advice dropdown field

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"

  @valid @NRMadvice
  # NRM advice is valid for all Immigration and asylum MT1 codes with any associated MT2 codes
  Scenario: Bulkload Civil Asylum outcomes with combinations IAXL:IDIF IMXL:IBAI
            with completed matters having valid values
            for NRM_ADVICE field which are:
            Yes, No and NULL
    The NRM advice dropdown is effective only from 01/04/2023.

    Given the following Matter Types are chosen:
      | IAXL:IDIF |
      | IMXL:IBAI |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | NATIONAL_REF_MECHANISM_ADVICE | OUTCOME_CODE | work_concluded_date |
      | 1 |      25/04/2022 | CM         | Y                             | --           |            26/04/22 |
      | 2 |      25/04/2022 | CM         | N                             | --           |            26/04/22 |
      | 3 |      25/04/2022 | CM         |                               | --           |            26/04/22 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |
      | 3 | <none>                |
