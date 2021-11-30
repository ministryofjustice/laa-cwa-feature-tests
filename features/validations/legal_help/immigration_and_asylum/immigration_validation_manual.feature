Feature: Validation for Immigration claims

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Immigration claims
        Given user is on their submission details page
        When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome does not save and the error message "<error message>" appears
        Examples:
            | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                                                                                                                                                                          |
            | 701     | IMLB:IOUT |          | 1234567AB | 01/11/19        | PA00136 | AP00137 | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000).                                      |
            | 702     | IMLB:IOUT |          |           | 01/11/19        | PA00136 | AP00137 | The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details. |
            | 703     | IMLB:IOUT |          |           | 01/11/19        | PA20000 | AP20000 | The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details. |
            | 704     | IMLB:IOUT | CM001    | 1234567AB | 01/11/19        | PA00136 | AP00137 | An Exceptional Case Funding Reference is not required.                                                                                                                                                                                                 |
            | 705     | IMLB:IOUT | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required.                                                                                                                                                                                                 |
            | 706     | IMLB:IOUT | CM001    |           | 01/11/19        | PA20000 | AP20000 | The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.                                                                                             |
            | 707     | IMLB:IOUT | LE001    | 1234567AB | 01/11/19        | PA00136 | AP00137 | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000).                                      |
            | 708     | IMLB:IOUT | LE001    |           | 01/11/19        | PA00136 | AP00137 | An Exceptional Case Funding Reference is required.                                                                                                                                                                                                     |
            | 709     | IMLB:IOUT | LE001    |           | 01/11/19        | PA20000 | AP20000 | The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.                                                                                             |
            | 710     | IMLB:IOUT | TR001    | 1234567AB | 01/11/19        | PA00136 | AP00137 | For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.                                                                                                                                        |
            | 711     | IMLB:IOUT | TR001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.                                                                                                                                        |
            | 712     | IMLB:IOUT | TR001    |           | 01/11/19        | PA20000 | AP20000 | The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.                                                                                             |

    @delete_outcome_after @manual_submission @invalid @irc
    Scenario Outline: Add invalid Immigration claims using IRC
        Given user is on their submission details page
        When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome does not save and the error message "<error message>" appears
        Examples:
            | case id | mt        | ecs code | ecf ref  | case start date | pa      | ap      | error message                                                                                       |
            | 718     | IMXL:IIRC |          |          | 01/11/19        | PA00188 | AP00186 | Access Point - Value AP00186 for the flexfield segment Access Point does not exist in the value set |

    @delete_outcome_after @manual_submission @valid
    Scenario Outline: Add valid Immigration claims
        Given user is on their submission details page
        When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome saves successfully
        Examples:
            | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      |
            | 713     | IMLB:IOUT |          | 1234567AB | 01/11/19        | PA20000 | AP20000 |
            | 714     | IMLB:IOUT | CM001    |           | 01/11/19        | PA00136 | AP00137 |
            | 715     | IMLB:IOUT | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |
            | 716     | IMLB:IOUT | TR001    |           | 01/11/19        | PA00136 | AP00137 |

    @delete_outcome_after @manual_submission @valid @irc
    Scenario Outline: Add valid Immigration claims using IRC
        Given user is on their submission details page
        When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome saves successfully
        Examples:
            | case id | mt        | ecs code | ecf ref  | case start date | pa      | ap      |
            | 717     | IMXL:IIRC |          |          | 01/11/19        | PA00188 | AP00187 |

    @delete_outcome_after @manual_submission @valid @IMXLICZN
    Scenario Outline: Add valid Immigration claims
        Given user is on their submission details page
        When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
        Then the outcome saves successfully
        Examples:
            | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      |
            | 714     | IMXL:ICZN | CM001    |           | 01/11/19        | PA00136 | AP00137 |
