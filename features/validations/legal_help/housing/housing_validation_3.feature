Feature: Legal Help (Civil).Housing Bulkload validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.HOU#12"

    #Date Rule: 
    #Start Date Active: 01/01/1990
    #End Date Active: NULL
    #ECF Allowed: N
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HANT:HHAC|
      |HANT:HHLS|
      |HANT:HLAN|
      |HANT:HNAS|
      |HANT:HOTH|
      |HANT:HOWN|
      |HANT:HPRI|
      |HANT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HDIS:HHAC|
      |HDIS:HHLS|
      |HDIS:HLAN|
      |HDIS:HNAS|
      |HDIS:HOTH|
      |HDIS:HOWN|
      |HDIS:HPRI|
      |HDIS:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
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
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
    Then there should be no error outcomes
  
    Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HHOM:HLAN|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00080|AP00000|HU|HA|NULL|
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
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
    Then there should be no error outcomes
  
  Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HHAC|
      |HPOT:HHLS|
      |HPOT:HLAN|
      |HPOT:HNAS|
      |HPOT:HOTH|
      |HPOT:HPRI|
      |HPOT:HPUB|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
    Then there should be no error outcomes
  
    Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HPOT:HOWN|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00080|AP00000|HA|HA|NULL|
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
      | 1 | 31/03/2013|PA00500|AP00000|HF|HA|NULL|HPCDS001|N|
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
      | 1 | 31/03/2013|PA00500|AP00000|HF|HA|NULL|HPCDS001|N|
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
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
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
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
    Then there should be no error outcomes
  
    Scenario: Bulkload Legal Help (Civil).Housing outcomes 
    Given the following Matter Types are chosen:
      |HRNT:HNAS|
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE    | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | STAGE_REACHED | EXCL_CASE_FUNDING_REF |
      | 1 | 31/03/2013|PA00080|AP00000|HD|HA|NULL|
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
      | 1 | 31/03/2013|PA00080|AP00000|HF|HA|NULL|
    Then there should be no error outcomes
  