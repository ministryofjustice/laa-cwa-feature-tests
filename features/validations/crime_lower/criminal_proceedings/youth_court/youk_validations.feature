Feature: YOUK code Manual and Bulk load validations

  @bullkload_submission
  Scenario: bulkload Crime Lower stage reached code YOUK with case outcome code CP19
  is invalid for YOUK

    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUK |
    And the following outcomes are bulkloaded:
      | # | UFN        | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | REP_ORDER_DATE | PROFIT_COST | STANDARD_FEE_CAT |
      | 1 | 061224/001 | CP19         |          06/12/2024 | Y           | C1013          |                        1 |    06-DEC-2024 |      884.61 |               1A |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE            |
      | 1 | CP19 is not a valid OUTCOME_CODE |

  @manual_submission
  Scenario: Manually enter YOUK outcomes using the mag court fee scheme 01-JAN-1995 to 02-OCT-2011
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | outcome_code | maat_id |
      | YOUK        |    06-DEC-2024 |               1C |           0 | 061224/001 |         06-DEC-2024 | C1013          | CP19         | 1234567 |
    Then the outcome does not save and gives an error containing:
      """
      Outcome Code - ID CP19 for the flexfield segment Outcome Code does not exist in the value set XXLSC_CASE_OUTCOME_CODE_CL.
      """

  @manual_submission
  Scenario: Manually enter YOUK outcomes without certain mandatory fields completed
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | outcome_code | maat_id |
      | YOUK        |                |                  |         100 | 061224/001 |         06-DEC-2024 | C1013          | CP18         |         |
    Then the outcome does not save and this popup error appears:
      """
      A value must be entered for "Representation Order Date".
      A value must be entered for "Standard Fee Category".
      A value must be entered for "MAAT ID".
      """

  @manual_submission
  Scenario: Manually enter YOUK outcomes and test some drop down lists are correct
    Given user is on their "CRIME LOWER" submission details page
    When user enters an outcome for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type |
      | YOUK        |
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

  @bullkload_submission
  Scenario: Bulkload Crime Lower stage reached code YOUK VALIDATION4 check for YOUK with wrong profit cost values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "CRIME LOWER#24"
    Given the following Matter Types are chosen:
      | YOUK |
    And the following outcomes are bulkloaded:
      | # | UFN        | REP_ORDER_DATE | STANDARD_FEE_CAT | OUTCOME_CODE | WORK_CONCLUDED_DATE | YOUTH_COURT | POLICE_STATION | NUMBER_OF_POLICE_STATION | PROFIT_COST |
      | 1 | 061224/001 |     06/12/2024 |               1A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      884.62 |
      | 2 | 061224/002 |     06/12/2024 |               1B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      232.54 |
      | 3 | 061224/003 |     06/12/2024 |               2A | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      995.74 |
      | 4 | 061224/004 |     06/12/2024 |               2B | CP18         |          06/12/2024 | Y           | C1013          |                        1 |      397.15 |
    Then user should see the outcome results page
    And problem outcomes should equal 4
    And the following errors:
      | Matter Type / Stage Reached | Error Type      | Description                                                                                                               |
      | YOUK                        | LAR Validation8 | The fee you have entered is not valid for Category 1A / YOUK matters. Please enter a valid fee in the profit costs field. |
      | YOUK                        | LAR Validation8 | The fee you have entered is not valid for Category 1B / YOUK matters. Please enter a valid fee in the profit costs field. |
      | YOUK                        | LAR Validation8 | The fee you have entered is not valid for Category 2A / YOUK matters. Please enter a valid fee in the profit costs field. |
      | YOUK                        | LAR Validation8 | The fee you have entered is not valid for Category 2B / YOUK matters. Please enter a valid fee in the profit costs field. |

  @manual_submission
  Scenario: Manually enter YOUK outcomes , check for DSCC format validation
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id | dscc_number |
      | YOUK        |    06-DEC-2024 |               1A |           0 | 061224/001 |         05-DEC-2024 | C1013          | 1234567 |           1 |
    Then the outcome does not save and gives an error containing:
      """
      The Representation Order Date must be before the case concluded date. Please enter a valid value.
      The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field.
      """

  @manual_submission
  Scenario: Manually enter YOUK outcomes , check for case concluded date earlier to start date
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id | dscc_number |
      | YOUK        |     06-12-2024 |               1A |           0 | 061224/001 |         05-DEC-2024 | C1013          | 1234567 |  201012345A |
    Then the outcome does not save and gives an error containing:
      """
      Case Concluded Date is before Case Start Date
      The Representation Order Date must be before the case concluded date. Please enter a valid value.
      """

  @manual_submission
  Scenario: Manually enter YOUK outcomes and test some drop down lists are correct
    Given user is on their "CRIME LOWER" submission details page
    When user enters an outcome for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type |
      | YOUK        |
    Then the drop down list "outcome_code" contains the following values after selecting "1-Offences against the person" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "2-Homicide and related grave offences" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "3-Sexual offences and associated offences against children" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "4-Robbery" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "5-Burglary" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "6-Criminal damage" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "7-Theft (including taking vehicle without consent)" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "8-Fraud and forgery and other offences of dishonesty not otherwise categorised" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "9-Public order offences" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "10-Drug offences" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "11-Driving and motor vehicle offences (other than those covered by codes 1, 6 & 7)" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "12-Other offences" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "13-Terrorism" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "14-Anti-social behaviour orders" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "15-Sexual offender orders" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
    Then the drop down list "outcome_code" contains the following values after selecting "16-Other prescribed proceedings" in the "crime_matter_type" drop down list:
      | CP01-Arrest warrant issued/adjourned indefinitely                                     |
      | CP02-Change of solicitor                                                              |
      | CP03-Representation order withdrawn                                                   |
      | CP04-Trial: acquitted                                                                 |
      | CP05-Trial: mixed verdicts                                                            |
      | CP06 -Trial: convicted                                                                |
      | CP07-Discontinued (before any pleas entered)                                          |
      | CP08-Discontinued (after pleas entered)                                               |
      | CP09-Guilty plea to all charges put not listed for trial                              |
      | CP10-Guilty plea to all charges put after case listed for trial                       |
      | CP11-Guilty plea to substitute charges put after case listed for trial                |
      | CP12 -Mix of guilty plea(s) and discontinuance Not listed for trial                   |
      | CP13-Mix of guilty plea(s) and discontinuance listed for trial                        |
      | CP16-Committal: discharged                                                            |
      | CP17-Extradition                                                                      |
      | CP18-Case remitted from Crown to magistrates court for sentencing                     |
      | CP20-Granted anti-social behaviour order / sexual offences order / other order        |
      | CP21-Part-granted anti-social behaviour order/ sexual offences order / other order    |
      | CP22-Refused anti-social behaviour order/ sexual offences order / other order         |
      | CP23-Varied anti-social behaviour order/ sexual offences order / other order          |
      | CP24-Discharged anti-social behaviour order/ sexual offences order / other order      |
      | CP25-Committal: election (Representation order dated before 6th April 2010)           |
      | CP26-Committal/transfer: direction (Representation order dated before 6th April 2010) |
