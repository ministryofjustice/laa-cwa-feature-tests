Feature: Test for delinking issues for IALB,IMLB

  Scenario: Add a completed matter claim with IACB MT1 codes when there is an existing stage claim with IALB matter with same UFN, UCN
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | SC Claim        |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |        1470 | TR001                        |
    Given the following Matter Types are chosen:
      | IACB:IOUT |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 2 | CM Cliam        |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IE           |        1470 | TR001                        |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                       |
      | 1 | SC Claim        | £ 413.00 | False   | priced at fixed fee £413.00                                                                                                   |
      | 2 | CM Cliam        | £ 567.00 | True    | priced at fixed fee £567.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IALB + fixed fee IACB) |

  Scenario: Add a completed matter claim with IACB MT1 codes when there is an existing stage claim with IMLB matter with same UFN, UCN
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMLB:IDOM |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | SC Claim        |     001 | 010323/001 | SC         |      01/03/2023 |          01/05/2023 | --           |     1201.50 | TR001                        |
    Given the following Matter Types are chosen:
      | IACB:IOUT |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 2 | CM Cliam        |     001 | 010323/001 | CM         |      01/03/2023 |          01/08/2023 | IE           |     1201.50 | TR001                        |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                       |
      | 1 | SC Claim        | £ 234.00 | False   | priced at fixed fee £234.00                                                                                                   |
      | 2 | CM Cliam        | £ 567.00 | True    | priced at fixed fee £567.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IMLB + fixed fee IACB) |

  Scenario: Add a completed matter claim with IALB MT1 codes when there is an existing stage claim with IACC matter with same UFN, UCN
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IACC:IOUT |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | SC Claim        |     001 | 010418/001 | SC         |      01/04/2018 |          01/05/2023 | --           |        1470 | TR001                        |
    Given the following Matter Types are chosen:
      | IALB:IOUT |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 2 | CM Cliam        |     001 | 010418/001 | CM         |      01/04/2018 |          01/08/2023 | IE           |        1650 | TR001                        |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                       |
      | 1 | SC Claim        | £ 627.00 | False   | priced at fixed fee £627.00                                                                                                   |
      | 2 | CM Cliam        | £ 413.00 | True    | priced at fixed fee £413.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IACC + fixed fee IALB) |

  Scenario: Add a completed matter claim with IMLB MT1 codes when there is an existing stage claim with IACB matter with same UFN, UCN
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IACB:IOUT |
    And the following outcomes are bulkloaded and confirmed:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | SC Claim        |     001 | 010418/001 | SC         |      01/04/2018 |          01/05/2023 | --           |        1470 | TR001                        |
    Given the following Matter Types are chosen:
      | IMLB:IOUT |
    When user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4" again
    And the following outcomes are bulkloaded:
      | # | CASE_REF_NUMBER | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 2 | CM Cliam        |     001 | 010418/001 | CM         |      01/04/2018 |          01/08/2023 | IE           |        1650 | TR001                        |
    When user confirms the submission
    And user is on the pricing outcome details page
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                       |
      | 1 | SC Claim        | £ 567.00 | False   | priced at fixed fee £567.00                                                                                                   |
      | 2 | CM Cliam        | £ 234.00 | True    | priced at fixed fee £234.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IACC + fixed fee IALB) |

  @delete_outcome_after @manual_submission
  Scenario: Manual submission SC IALB , CM IACB
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_ref_number | case_id | matter_type | claim_type | case_start_date | procurement_area | access_point | outcome_code | exemption_criteria_satisfied | profit_cost |
      | SC Claim        |     001 | IALB:IOUT   | SC         |        15/03/23 | PA00139          | AP00166      | --           | TR001                        |        2939 |
      | CM Cliam        |     001 | IACB:IOUT   | CM         |        15/03/23 | PA00139          | AP00166      | IC           | TR001                        |          01 |
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                       |
      | 1 | SC Claim        | £ 413.00 | False   | priced at fixed fee £413.00                                                                                                   |
      | 2 | CM Cliam        | £ 567.00 | True    | priced at fixed fee £567.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IALB + fixed fee IACB) |

  @delete_outcome_after @manual_submission
  Scenario: Manual submission SC IMLB , CM IACB
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_ref_number | case_id | matter_type | claim_type | case_start_date | procurement_area | access_point | outcome_code | exemption_criteria_satisfied | profit_cost |
      | SC Claim        |     001 | IMLB:IOUT   | SC         |        15/03/23 | PA00139          | AP00166      | --           | TR001                        |        2402 |
      | CM Cliam        |     001 | IACB:IOUT   | CM         |        15/03/23 | PA00139          | AP00166      | IC           | TR001                        |          01 |
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                      |
      | 1 | SC Claim        | £ 234.00 | False   | priced at fixed fee £234.00                                                                                                  |
      | 2 | CM Cliam        | £ 567.00 | True    | priced at fixed fee £567.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IMLB + fixed fee IACB |

  @delete_outcome_after @manual_submission
  Scenario: Manual submission SC IACB , CM IALB
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_ref_number | case_id | matter_type | claim_type | case_start_date | procurement_area | access_point | outcome_code | exemption_criteria_satisfied | profit_cost |
      | SC Claim        |     001 | IACB:IOUT   | SC         |      01/04/2018 | PA00139          | AP00166      | --           | TR001                        |        2939 |
      | CM Cliam        |     001 | IALB:IOUT   | CM         |      01/04/2018 | PA00139          | AP00166      | IC           | TR001                        |          01 |
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                       |
      | 1 | SC Claim        | £ 567.00 | False   | priced at fixed fee £567.00                                                                                                   |
      | 2 | CM Cliam        | £ 413.00 | True    | priced at fixed fee £413.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IALB + fixed fee IACB) |

  @delete_outcome_after @manual_submission
  Scenario: Manual submission SC IACB , CM IMLB
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_ref_number | case_id | matter_type | claim_type | case_start_date | procurement_area | access_point | outcome_code | exemption_criteria_satisfied | profit_cost |
      | SC Claim        |     001 | IACB:IOUT   | SC         |      01/04/2018 | PA00139          | AP00166      | --           | TR001                        |        2402 |
      | CM Cliam        |     001 | IMLB:IOUT   | CM         |      01/04/2018 | PA00139          | AP00166      | IC           | TR001                        |          01 |
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                                      |
      | 1 | SC Claim        | £ 567.00 | False   | priced at fixed fee £567.00                                                                                                  |
      | 2 | CM Cliam        | £ 234.00 | True    | priced at fixed fee £234.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IMLB + fixed fee IACB |

  @delete_outcome_after @manual_submission
  Scenario: Manual submission SC IACB(nil claim) , CM IMLB(exceeds threshold)
    Given user is on their "LEGAL HELP" submission details page
    When user adds outcomes for "Legal Help" "Immigration" with fields like this:
      | case_ref_number | case_id | matter_type | claim_type | case_start_date | procurement_area | access_point | outcome_code | exemption_criteria_satisfied | profit_cost |
      | SC Claim        |     001 | IACB:IOUT   | SC         |      01/04/2018 | PA00139          | AP00166      | --           | TR001                        |           0 |
      | CM Cliam        |     001 | IMLB:IOUT   | CM         |      01/04/2018 | PA00139          | AP00166      | IC           | TR001                        |         702 |
    Then user should see the following outcomes for delinked claims:
      | # | CASE_REF_NUMBER | Value    | EscFlag | Comment                                                                                                      |
      | 1 | SC Claim        | £ 0.00   | False   | priced at 0 as PC = 0                                                                                        |
      | 2 | CM Cliam        | £ 234.00 | True    | priced at fixed fee £234.00 flagged as escape as profit cost from accumulated claims >= 3 * (fixed fee IMLB) |
