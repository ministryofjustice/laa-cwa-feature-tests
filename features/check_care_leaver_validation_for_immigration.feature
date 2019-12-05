Feature: Check Care Leaver Validation for Immigration claims

  In order to submit care leaver claims
  As a provider
  I want to use the new care leaver code with an ecf reference

  @delete_outcome_after @bulkload @immas
  Scenario: Bulk load valid file for Asylum
    Given a test firm user is logged in CWA
    When user bulk loads "o_sfs_immas_stage1_lh.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 24
    And there should be no problem outcomes

  @delete_outcome_after @bulkload @immot
  Scenario: Bulk load valid file for Immigration (non-Asylum)
    Given a test firm user is logged in CWA
    When user bulk loads "o_sfs_immot_stage1_lh.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 24
    And there should be no problem outcomes

  @delete_outcome_after @manual_submission @immot @invalid
  Scenario Outline: Reject invalid care leaver Immigration (non-Asylum) claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the error message "<error message>" appears
    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                             |
      | 401     | IMXL:IRVL | LE001    |           | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 402     | IMXL:IRVL | LE001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to poulate the PA/AP fields with ECF Matter (PA20000/AP20000). |
      | 403     | IMXL:IRVL | LE001    |           | 01/11/19        | PA20000 | AP20000 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 404     | IMLB:ICZN | LE001    |           | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 405     | IMLB:ICZN | LE001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to poulate the PA/AP fields with ECF Matter (PA20000/AP20000). |
      | 406     | IMLB:ICZN | LE001    |           | 01/11/19        | PA20000 | AP20000 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 407     | IMXC:IREM | LE001    |           | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 408     | IMXC:IREM | LE001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to poulate the PA/AP fields with ECF Matter (PA20000/AP20000). |
      | 409     | IMXC:IREM | LE001    |           | 01/11/19        | PA20000 | AP20000 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |

  @delete_outcome_after @manual_submission @immot @valid
  Scenario Outline: Add valid care leaver Immigration (non-Asylum) claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      |
      | 410     | IMXL:IRVL | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |
      | 411     | IMLB:ICZN | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |
      | 412     | IMXC:IREM | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |

  @delete_outcome_after @manual_submission @immas @invalid
  Scenario Outline: Reject invalid care leaver Asylum claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the error message "<error message>" appears
    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                             |
      | 413     | IACA:IFRA | LE001    |           | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 414     | IACA:IFRA | LE001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to poulate the PA/AP fields with ECF Matter (PA20000/AP20000). |
      | 415     | IACA:IFRA | LE001    |           | 01/11/19        | PA20000 | AP20000 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 416     | IAXL:IOUT | LE001    |           | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 417     | IAXL:IOUT | LE001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to poulate the PA/AP fields with ECF Matter (PA20000/AP20000). |
      | 418     | IAXL:IOUT | LE001    |           | 01/11/19        | PA20000 | AP20000 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 419     | IACA:IASY | LE001    |           | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |
      | 420     | IACA:IASY | LE001    | 1234567AB | 01/11/19        | PA00140 | AP00198 | For the case being reported it's necessary to poulate the PA/AP fields with ECF Matter (PA20000/AP20000). |
      | 421     | IACA:IASY | LE001    |           | 01/11/19        | PA20000 | AP20000 | For the case being reported it's necessary to record an Exceptional Case Reference.                       |

  @delete_outcome_after @manual_submission @immas @valid
  Scenario Outline: Add valid care leaver Asylum claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      |
      | 422     | IACA:IFRA | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |
      | 423     | IAXL:IOUT | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |
      | 424     | IACA:IASY | LE001    | 1234567AB | 01/11/19        | PA20000 | AP20000 |
