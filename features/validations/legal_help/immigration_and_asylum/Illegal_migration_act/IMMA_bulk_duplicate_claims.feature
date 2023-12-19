@bulkload
Feature: duplicate claims validations for Illegal migration act
1-11 same UFN, UCN   12-14 different UCN IMA codes   15-17 IMA to other code combo same UCN  18-21 other code to IMA code same UCN  22-24  other code to IMA code different UCN

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: 1 - Add new Stage disbursement claim when there is an existing stage claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: 2 - Add new completed matter claim when there is an existing stage claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: 3 - Add new stage claim when there is an existing stage claim with same UFN, UCN
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

  Scenario: 4 - Add new Stage claim when there is an existing stage disbursement claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/06/2023 | --           |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: 5 - Add new Stage disbursement claim when there is an existing stage disbursement claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: 6 - Add multiple Stage disbursement claims with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/04/2023 | --           |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
      | 3 |     001 | 010323/001 | DC         |      01/03/2023 |          01/06/2023 | --           |
      | 4 |     001 | 010323/001 | DC         |      01/03/2023 |          01/07/2023 | --           |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: 7 - Add new completed matter claim when there is an existing stage disbursement claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: 8 - Add new completed matter claim when there is an existing completed matter with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 9 - Add new completed matter claim when there is an existing completed matter with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IB           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 10 - Add new stage disbursement claim when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                               | Description                                                                      |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 Completed Claim Type Validation | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 11 - Add new stage claim when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                            |
      | 1 | A Completed claim has already been submitted in which the same UFN was reported. |

  Scenario: 12 - Add new completed matter claim when there is an existing completed matter claim with different UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14061962/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14061963/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IB           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type              | Description                                                                                                        |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 UCN Validation | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 13 - Add new stage claim when there is an existing stage claim with different UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14061962/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14061963/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                              |
      | 1 | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 14 - Add new stage disbursement claim when there is an existing stage disbursement claim with different UCN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14061962/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14061963/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                              |
      | 1 | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 15 - Add new completed matter claim with different immigration matter codes when there is an existing completed matter with same UFN, UCN for IMMA:IMRN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 16 - Add new completed matter claim with different immigration matter codes when there is an existing completed matter with same UFN, UCN for IMMA:IMRN with different outcome code
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IB           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 17 - Add new stage claim with different immigration matter codes when there is an existing stage claim with same UFN, UCN for IMMA:IMRN
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
      | # | ERROR_CODE_OR_MESSAGE                                                                                                      |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 18 - Add new stage disbursement claim with different immigration matter codes when there is an existing stage disbursement claim with same UFN, UCN for IMMA:IMRN
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
      | # | ERROR_CODE_OR_MESSAGE                                                                                                      |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 19 - Add new completed matter claim with IMMA:IMRN when there is an existing completed matter with same UFN, UCN for different immigration matter codes
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
      | # | ERROR_CODE_OR_MESSAGE                                                                                                      |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 20 - Add new stage claim with IMMA:IMRN when there is an existing stage claim with same UFN, UCN for different immigration matter codes
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
      | # | ERROR_CODE_OR_MESSAGE                                                                                                      |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 21 - Add new stage disbursement claim with IMMA:IMRN when there is an existing stage disbursement with same UFN, UCN for different immigration matter codes
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
      | # | ERROR_CODE_OR_MESSAGE                                                                                                      |
      | 1 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 22 - Add new stage disbursement claim with IMMA:IMRN when there is an existing stage claim with different UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                              |
      | 1 | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 23 - Add new completed matter claim with IMMA:IMRN when there is an existing stage claim with different UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type              | Description                                                                                                        |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 UCN Validation | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 24 - Add new stage disbursement claim with IMMA:IMRN when there is an existing stage disbursement claim with different UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | DC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type              | Description                                                                                                        |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 UCN Validation | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 25 - Add new stage claim with IMMA:IMRN when there is an existing stage claim with different UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type              | Description                                                                                                        |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 UCN Validation | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 26 - Add new completed matter claim with differnt matter codes when there is an existing stage claim with different UCN for IMMA:IMRN codes
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 27 - Add new completed matter claim with differnt matter codes when there is an existing completed matter claim with different UCN for IMMA:IMRN codes
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 28 - Add new stage claim with different matter combination when there is an existing stage claim with different UCN for IMMA:IMRN
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 29 - Add new stage disbursement claim with different matter codes when there is an existing stage disbursement claim with different UCN for IMA codes
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 |           14/06/1962 | 14061962/T/PERS | DC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | client_date_of_birth | ucn             | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 |           14/06/1963 | 14061963/T/PERS | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 30 - Add new completed matter claim when there is an existing stage claim with different UCN for IMMA:IMRN codes
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14061962/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14061963/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type              | Description                                                                                                        |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 UCN Validation | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 31 - Add new stage claim with differnt matter codes when there is an existing completed matter claim with same UCN for IMMA:IMRN codes
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
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type                        | Description                                                                                                                |
      | IMXL:IIRC                   | 010323/001 | Person 001     | IMA 2023 Matter Type Validation 2 | This claim contains a different Matter Type, to one reported in a previous submission, in which the same UFN was reported. |

  Scenario: 32 - Add new stage disbursement claim when there is an existing stage claim with different UCN for IMMA:IMRN codes
    Given the following Matter Types are chosen:
      | IMMA:IMRN |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14061962/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14061963/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN        | Client Surname | Error Type              | Description                                                                                                        |
      | IMMA:IMRN                   | 010323/001 | Person 001     | IMA 2023 UCN Validation | This claim contains a different UCN, to one reported in a previous submission, in which the same UFN was reported. |
