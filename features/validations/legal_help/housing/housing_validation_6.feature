Feature: Legal Help (Civil).Housing Bulkload validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

    #Date Rule: 
    #Start Date Active: 23/03/2015
    #End Date Active: NULL
    #ECF Allowed: N
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HASB:HHAC|
      |HASB:HHLS|
      |HASB:HLAN|
      |HASB:HNAS|
      |HASB:HOTH|
      |HASB:HOWN|
      |HASB:HPRI|
      |HASB:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 23/03/2015|PA00081|AP00000|HA|HA|NULL|
    Then there should be no error outcomes

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HASB:HHAC|
      |HASB:HHLS|
      |HASB:HLAN|
      |HASB:HNAS|
      |HASB:HOTH|
      |HASB:HOWN|
      |HASB:HPRI|
      |HASB:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 23/03/2015|PA20000|AP20000|HA|HA|1234567AB|
    Then there should be no error outcomes

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HASB:HHAC|
      |HASB:HHLS|
      |HASB:HLAN|
      |HASB:HNAS|
      |HASB:HOTH|
      |HASB:HOWN|
      |HASB:HPRI|
      |HASB:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 22/03/2015|PA00002|AP00000|HA|HA|NULL|
    Then the following error message is matched for each:
    """
    HASB:H(.*[A-Z]{3}) can only be used for matters started on or after 23-MAR-2015
    """

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HASB:HHAC|
      |HASB:HHLS|
      |HASB:HLAN|
      |HASB:HNAS|
      |HASB:HOTH|
      |HASB:HOWN|
      |HASB:HPRI|
      |HASB:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 22/03/2015|PA00009|AP00000|HA|HA|NULL|
    Then the following error message is matched for each:
    """
    HASB:H(.*[A-Z]{3}) can only be used for matters started on or after 23-MAR-2015.
    """