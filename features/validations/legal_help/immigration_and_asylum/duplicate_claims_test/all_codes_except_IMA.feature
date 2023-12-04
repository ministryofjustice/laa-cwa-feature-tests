@bulkload
Feature: duplicate claims validations for other codes not IMMA:IMRN

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Add new completed matter claim when there is an existing completed matter with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage claim when there is an existing stage claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage claim when there is an existing completed matter
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |


  Scenario: Add new Stage disbursement claim when there is an existing stage disbursement claim with same UFN, UCN
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
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
      | IMXL:IIRC |
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

  Scenario: Add new completed matter claim when there is an existing completed matter claim with different UCN
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14091962/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14091963/T/PERS | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage claim when there is an existing stage claim with different UCN
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14091962/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14091963/T/PERS | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage disbursement claim when there is an existing stage disbursement claim with different UCN
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 |           14/06/1962 | 14091962/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | client_date_of_birth | ucn             | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 |           14/06/1963 | 14091963/T/PERS | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new completed matter claim with different immigration matter codes when there is an existing completed matter with same UFN, UCN for IMLB:IDOM
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IA           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                                                                                                                                                                   |
      | 1 | The outcome you have entered has the same UFN as another outcome in your submission but breaks one of the following rules:\nAll outcomes with the same UFN must be in the same category of law.\nUFNs can only be repeated for Immigration or Mental Health stage bills.\nCases with matching UFNs must also have matching UCNs (Unique Client Numbers).\nPlease correct your outcome so it adheres to all these rules. |

  Scenario: Add new completed matter claim with different immigration matter codes when there is an existing completed matter with same UFN, UCN for IMLB:IDOM with different outcome code
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IB           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage claim with different immigration matter codes when there is an existing stage claim with same UFN, UCN for IMLB:IDOM
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
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
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage disbursement claim with different immigration matter codes when there is an existing stage disbursement claim with same UFN, UCN for IMLB:IDOM
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
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
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new completed matter claim with IMLB:IDOM when there is an existing completed matter with same UFN, UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | CM         |      01/03/2023 |          01/05/2023 | IA           |
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IB           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage claim with IMLB:IDOM when there is an existing stage claim with same UFN, UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | SC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Add new stage disbursement claim with IMLB:IDOM when there is an existing stage disbursement with same UFN, UCN for different immigration matter codes
    Given the following Matter Types are chosen:
      | IMXL:IIRC |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 |     001 | 010323/001 | DC         |      01/03/2023 |          01/05/2023 | --           |
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 2 |     001 | 010323/001 | DC         |      01/03/2023 |          01/08/2023 | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
