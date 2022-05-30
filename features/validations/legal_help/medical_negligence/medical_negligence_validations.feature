Feature: Validation for Medical Negligence claims

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        Given user is on their "LEGAL HELP" submission details page
        When user adds an outcome for Medical Negligence with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome does not save and the error message "<error message>" appears
        Examples:
            | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                                                                                                                                                                          |
            | 601     | NBTH:NNHN |          | 1234567AB | 01/11/19        | PA00167 | AP00000 | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000).                                      |
            | 602     | NBTH:NNHN |          |           | 01/11/19        | PA00167 | AP00000 | The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details. |
            | 603     | NBTH:NNHN |          |           | 01/11/19        | PA20000 | AP20000 | The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details. |
            | 604     | NBTH:NNHN | CN001    | 1234567AB | 01/11/19        | PA00167 | AP00000 | For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.                                                                                                                                        |
            | 605     | NBTH:NNHN | CN001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.                                                                                                                                        |
            | 606     | NBTH:NNHN | CN001    |           | 01/11/19        | PA20000 | AP20000 | The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.                                                                                             |

    @delete_outcome_after @manual_submission @valid
    Scenario Outline: Add valid Medical Negligence claims
        Given user is on their "LEGAL HELP" submission details page
        When user adds an outcome for Medical Negligence with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome saves successfully
        Examples:
            | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      |
            | 607     | NBTH:NNHN |          | 1234567AB | 01/11/19        | PA20000 | AP20000 |
            | 608     | NBTH:NNHN | CN001    |           | 01/11/19        | PA00167 | AP00000 |
