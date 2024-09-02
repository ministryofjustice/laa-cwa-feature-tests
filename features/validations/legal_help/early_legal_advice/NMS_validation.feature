Feature: validate NMS with PA ,case start date and schedule start/end dates

  @delete_outcome_after @manual_submission @1
  Scenario Outline: Manual entry for EARLY LEGAL ADVICE , NMS validation. Error as NMS start date is 01/04/2024
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "early_legal_advice" with fields like this:
      | case_id | matter_type | procurement_area | access_point | stage_reached | outcome_code | case_start_date |
      |     201 | LHPC:LHAC   | HP00001          | AP00000      | LA            | LB           |      31/03/2024 |
    Then the outcome does not save and gives an error containing:
      """
      There is no active HLPAS schedule authorisation for this claim.
      """

  @2
  Scenario: Bulkload HLPAS outcomes with valid procurement area codes but NMS start date is 01/04/2024
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#16"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      31/03/2024 | LA           | LA            | HP00001          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @3
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/03/24 and end date 31/03/24 but ELA matter start valid from 13/03/24
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      01/03/2024 | LA           | LA            | HP00001          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                                                     |
      | 1 | LWOT:LCRE   | The reporting code combination that has been used is not valid. Please amend accordingly. |

  @4
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/03/24 and end date 31/03/24 ELA matter start date is set at 13/03/24
  Case start date greater than NMS end date so expecting an error, NMS withdrawn case.

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      01/04/2024 | LA           | LA            | HP00001          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @5
  Scenario: Bulkload HLPAS outcomes with PA code valid with the NMS start date 01/08/24 and no end date ELA matter start date is set at 13/03/24
  Case start date before NMS start date, so NMS validation for PA code

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      01/04/2024 | LA           | LA            | HP00080          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @6
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/03/24 and end date 31/03/2024. ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date lesser than NMS start date so expecting an error. Matter starts error also happens as case start date is early to matter start date

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      28/02/2024 | LA           | LA            | HP00001          |
    Then the following results are expected:
      | ERROR_CODE_OR_MESSAGE                                                                     |
      | The reporting code combination that has been used is not valid. Please amend accordingly. |

  @7
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/03/24 and end date 31/03/2024. ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date greater than schedule end date so expecting an error

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      21/06/2024 | LA           | LA            | HP00001          |
      
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @8
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/03/24 and end date 31/03/2024. ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date within the schedule start/end date and NMS start and withdrawn date ,successful submission

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
    #  | 1 |      13/03/2024 | LA           | LA            | HP00001          |
    | 1 |      13/04/2024 | LA           | LA            | HP00001          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE |
      | 1 | LWOT:LCRE   | <none>                |

  @9
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 14/03/24 no end date. ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date within the the schedule start/end date but outside the NMS start date so expecting an error

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      13/03/2024 | LA           | LA            | HP00016          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @10
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/06/24 and no end date ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date earlier than NMS start date

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      01/05/2024 | LA           | LA            | HP00017          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @11
  Scenario: Bulkload HLPAS outcomes NMS start date 01/03/24 and end date 31/03/24 ELA matter start date is set at 13/03/24
  Its an ECF matter so NMS validation does not happen. schedule ref valid from 01-SEP-23 to 20-JUN-24, case start date is outside of schedule validity

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 |      21/06/2024 | LA           | LA            | PA20000          | AP20000      |             1234567AB |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE |
      | 1 | LWOT:LCRE   | <none>                |

  @12
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/03/24 and end date 20/06/2024. ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date is inside valid schedule start/end and valid NMS start/end date but is a withdrawn NMS auth with reason code TM-013 so does not check the date range and expect error

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      14/03/2024 | LA           | LA            | HP00002          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |

  @13
  Scenario: Bulkload HLPAS outcomes with PA code valid in the NMS start date 01/06/24 and end date 19/06/2024. ELA matter start date is set at 13/03/24, schedule ref valid from 01-SEP-23 to 20-JUN-24
  Case start date is inside valid schedule start/end and valid NMS start/end date but is a withdrawn NMS auth with reason code TM-013 so does not check the date range and expect error

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#17"
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      20/06/2024 | LA           | LA            | HP00017          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                           |
      | 1 | LWOT:LCRE   | There is no active HLPAS schedule authorisation for this claim. |
