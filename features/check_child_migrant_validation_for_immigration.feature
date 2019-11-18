Feature: Check Child Migrant Validation for Immigration

  In order to submit child migrant claims
  As a provider
  I want to use the new child migrant code

  @delete_outcome_after @bulkload
  Scenario: Bulk load valid file for IMMAS combinations
    The xml file contains all combinations in the Immigration & Asylum category of law

    Given a test firm user is logged in CWA
    When user bulk loads "child_migrant_immas.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 87
    And there should be no problem outcomes

  @delete_outcome_after @bulkload
  Scenario: Bulk load valid file for IMMOT combinations
    The xml file contains all combinations in the Immigration (non-Asylum) category of law

    Given a test firm user is logged in CWA
    When user bulk loads "child_migrant_immot.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 90
    And there should be no problem outcomes

  @delete_outcome_after @manual_submission
  Scenario Outline: Add child migrant Immigration and Asylum claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "ecf ref", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: All Immigration and Asylum (IMMAS) MT1/MT2 codes can be used with the new child migrant code
    Immigration and Asylum claims do not require an ECF Ref when submitted as a child migrant case

			| case id | mt | ecs code | ecf ref | case start date | pa | ap |
			| 300 | IAAP:IEAP | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 301 | IAAP:IFRA | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 302 | IAAP:IFST | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 303 | IAAP:IIRC | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 304 | IAAP:IOTH | CM001 |  | 01/11/19 | PA00140 | AP00198 |

  @delete_outcome_after @manual_submission
  Scenario Outline: Add child migrant Immigration (non-Asylum) claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code", "ecf ref", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: All Immigration (IMMOT) MT1/MT2 codes can be used with the new child migrant code
    Immigration claims do not require an ECF Ref when submitted as a child migrant case

			| case id | mt | ecs code | ecf ref | case start date | pa | ap |
			| 400 | IMAP:IEMP | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 401 | IMAP:IEUL | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 402 | IMAP:IFME | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 403 | IMAP:IFVI | CM001 |  | 01/11/19 | PA00140 | AP00198 |
			| 404 | IMAP:IILL | CM001 |  | 01/11/19 | PA00140 | AP00198 |
