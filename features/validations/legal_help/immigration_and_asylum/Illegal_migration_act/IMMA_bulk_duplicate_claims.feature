@bulkload
Feature: duplicate claims validations for Illegal migration act

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Add new completed matter claim when there is an existing completed matter with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Add new stage claim when there is an existing stage claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                        |
      | 1 | A Stage claim has already been submitted in which the same UFN was reported. |

  Scenario: Add new Stage disbursement claim when there is an existing stage disbursement claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | <none> |

    Scenario: Add multiple Stage disbursement claims with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 3 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 4 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | <none> |


  Scenario: Add new stage claim when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: Add new stage disbursement claim when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | It is not possible to process this claim, as a Completed Matter Claim has been identified in the system. Please contact your Relationship manager by email with all the relevant case details if you need to make any amendments to previous submissions. |


  Scenario: Add new completed matter claim when there is an existing completed matter claim with different UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14091962/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14091963/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                              |
      | 1 | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: Add new stage claim when there is an existing stage claim with different UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14091962/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14091963/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                              |
      | 1 | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: Add new stage disbursement claim when there is an existing stage disbursement claim with different UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14091962/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14091963/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                              |
      | 1 | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |


  Scenario: Add new completed matter claim with different immigration matter codes when there is an existing completed matter with same UFN, UCN for IMMA:IMRN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: Add new stage claim with different immigration matter codes when there is an existing stage claim with same UFN, UCN for IMMA:IMRN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: Add new stage disbursement claim with different immigration matter codes when there is an existing stage disbursement claim with same UFN, UCN for IMMA:IMRN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

Scenario: Add new completed matter claim with IMMA:IMRN when there is an existing completed matter with same UFN, UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IB           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was repo. |

  Scenario: Add new stage claim with IMMA:IMRN when there is an existing stage claim with same UFN, UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: Add new stage disbursement claim with IMMA:IMRN when there is an existing stage disbursement with same UFN, UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |