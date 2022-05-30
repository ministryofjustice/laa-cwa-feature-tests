Feature: Validation for Family claims

  @delete_outcome_after @manual_submission @invalid
  Scenario Outline: Reject invalid Family claims
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Family with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the error message "<error message>" appears
    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                                                                                                                                                                          |
      | 501     | FAMA:FPET |          | 1234567AB | 01/11/19        | PA00010 | AP00000 | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000).                                      |
      | 502     | FAMA:FPET |          |           | 01/11/19        | PA00010 | AP00000 | The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details. |
      | 503     | FAMA:FPET |          |           | 01/11/19        | PA20000 | AP20000 | The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details. |
      | 504     | FAMA:FPET | DV008    | 1234567AB | 01/11/19        | PA00010 | AP00000 | For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.                                                                                                                                        |
      | 505     | FAMA:FPET | DV008    | 1234567AB | 01/11/19        | PA20000 | AP20000 | For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.                                                                                                                                        |
      | 506     | FAMA:FPET | DV008    |           | 01/11/19        | PA20000 | AP20000 | The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.                                                                                             |

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid Family claims
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Family with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      |
      | 507     | FAMA:FPET |          | 1234567AB | 01/11/19        | PA20000 | AP20000 |
      | 508     | FAMA:FPET | DV008    |           | 01/11/19        | PA00010 | AP00000 |
