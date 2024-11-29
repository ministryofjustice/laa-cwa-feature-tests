Feature: YOUF code Manual and Bulk load validations

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUF with case outcome code CP19
  is invalid for YOUF

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUF |
    And the following outcomes are bulkloaded:
      | # | UFN        | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | REP_ORDER_DATE | PROFIT_COST | STANDARD_FEE_CAT |
      | 1 | 010924/001 | CP19         |           01/9/2024 | Y           | C1013          |                        1 |    01-SEP-2024 |     1072.74 |               1A |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE            |
      | 1 | CP19 is not a valid OUTCOME_CODE |

  @manual_submission
  Scenario: Manually enter YOUF outcomes using the mag court fee scheme 01-JAN-1995 to 02-OCT-2011
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | outcome_code | maat_id |
      | YOUF        |    28-OCT-2024 |               1B |           0 | 010924/001 |         01-SEP-2024 | C1013          | CP19         | 1234567 |
    Then the outcome does not save and gives an error containing:
      """
      Outcome Code - ID CP19 for the flexfield segment Outcome Code does not exist in the value set XXLSC_CASE_OUTCOME_CODE_CL.
      """

  @manual_submission
  Scenario: Manually enter YOUF outcomes without certain mandatory fields completed
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | outcome_code | maat_id |
      | YOUF        |                |                  |         100 | 010924/001 |         01-SEP-2024 | C1013          | CP18         |         |
    Then the outcome does not save and this popup error appears:
      """
      A value must be entered for "Representation Order Date".
      A value must be entered for "Standard Fee Category".
      A value must be entered for "MAAT ID".
      """

  @manual_submission
  Scenario: Manually enter YOUF outcomes and test some drop down lists are correct
    Given user is on their "CRIME LOWER" submission details page
    When user enters an outcome for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type |
      | YOUF        |
    Then the drop down list "standard_fee_cat" contains the following values:
      | Category 1A |
      | Category 1B |
      | Category 2A |
      | Category 2B |
    And the drop down list "crime_matter_type" contains the following values:
      |                                                      1-Offences against the person |
      |                                              2-Homicide and related grave offences |
      |                         3-Sexual offences and associated offences against children |
      |                                                                          4-Robbery |
      |                                                                         5-Burglary |
      |                                                                  6-Criminal damage |
      |                                 7-Theft (including taking vehicle without consent) |
      |     8-Fraud and forgery and other offences of dishonesty not otherwise categorised |
      |                                                            9-Public order offences |
      |                                                                   10-Drug offences |
      | 11-Driving and motor vehicle offences (other than those covered by codes 1, 6 & 7) |
      |                                                                  12-Other offences |
      |                                                                       13-Terrorism |
      |                                                    14-Anti-social behaviour orders |
      |                                                          15-Sexual offender orders |
      |                                                    16-Other prescribed proceedings |
      |                           36-Breach of part 1 Injunctions under the ASBCP Act 2014 |

  @bullkload_submission
  Scenario: Bulkload Crime Lower stage reached code YOUF VALIDATION4 check for YOUF with wrong profit cost values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUF |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 010924/001 |      01/9/2024 |               1A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |     1072.75 |
      | 2 | 010924/002 |      01/9/2024 |               1B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      437.82 |
      | 3 | 010924/003 |      01/9/2024 |               2A | CP18         |           01/9/2024 | Y           | C1013          |                        1 |     1335.68 |
      | 4 | 010924/004 |      01/9/2024 |               2B | CP18         |           01/9/2024 | Y           | C1013          |                        1 |      737.09 |
    Then user should see the outcome results page
    And problem outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUF                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUF matters. Please enter a valid fee in the profit costs field. |
      | YOUF                        | LAR Validation8 | The fee you have entered is not valid for Category 1B / YOUF matters. Please enter a valid fee in the profit costs field. |
      | YOUF                        | LAR Validation8 | The fee you have entered is not valid for Category 2A / YOUF matters. Please enter a valid fee in the profit costs field. |
      | YOUF                        | LAR Validation8 | The fee you have entered is not valid for Category 2B / YOUF matters. Please enter a valid fee in the profit costs field. |

  @manual_submission
  Scenario: Manually enter YOUF outcomes , check for DSCC format validation
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id | dscc_number |
      | YOUF        |    28-OCT-2024 |               1A |           0 | 010924/001 |         01-SEP-2024 | C1013          | 1234567 |           1 |
    Then the outcome does not save and gives an error containing:
      """
      The Representation Order Date must be before the case concluded date. Please enter a valid value.
      The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field.
      """
