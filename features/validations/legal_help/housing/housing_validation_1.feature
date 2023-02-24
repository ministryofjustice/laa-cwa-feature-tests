Feature: Legal Help (Civil).Housing Bulkload validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

    #Date Rule: 
    #Start Date Active: 01/01/1990
    #End Date Active: 31/03/2013
    #ECF Allowed: N
  
  Scenario: Bulkload Civil Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HMOR:HHAC|
      |HMOR:HHLS|
      |HMOR:HLAN|
      |HMOR:HNAS|
      |HMOR:HOTH|
      |HMOR:HOWN|
      |HMOR:HPRI|
      |HMOR:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00055|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Civil Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPCO:HHAC|
      |HPCO:HHLS|
      |HPCO:HLAN|
      |HPCO:HNAS|
      |HPCO:HOTH|
      |HPCO:HOWN|
      |HPCO:HPRI|
      |HPCO:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 31/03/2013|PA00500|AP00000|HB|HA|NULL|HPCDS001|N|
    Then there should be no error outcomes
  
  Scenario: Bulkload Civil Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HMOR:HHAC|
      |HMOR:HHLS|
      |HMOR:HLAN|
      |HMOR:HNAS|
      |HMOR:HOTH|
      |HMOR:HOWN|
      |HMOR:HPRI|
      |HMOR:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00075|AP00000|HB|HA|1234567AB|
    Then the following error message is expected for each:
    """
    The combination of outcome reporting codes that has been used to report this case can only be used for cases started prior to 01-APR-2013 , because it contains one or more codes that are now redundant.
    """

  Scenario: Bulkload Civil Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPCO:HHAC|
      |HPCO:HHLS|
      |HPCO:HLAN|
      |HPCO:HNAS|
      |HPCO:HOTH|
      |HPCO:HOWN|
      |HPCO:HPRI|
      |HPCO:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 01/04/2013|PA00500|AP00000|HB|HA|1234567AB|HPCDS001|N|
    Then the following error message is expected for each:
    """
    The combination of outcome reporting codes that has been used to report this case can only be used for cases started prior to 01-APR-2013 , because it contains one or more codes that are now redundant.
    """
  
  Scenario: Bulkload Civil Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HMOR:HHAC|
      |HMOR:HHLS|
      |HMOR:HLAN|
      |HMOR:HNAS|
      |HMOR:HOTH|
      |HMOR:HOWN|
      |HMOR:HPRI|
      |HMOR:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00017|AP00000|HB|HA|1234567AB|
    Then the following error message is expected for each:
    """
    The combination of outcome reporting codes that has been used to report this case can only be used for cases started prior to 01-APR-2013 , because it contains one or more codes that are now redundant.
    """
  
  Scenario: Bulkload Civil Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPCO:HHAC|
      |HPCO:HHLS|
      |HPCO:HLAN|
      |HPCO:HNAS|
      |HPCO:HOTH|
      |HPCO:HOWN|
      |HPCO:HPRI|
      |HPCO:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF | COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 01/04/2013|PA00500|AP00000|HB|HA|1234567AB|HPCDS001|N|
    Then the following error message is expected for each:
    """
    The combination of outcome reporting codes that has been used to report this case can only be used for cases started prior to 01-APR-2013 , because it contains one or more codes that are now redundant.
    """