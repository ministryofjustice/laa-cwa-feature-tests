Feature: Check Child Migrant Validation for Immigration

  In order to submit child migrant claims
  As a provider
  I want to use the new child migrant code

  @delete_outcome_after @manual_submission @immot @valid
  Scenario Outline: Add child migrant Immigration (non-Asylum) claims
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: All Immigration (IMMOT) MT1/MT2 codes can be used with the new child migrant code
      Immigration claims do not require an ECF Ref when submitted as a child migrant case

      | case id | mt        | ecs code | ecf ref | case start date | pa      | ap      |
      | 312     | IMXL:IRVL | CM001    |         | 01/11/19        | PA00140 | AP00198 |
      | 313     | IMLB:ICZN | CM001    |         | 01/11/19        | PA00140 | AP00198 |
      | 314     | IMXC:IREM | CM001    |         | 01/11/19        | PA00140 | AP00198 |

  @delete_outcome_after @manual_submission @immot @invalid
  Scenario Outline: Reject invalid child migrant Immigration (non-Asylum) claims
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the error message "<error message>" appears

    Examples:
      Immigration claims must NOT have an ECF Ref or ECF Matter pa/ap when submitted as a child migrant case
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                          |
      | 315     | IMXL:IRVL | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 316     | IMXL:IRVL | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 317     | IMXL:IRVL | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |
      | 321     | IMXC:IREM | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 322     | IMXC:IREM | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 323     | IMXC:IREM | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |
      | 318     | IMLB:IDOM | CM001    |           | 01/11/19        | PA00140 | AP00198 | TODO: <Add message to restrict use of CM001 here>      |
