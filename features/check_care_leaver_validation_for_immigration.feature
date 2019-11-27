Feature: Check Care Leaver Validation for Immigration claims

  In order to submit care leaver claims
  As a provider
  I want to use the new care leaver code with an ecf reference

  @delete_outcome_after @bulkload
  Scenario: Bulk load valid file for Asylum
    Given a test firm user is logged in CWA
    When user bulk loads "o_sfs_immas_stage1_lh.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 24
    And there should be no problem outcomes

  @delete_outcome_after @bulkload
  Scenario: Bulk load valid file for Immigration (non-Asylum)
    Given a test firm user is logged in CWA
    When user bulk loads "o_sfs_immot_stage1_lh.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 24
    And there should be no problem outcomes

  @delete_outcome_after @manual_submission
  Scenario Outline: Reject invalid care leaver Immigration (non-Asylum) claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and an error message appears
    Examples:
    | case id | mt | ecs code | ecf ref | case start date | pa | ap |
		| 401 | IMLB:ICZN | LE001 |           | 01/11/19 | PA00140 | AP00198 |
		| 402 | IMLB:ICZN | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |
		| 403 | IMLB:ICZN | LE001 |           | 01/11/19 | PA20000 | AP20000 |

  @delete_outcome_after @manual_submission
  Scenario Outline: Add valid care leaver Immigration (non-Asylum) claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    Examples:
    | case id | mt | ecs code | ecf ref | case start date | pa | ap |
    | 404 | IMLB:ICZN | LE001 | 1234567AB | 01/11/19 | PA20000 | AP20000 |

  @delete_outcome_after @manual_submission
  Scenario Outline: Reject invalid care leaver Asylum claims
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and an error message appears
    Examples:
    | case id | mt | ecs code | ecf ref | case start date | pa | ap |
    | 405 | IALB:IFRA | LE001 |           | 01/11/19 | PA00140 | AP00198 |
    | 406 | IALB:IFRA | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |
    | 407 | IALB:IFRA | LE001 |           | 01/11/19 | PA20000 | AP20000 |

  @delete_outcome_after @manual_submission
  Scenario Outline: Add valid care leaver Asylum claims
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and an error message appears
    Examples:
    | case id | mt | ecs code | ecf ref | case start date | pa | ap |
    | 408 | IALB:IFRA | LE001 | 1234567AB | 01/11/19 | PA20000 | AP20000 |
