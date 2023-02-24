Feature: Legal Help (Civil).Housing Bulkload validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

    #Date Rule: 
    #Start Date Active: 01/04/2013
    #End Date Active: NULL
    #ECF Allowed: Y
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOS:HHAC|
      |HPOS:HHLS|
      |HPOS:HLAN|
      |HPOS:HNAS|
      |HPOS:HOTH|
      |HPOS:HOWN|
      |HPOS:HPRI|
      |HPOS:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00056|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOS:HHAC|
      |HPOS:HHLS|
      |HPOS:HLAN|
      |HPOS:HNAS|
      |HPOS:HOTH|
      |HPOS:HOWN|
      |HPOS:HPRI|
      |HPOS:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOS:HHAC|
      |HPOS:HHLS|
      |HPOS:HLAN|
      |HPOS:HNAS|
      |HPOS:HOTH|
      |HPOS:HOWN|
      |HPOS:HPRI|
      |HPOS:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00072|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes that has been reported cannot be used with a case start date that is prior to 01-APR-2013 because one or more element is only active on or after this date.
    """