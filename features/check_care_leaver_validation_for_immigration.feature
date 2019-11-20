Feature: Check Care Leaver Validation for Immigration claims

  In order to submit care leaver claims
  As a provider
  I want to use the new care leaver code with an ecf reference

  Background: On the outcome screen enter an Immigration claim

  The following Immigration MT1 codes can be used
  with the care leaver exemption criteria satisfied code (i.e. LE001)
  Immigration and Asylym = IALB, IACA, IACB
  Immigration = IMLB, IMCA, IMCB
  These MT1 codes are all priced via Standard Fees.

  @delete_outcome_after @bulkload
  Scenario Outline: Bulk load valid file
    Given a test firm user is logged in CWA
    When user bulk loads "care_leaver_immas.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 87
    And there should be no problem outcomes

  @delete_outcome_after @bulkload
  Scenario Outline: Bulk load valid file
    Given a test firm user is logged in CWA
    When user bulk loads "care_leaver_immot.xml" for the test firm
    Then user should see the bulk load results page
    And successful outcomes should equal 90
    And there should be no problem outcomes

  @delete_outcome_after @manual_submission
  Scenario Outline:  Add care leaver Immigration and Asylum claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    |	 case id 	|	mt	|	 ecs code	|	ecf ref	|	 case start date 	|	 pa 	|	 ap 	|
    |	400	|	IACA:IASY	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	401	|	IACA:IFRA	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	402	|	IACA:IFST	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	404	|	IACA:IIRC	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	405	|	IACA:ILEA	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|

  @delete_outcome_after @manual_submission
  Scenario Outline: The system must reject care leaver Immigration and Asylym claims without an ecf reference
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """
    |	 case id 	|	mt	|	 ecs code 	|	ecf ref	|	 case start date 	|	 pa 	|	 ap 	|
    |	500	|	IACA:IASY	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	501	|	IACA:IFRA	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	502	|	IACA:IFST	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	504	|	IACA:IIRC	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	505	|	IACA:ILEA	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|

  @delete_outcome_after @manual_submission
  Scenario Outline: Add care leaver Immigration (non-Asylum) claims
    Given user is on their submission details page
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
			| case id | mt | ecs code | ecf ref | case start date | pa | ap |
			| 600 | IMCA:ICZN | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |
			| 601 | IMCA:IDOM | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |
			| 602 | IMCA:IEMP | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |
			| 603 | IMCA:IEUL | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |
			| 604 | IMCA:IFME | LE001 | 1234567AB | 01/11/19 | PA00140 | AP00198 |

  @delete_outcome_after
  Scenario Outline: The system must reject a care leaver Immigration claims without an ecf reference
    When user adds an outcome for Immigration with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """
    |	 case id 	|	 mt	|	 ecs code	|	ecf ref	|	 case start date 	|	 pa 	|	 ap 	|
    |	700	|	IMCA:ICZN	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	701	|	IMCA:IDOM	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	702	|	IMCA:IEMP	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	703	|	IMCA:IEUL	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	704	|	IMCA:IFME	|	LE001	|	1234567AB	|	01/11/19	|	 PA00140 	|	 AP00198 	|
