Feature: claim type validations for Immigration and Asylum

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Add null and miscllaneous claim type
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |            |      01/03/2023 |          01/05/2023 | --           |
      | 2 |     002 | 010323/002 | xx         |      01/03/2023 |          01/05/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                           |
      | 1 | The claim type for this claim has not been entered. Please refer to the relevant guidance and enter the appropriate claim type. |
      | 2 | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance.               |

  Scenario: Add DC claim type for IMAP MT1 and ILEA MT2, expect error as DC claim type is invalid for these codes
    Given the following Matter Types are chosen:
      | IMAP:ILEA |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                             |
      | 1 | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |

  Scenario: Add DC claim type for IMLH MT1 and ILEA MT2, expect error as DC claim type is invalid for these codes
    Given the following Matter Types are chosen:
      | IMLH:ILEA |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                             |
      | 1 | An invalid claim type has been used. Please check the type of claim being entered and refer to relevant guidance. |

  Scenario: Add DC claim type for IACC MT1 and IASY MT2,  DC claim type is valid for these codes
    Given the following Matter Types are chosen:
      | IACC:IASY |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/06/2023 | --           | TR001                        |
    Then there should be no problem outcomes
    Then user confirms the submission

