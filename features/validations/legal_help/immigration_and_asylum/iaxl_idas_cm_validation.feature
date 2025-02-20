Feature: Validation for Immigration and Asylum claims with matter type IAXL:IDAS.

Scenario: Add valid outcome with matter type IAXL:IDAS and claim type CM and valid outcome code IX.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST |
      | 1 |     001 | 010423/001 | CM         |      01/04/2023 |          30/04/2023 | IX           |            0 |         100 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

Scenario: Add invalid outcome with matter type IAXL:IDAS and claim type SC and outcome code --.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST |
      | 1 |     001 | 010423/001 | SC         |      01/04/2023 |          30/04/2023 | --           |            0 |         100 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | The reporting code combination that has been used is not valid. Please amend accordingly.|

Scenario: Add invalid outcomes with matter type IAXL:IDAS and claim type CM and invalid outcome codes: -- IA IB IC ID IE IF IG IH IU IV IW IY IZ.
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | --           |            1 |         100 | TR001                        |
      | 2 |     002 | 151223/002 | CM         |      15/12/2023 |          15/12/2023 | IA           |            1 |         100 | TR001                        |
      | 3 |     003 | 151223/003 | CM         |      15/12/2023 |          15/12/2023 | IB           |            1 |         100 | TR001                        |
      | 4 |     004 | 151223/004 | CM         |      15/12/2023 |          15/12/2023 | IC           |            1 |         100 | TR001                        |
      | 5 |     005 | 151223/005 | CM         |      15/12/2023 |          15/12/2023 | ID           |            1 |         100 | TR001                        |
      | 6 |     006 | 151223/006 | CM         |      15/12/2023 |          15/12/2023 | IE           |            1 |         100 | TR001                        |
      | 7 |     007 | 151223/007 | CM         |      15/12/2023 |          15/12/2023 | IF           |            1 |         100 | TR001                        |
      | 8 |     008 | 151223/008 | CM         |      15/12/2023 |          15/12/2023 | IG           |            1 |         100 | TR001                        |
      | 9 |     009 | 151223/009 | CM         |      15/12/2023 |          15/12/2023 | IH           |            1 |         100 | TR001                        |
      | 10 |    010 | 151223/010 | CM         |      15/12/2023 |          15/12/2023 | IU           |            1 |         100 | TR001                        |
      | 11 |    011 | 151223/011 | CM         |      15/12/2023 |          15/12/2023 | IV           |            1 |         100 | TR001                        |
      | 12 |    012 | 151223/012 | CM         |      15/12/2023 |          15/12/2023 | IW           |            1 |         100 | TR001                        |
      | 13 |    013 | 151223/013 | CM         |      15/12/2023 |          15/12/2023 | IY           |            1 |         100 | TR001                        |
      | 14 |    014 | 151223/014 | CM         |      15/12/2023 |          15/12/2023 | IZ           |            1 |         100 | TR001                        |

    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | The reporting code combination that has been used is not valid. Please amend accordingly. |
      