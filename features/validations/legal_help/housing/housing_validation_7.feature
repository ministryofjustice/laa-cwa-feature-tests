Feature: Legal Help (Civil).Housing Bulkload validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

    #Date Rule: 
    #Start Date Active: 23/03/2015
    #End Date Active: NULL
    #ECF Allowed: Y
  
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
      | 1 | 22/03/2015|PA00039|AP00000|HB|HA|NULL|
    Then the following error messages are matched for each:
    |ERROR_CODE_OR_MESSAGE|
    |The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.|
    |HASB:H(.*[A-Z]{3}) can only be used for matters started on or after 23-MAR-2015|

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
      | 1 | 23/03/2015|PA00015|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
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
      | 1 | 23/03/2015|PA20000|AP20000|HB|HA|1234567AB|
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
      | 1 | 22/03/2015|PA00013|AP00000|HB|HA|NULL|
    Then the following error messages are matched for each:
    |ERROR_CODE_OR_MESSAGE|
    |The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.|
    |HASB:H(.*[A-Z]{3}) can only be used for matters started on or after 23-MAR-2015|