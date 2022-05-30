Feature: Check Child Migrant Validation for Immigration

  In order to submit child migrant claims
  As a provider
  I want to use the new child migrant code

  @delete_outcome_after @bulkload @immas @valid
  Scenario: Bulk load valid file for IMMAS combinations
    The xml file contains all combinations in the Immigration & Asylum category of law

    Given a test firm user is logged in CWA
    When user bulk loads "child_migrant_immas.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 57
    And there should be no problem outcomes

  @delete_outcome_after @bulkload @immot @valid
  Scenario: Bulk load valid file for IMMOT combinations
    The xml file contains all combinations in the Immigration (non-Asylum) category of law

    Given a test firm user is logged in CWA
    When user bulk loads "child_migrant_immot.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 58
    And there should be no problem outcomes

  @delete_outcome_after @manual_submission @immas @valid
  Scenario Outline: Add child migrant Asylum claims
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: All Immigration and Asylum (IMMAS) MT1/MT2 codes can be used with the new child migrant code
      Immigration and Asylum claims do not require an ECF Ref when submitted as a child migrant case

      | case id | mt        | ecs code | ecf ref | case start date | pa      | ap      |
      | 300     | IACA:IFRA | CM001    |         | 01/11/19        | PA00140 | AP00198 |
      | 301     | IAXL:IOUT | CM001    |         | 01/11/19        | PA00140 | AP00198 |
      | 302     | IACA:IASY | CM001    |         | 01/11/19        | PA00140 | AP00198 |

  @delete_outcome_after @manual_submission @immas @invalid
  Scenario Outline: Reject invalid child migrant Asylum claims
    Given user is on their "LEGAL HELP" submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the error message "<error message>" appears

    Examples:
      Asylum claims must NOT have an ECF Ref or ECF Matter pa/ap when submitted as a child migrant case
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                          |
      | 303     | IACA:IFRA | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 304     | IACA:IFRA | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 305     | IACA:IFRA | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |
      | 306     | IAXL:IOUT | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 307     | IAXL:IOUT | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 308     | IAXL:IOUT | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |
      | 309     | IACA:IASY | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 310     | IACA:IASY | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 311     | IACA:IASY | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |

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
      | 318     | IMLB:ICZN | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 319     | IMLB:ICZN | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 320     | IMLB:ICZN | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |
      | 321     | IMXC:IREM | CM001    | 1234567AB | 01/11/19        | PA20000 | AP20000 | An Exceptional Case Funding Reference is not required. |
      | 322     | IMXC:IREM | CM001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | An Exceptional Case Funding Reference is not required. |
      | 323     | IMXC:IREM | CM001    |           | 01/11/19        | PA20000 | AP20000 | Invalid Procurement Area and Access Point.             |
