Feature: Validation for Immigration and Asylum claims

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  @delete_outcome_after @manual_submission @valid @irc
  Scenario Outline: Add valid Immigration and Asylum claims using Derwentside IRC for PA/AP
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | procurement_area | access_point | irc_surgery ||
      |     001 | IAXL:IDAS   |        01/11/19 | PA00188          | AP00186      | No          ||
      |     002 | IAXL:IDAS   |        01/11/19 | PA00188          | AP00187      | No          ||
      |     002 | IAXL:IDAS   |        01/11/19 | PA00188          | AP00187      | Yes         ||
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @valid @idif
  Scenario Outline: Add valid asylum claim for code combination IAXL:IDIF.
    Case start date has to be on or after 25th April 2022.
    Valid outcome codes are: -- IG, IH, IU, IW, IY, IZ

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | work_concluded_date |
      |     001 | IAXL:IDIF   |        25/04/22 | --           |            26/04/22 |
      |     002 | IAXL:IDIF   |        25/04/22 | IG           |            26/04/22 |
      |     003 | IAXL:IDIF   |        25/04/22 | IH           |            26/04/22 |
      |     004 | IAXL:IDIF   |        25/04/22 | IU           |            26/04/22 |
      |     005 | IAXL:IDIF   |        25/04/22 | IW           |            26/04/22 |
      |     006 | IAXL:IDIF   |        25/04/22 | IY           |            26/04/22 |
      |     007 | IAXL:IDIF   |        25/04/22 | IZ           |            26/04/22 |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @valid @NRMadvice
  Scenario Outline: NRM advice option for Immigration and Asylum cases, valid options 'yes' 'no' and 'null'
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | work_concluded_date | nrm_advice |
      |     001 | IAXL:IBAI   |        25/04/22 | --           |            26/04/22 | Yes        |
      |     002 | IAXL:IDIF   |        25/04/22 | --           |            26/04/22 | No         |
      |     003 | IMXL:IBAI   |        25/04/22 | --           |            26/04/22 |            |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @valid @idif
  Scenario Outline: Add valid asylum claim for code combination IAXL:IDIF.
    Case start date has to be on or after 25th April 2022.
    Valid ECS codes <blank> and TR001

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | exemption_criteria_satisfied | excl_case_funding_ref | procurement_area | access_point | work_concluded_date |
      |     008 | IAXL:IDIF   |        25/04/22 | --           | TR001                        |                       | PA00137          | AP00153      |            26/04/22 |
      |     009 | IAXL:IDIF   |        25/04/22 | --           |                              |                       | PA00137          | AP00153      |            26/04/22 |
      |     010 | IAXL:IDIF   |        25/04/22 | --           | LE001                        |             1234567AA | PA20000          | AP20000      |            26/04/22 |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @invalid @idif
  Scenario Outline: Reject invalid Asylum claims for IAXL:IDIF
                  Outcomes with Case Start Date prior to 25th April 2022 are invalid.

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | work_concluded_date |
      |     001 | IAXL:IDIF   |        24/04/22 | --           | PA00137          | AP00153      |            26/04/22 |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  @delete_outcome_after @manual_submission @invalid @idif
  Scenario Outline: Reject invalid Asylum claims for IAXL:IDIF
    The following outcome codes are invalid: IA IB IC ID IE IF IV IX

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | work_concluded_date |
      |     001 | IAXL:IDIF   |        25/04/22 | IA           | PA00137          | AP00153      |            26/04/22 |
    Then the outcome does not save and gives an error containing:
      """
      The reporting code combination that has been used is not valid. Please amend accordingly.
      """

  @delete_outcome_after @manual_submission @invalid @idif
  Scenario Outline: Reject invalid Asylum claims.
    For code combination IAXL:IDIF, the following ECS code is invalid: CM001

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | exemption_criteria_satisfied | work_concluded_date |
      |     001 | IAXL:IDIF   |        25/04/22 | --           | PA00137          | AP00153      | CM001                        |            26/04/22 |
    Then the outcome does not save and gives an error containing:
      """
      The Exemption Criteria Satisfied code is not valid for this matter type combination.
      """

  @delete_outcome_after @manual_submission @valid @idif
  Scenario Outline: Work Concluded Date must be after Case Start Date
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | work_concluded_date |
      |     001 | IAXL:IDIF   |        25/04/22 | IZ           | PA00137          | AP00153      |            26/04/22 |
    Then the outcome saves successfully

  @delete_outcome_after @manual_submission @invalid @idif
  Scenario Outline: Work Concluded Date must be after Case Start Date, if it is before
                  Case Start Date then an error is given

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code | procurement_area | access_point | work_concluded_date |
      |     001 | IAXL:IDIF   |        25/04/22 | IZ           | PA00137          | AP00153      |            24/04/22 |
    Then the outcome does not save and gives an error containing:
      """
      Case Concluded Date is before Case Start Date
      """
