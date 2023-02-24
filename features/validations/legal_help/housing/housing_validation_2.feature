Feature: Legal Help (Civil).Housing Bulkload validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

    #Date Rule: 
    #Start Date Active: 01/01/1990
    #End Date Active: 31/03/2013
    #ECF Allowed: Y
  
  @1
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HBFT:HHAC|
      |HBFT:HHLS|
      |HBFT:HLAN|
      |HBFT:HOTH|
      |HBFT:HOWN|
      |HBFT:HPRI|
      |HBFT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HBFT:HNAS|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HU|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HHOM:HHAC|
      |HHOM:HHLS|
      |HHOM:HNAS|
      |HHOM:HOTH|
      |HHOM:HOWN|
      |HHOM:HPRI|
      |HHOM:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HLAN:HHAC|
      |HLAN:HHLS|
      |HLAN:HLAN|
      |HLAN:HNAS|
      |HLAN:HOTH|
      |HLAN:HOWN|
      |HLAN:HPRI|
      |HLAN:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HOOT:HHAC|
      |HOOT:HHLS|
      |HOOT:HLAN|
      |HOOT:HNAS|
      |HOOT:HOTH|
      |HOOT:HOWN|
      |HOOT:HPRI|
      |HOOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HHAC|
      |HPOT:HHLS|
      |HPOT:HLAN|
      |HPOT:HNAS|
      |HPOT:HOTH|
      |HPOT:HOWN|
      |HPOT:HPRI|
      |HPOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HU|HA|NULL|
    Then there should be no error outcomes

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HHAC|
      |HPOT:HHLS|
      |HPOT:HLAN|
      |HPOT:HNAS|
      |HPOT:HOTH|
      |HPOT:HOWN|
      |HPOT:HPRI|
      |HPOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HC|HC|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPPO:HHAC|
      |HPPO:HHLS|
      |HPPO:HLAN|
      |HPPO:HNAS|
      |HPPO:HOTH|
      |HPPO:HOWN|
      |HPPO:HPRI|
      |HPPO:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 31/03/2013|PA00500|AP00000|HB|HA|NULL|HPCDS001|N|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPWA:HHAC|
      |HPWA:HHLS|
      |HPWA:HLAN|
      |HPWA:HNAS|
      |HPWA:HOTH|
      |HPWA:HOWN|
      |HPWA:HPRI|
      |HPWA:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 31/03/2013|PA00500|AP00000|HB|HA|NULL|HPCDS001|N|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HREH:HHAC|
      |HREH:HHLS|
      |HREH:HLAN|
      |HREH:HNAS|
      |HREH:HOTH|
      |HREH:HOWN|
      |HREH:HPRI|
      |HREH:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HREP:HHAC|
      |HREP:HHLS|
      |HREP:HLAN|
      |HREP:HNAS|
      |HREP:HOTH|
      |HREP:HOWN|
      |HREP:HPRI|
      |HREP:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HRNT:HHAC|
      |HRNT:HHLS|
      |HRNT:HLAN|
      |HRNT:HOTH|
      |HRNT:HOWN|
      |HRNT:HPRI|
      |HRNT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HULE:HHAC|
      |HULE:HHLS|
      |HULE:HLAN|
      |HULE:HNAS|
      |HULE:HOTH|
      |HULE:HOWN|
      |HULE:HPRI|
      |HULE:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00074|AP00000|HB|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HBFT:HHAC|
      |HBFT:HHLS|
      |HBFT:HLAN|
      |HBFT:HOTH|
      |HBFT:HOWN|
      |HBFT:HPRI|
      |HBFT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HBFT:HNAS|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HU|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HHOM:HHAC|
      |HHOM:HHLS|
      |HHOM:HNAS|
      |HHOM:HOTH|
      |HHOM:HOWN|
      |HHOM:HPRI|
      |HHOM:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HLAN:HHAC|
      |HLAN:HHLS|
      |HLAN:HLAN|
      |HLAN:HNAS|
      |HLAN:HOTH|
      |HLAN:HOWN|
      |HLAN:HPRI|
      |HLAN:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HOOT:HHAC|
      |HOOT:HHLS|
      |HOOT:HLAN|
      |HOOT:HNAS|
      |HOOT:HOTH|
      |HOOT:HOWN|
      |HOOT:HPRI|
      |HOOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HHAC|
      |HPOT:HHLS|
      |HPOT:HLAN|
      |HPOT:HNAS|
      |HPOT:HOTH|
      |HPOT:HOWN|
      |HPOT:HPRI|
      |HPOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HU|HA|NULL|
    Then there should be no error outcomes

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HHAC|
      |HPOT:HHLS|
      |HPOT:HLAN|
      |HPOT:HNAS|
      |HPOT:HOTH|
      |HPOT:HOWN|
      |HPOT:HPRI|
      |HPOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HC|HC|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPPO:HHAC|
      |HPPO:HHLS|
      |HPPO:HLAN|
      |HPPO:HNAS|
      |HPPO:HOTH|
      |HPPO:HOWN|
      |HPPO:HPRI|
      |HPPO:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 01/04/2013|PA00500|AP00000|HB|HA|NULL|HPCDS001|N|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPWA:HHAC|
      |HPWA:HHLS|
      |HPWA:HLAN|
      |HPWA:HNAS|
      |HPWA:HOTH|
      |HPWA:HOWN|
      |HPWA:HPRI|
      |HPWA:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 01/04/2013|PA00500|AP00000|HB|HA|NULL|HPCDS001|N|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HREH:HHAC|
      |HREH:HHLS|
      |HREH:HLAN|
      |HREH:HNAS|
      |HREH:HOTH|
      |HREH:HOWN|
      |HREH:HPRI|
      |HREH:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HREP:HHAC|
      |HREP:HHLS|
      |HREP:HLAN|
      |HREP:HNAS|
      |HREP:HOTH|
      |HREP:HOWN|
      |HREP:HPRI|
      |HREP:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HRNT:HHAC|
      |HRNT:HHLS|
      |HRNT:HLAN|
      |HRNT:HOTH|
      |HRNT:HOWN|
      |HRNT:HPRI|
      |HRNT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HULE:HHAC|
      |HULE:HHLS|
      |HULE:HLAN|
      |HULE:HNAS|
      |HULE:HOTH|
      |HULE:HOWN|
      |HULE:HPRI|
      |HULE:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA00069|AP00000|HB|HA|NULL|
    Then the following error message is expected for each:
    """
    The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
    """

  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HBFT:HHAC|
      |HBFT:HHLS|
      |HBFT:HLAN|
      |HBFT:HOTH|
      |HBFT:HOWN|
      |HBFT:HPRI|
      |HBFT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
    Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HBFT:HNAS|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HU|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HHOM:HHAC|
      |HHOM:HHLS|
      |HHOM:HNAS|
      |HHOM:HOTH|
      |HHOM:HOWN|
      |HHOM:HPRI|
      |HHOM:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HLAN:HHAC|
      |HLAN:HHLS|
      |HLAN:HLAN|
      |HLAN:HNAS|
      |HLAN:HOTH|
      |HLAN:HOWN|
      |HLAN:HPRI|
      |HLAN:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HOOT:HHAC|
      |HOOT:HHLS|
      |HOOT:HLAN|
      |HOOT:HNAS|
      |HOOT:HOTH|
      |HOOT:HOWN|
      |HOOT:HPRI|
      |HOOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HHAC|
      |HPOT:HHLS|
      |HPOT:HLAN|
      |HPOT:HNAS|
      |HPOT:HOTH|
      |HPOT:HOWN|
      |HPOT:HPRI|
      |HPOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HU|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPPO:HHAC|
      |HPPO:HHLS|
      |HPPO:HLAN|
      |HPPO:HNAS|
      |HPPO:HOTH|
      |HPPO:HOWN|
      |HPPO:HPRI|
      |HPPO:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|HPCDS001|N|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPWA:HHAC|
      |HPWA:HHLS|
      |HPWA:HLAN|
      |HPWA:HNAS|
      |HPWA:HOTH|
      |HPWA:HOWN|
      |HPWA:HPRI|
      |HPWA:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |COURT_LOCATION_HPCDS |ELIGIBLE_CLIENT_INDICATOR|
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|HPCDS001|N|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HREH:HHAC|
      |HREH:HHLS|
      |HREH:HLAN|
      |HREH:HNAS|
      |HREH:HOTH|
      |HREH:HOWN|
      |HREH:HPRI|
      |HREH:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HREP:HHAC|
      |HREP:HHLS|
      |HREP:HLAN|
      |HREP:HNAS|
      |HREP:HOTH|
      |HREP:HOWN|
      |HREP:HPRI|
      |HREP:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HRNT:HHAC|
      |HRNT:HHLS|
      |HRNT:HLAN|
      |HRNT:HOTH|
      |HRNT:HOWN|
      |HRNT:HPRI|
      |HRNT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HULE:HHAC|
      |HULE:HHLS|
      |HULE:HLAN|
      |HULE:HNAS|
      |HULE:HOTH|
      |HULE:HOWN|
      |HULE:HPRI|
      |HULE:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013|PA20000|AP20000|HB|HA|1234567AB|
    Then there should be no error outcomes