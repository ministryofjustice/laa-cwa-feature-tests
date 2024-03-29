@bulkload
Feature: Asylum Bulk load validations for PRN Follow on work

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"

  @valid @IPRN
  Scenario: 1. Bulkload Civil Asylum outcomes with combinations IAXL:IPRN
            with completed matters and Disbursement Claims having valid values
            for Follow_on_work field which are:
            Legal Help, CLR, Licensed Work, Judicial Review
    The following Matter Types are valid only from 01/04/2023.
    Given the following Matter Types are chosen:
      | IAXL:IPRN |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | FOLLOW_ON_WORK  | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2023      | CM         | Legal Help      | IC           | TR001                        |
      | 2 | 01/04/2023      | CM         | CLR             | IC           | TR001                        |
      | 3 | 01/04/2023      | CM         | Licensed Work   | IC           | TR001                        |
      | 4 | 01/04/2023      | CM         | Judicial Review | IC           | TR001                        |
      | 5 | 01/04/2023      | DC         | Legal Help      | --           | TR001                        |
      | 6 | 01/04/2023      | DC         | CLR             | --           | TR001                        |
      | 7 | 01/04/2023      | DC         | Licensed Work   | --           | TR001                        |
      | 8 | 01/04/2023      | DC         | Judicial Review | --           | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |
      | 3 | <none>                |
      | 4 | <none>                |
      | 5 | <none>                |
      | 6 | <none>                |
      | 7 | <none>                |
      | 8 | <none>                |

      @valid @IAXL_na
      Scenario: 2. Bulkload Civil Asylum outcomes with combination IAXL:IPRN
                with completed matters and Disbursement Claims, N/A is required to be valid.
                Error messages should NOT be displayed.
                The following Matter Types are valid only from 01/04/2023.
        Given the following Matter Types are chosen:
          | IAXL:IPRN |
        And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | CLAIM_TYPE | FOLLOW_ON_WORK  | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
          | 1 | 01/04/2023      | CM         | N/A             | IC           | TR001                        |
          | 2 | 01/04/2023      | DC         | N/A             | --           | TR001                        |
        Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE |
          | 1 | <none> |
          | 2 | <none> |


  @invalid @IAXL
  Scenario: 3. Bulkload Civil Asylum outcomes with combinations IAXL:IPRN
            with completed matters and Disbursement Claims having invalid values
            for Follow_on_work field which is: NULL.
            The correct error messages should be displayed.
            The following Matter Types are valid only from 01/04/2023.
    Given the following Matter Types are chosen:
      | IAXL:IPRN |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | FOLLOW_ON_WORK  | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2023      | CM         |                 | IC           | TR001                        |
      | 2 | 01/04/2023      | DC         |                 | --           | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | Matter type combination IAXL:IPRN requires one of the following values: CLR, Judicial Review, Legal Help, Licensed Work, N/A for Follow on work. |
      | 2 | Matter type combination IAXL:IPRN requires one of the following values: CLR, Judicial Review, Legal Help, Licensed Work, N/A for Follow on work. |

  @other @valid
  Scenario: 5. Bulkload Civil Asylum outcomes with other than combinations IAXL:IPRN
            such as IAXL:IBAI IACA:IFRA
            with completed matters and Disbursement Claims having valid values
            for Follow_on_work field which are: NULL and N/A
            The correct error messages should be displayed.
            This is only applicable from 01/04/2023.
    Given the following Matter Types are chosen:
      | IAXL:IBAI |
      | IMXL:IBAI |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | FOLLOW_ON_WORK  | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2023      | CM         |                 | IC           | TR001                        |
      | 2 | 01/04/2023      | CM         | N/A             | IC           | TR001                        |
      | 3 | 01/04/2022      | DC         |                 | --           | TR001                        |
      | 4 | 01/04/2023      | DC         | N/A             | --           | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>  |
      | 2 | <none>  |
      | 3 | <none>  |
      | 4 | <none>  |

  @other @invalid
  Scenario: 6. Bulkload Civil Asylum outcomes with combinations other than IAXL:IPRN
            such as IAXL:IBAI IMXL:IBAI
            with completed matters and Disbursement Claims having invalid values
            for Follow_on_work field, which are anything other than: NULL and N/A
            The correct error messages should be displayed.
            This is only applicable from 01/04/2023.
    Given the following Matter Types are chosen:
      | IAXL:IBAI |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | FOLLOW_ON_WORK  | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2023      | CM         | Legal Help      | IC           | TR001                        |
      | 2 | 01/04/2023      | CM         | CLR             | IC           | TR001                        |
      | 3 | 01/05/2023      | DC         | Licensed Work   | --           | TR001                        |
      | 4 | 01/05/2023      | DC         | Judicial Review | --           | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | Matter type combination IAXL:IBAI requires one of the following values: N/A for Follow on work. |
      | 2 | Matter type combination IAXL:IBAI requires one of the following values: N/A for Follow on work. |
      | 3 | Matter type combination IAXL:IBAI requires one of the following values: N/A for Follow on work. |
      | 4 | Matter type combination IAXL:IBAI requires one of the following values: N/A for Follow on work. |


      @invalid @IMXL
      Scenario: 7. Bulkload Civil Asylum outcomes with combination IMXL:IPRN
                with completed matters and Disbursement Claims
                Error messages should be displayed.
                The following Matter Types are invalid only from 01/04/2023.
        Given the following Matter Types are chosen:
          | IMXL:IPRN |
        And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | CLAIM_TYPE |
          | 1 | 01/04/2023      | CM         |
          | 2 | 01/04/2023      | DC         |
        Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE |
          | 1 | An invalid matter type has been used. Please refer to the relevant guidance and re-enter. |
          | 2 | An invalid matter type has been used. Please refer to the relevant guidance and re-enter. |
