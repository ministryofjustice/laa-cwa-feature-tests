@bulkload
Feature: Stage billing validations for Asylum and Immigration (this is set to 1 month in tst)

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Add new stage Disbursement claim when there are no existing claims
    Given the following Matter Types are chosen:
      | IACC:IASY |
      | IACC:IFRA |
      | IACC:IFST |
      | IACC:IIRC |
      | IACC:ILEA |
      | IACC:IOTH |
      | IACC:IOUT |
      | IACC:IRVL |
      | IACC:IGOL |
      | IACD:IASY |
      | IACD:IFRA |
      | IACD:IFST |
      | IACD:IIRC |
      | IACD:ILEA |
      | IACD:IOTH |
      | IACD:IOUT |
      | IACD:IRVL |
      | IACD:IGOL |
      | IMCC:IDOM |
      | IMCC:IILL |
      | IMCC:IIRC |
      | IMCC:IOTH |
      | IMCC:IOUT |
      | IMCC:IRVL |
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:IGOL |
      | IMCC:ISTU |
      | IMCC:ITWE |
      | IMCD:IDOM |
      | IMCD:IILL |
      | IMCD:IIRC |
      | IMCD:IOTH |
      | IMCD:IOUT |
      | IMCD:IRVL |
      | IMCD:ICZN |
      | IMCD:IEMP |
      | IMCD:IEUL |
      | IMCD:IFME |
      | IMCD:IFVI |
      | IMCD:IGOL |
      | IMCD:ISTU |
      | IMCD:ITWE |
    When the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | DC         | 01/01/2020      | 28/01/2020          | --           |
      | 2 | DC         | 01/01/2020      | 01/04/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                          |
      | 1 | Stage disbursement claims can only be claimed where 3 months have elapsed from the date the matter was opened. Please refer to the guidelines. |
      | 2 | <none>                                                                                                                                         |

  Scenario: Add new stage disbursement claim *before* 1 months have elapsed since the claim date of the previous stage disbursment claim
    Given the following Matter Types are chosen:
      | IACC:IASY |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | 001     | 010120/001 | DC         | 01/01/2020      | 01/02/2020          | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 | 001     | 010120/001 | DC         | 01/01/2020      | 01/04/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                              |
      | 2 | Stage disbursement claims can only be claimed where 3 months have elapsed since the entitlement to claim arose or an application for payment was made. Please refer to guidelines. |

  Scenario: Add new stage disbursement claim *after* 3 months have elapsed since the claim date of the previous stage disbursment claim
    Given the following Matter Types are chosen:
      | IMCD:IILL |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | 001     | 010120/001 | DC         | 01/01/2020      | 01/02/2020          | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 | 001     | 010120/001 | DC         | 01/01/2020      | 01/05/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 2 | <none>                |

  Scenario: Add new stage disbursement claim when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMCD:IOTH |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | 001     | 010120/001 | CM         | 01/01/2020      | 01/04/2020          | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 | 001     | 010120/001 | DC         | 01/01/2020      | 01/04/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                     |
      | 2 | It is not possible to process this claim, as a Completed Matter Claim has been identified in the system. Please contact your Relationship manager by email with all the relevant case details if you need to make any amendments to previous submissions. |

  @bugfix
  Scenario: Add new stage disbursement claim with *less* than 6 months between case start date and claim date when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMCD:IFVI |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | 001     | 010120/001 | CM         | 01/01/2020      | 01/04/2020          | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 | 001     | 010120/001 | DC         | 01/01/2020      | 30/06/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                     |
      | 2 | It is not possible to process this claim, as a Completed Matter Claim has been identified in the system. Please contact your Relationship manager by email with all the relevant case details if you need to make any amendments to previous submissions. |

  @bugfix
  Scenario: Add new stage disbursement claim with *more* than 6 months between case start date and claim date when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IACC:IRVL |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | 001     | 010120/001 | CM         | 01/01/2020      | 01/04/2020          | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 | 001     | 010120/001 | DC         | 01/01/2020      | 01/07/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                     |
      | 2 | It is not possible to process this claim, as a Completed Matter Claim has been identified in the system. Please contact your Relationship manager by email with all the relevant case details if you need to make any amendments to previous submissions. |
