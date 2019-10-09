Feature: Check ECF Validation for Education claims

  #pa = procurement_area
  #ap = access_point
  #ecf_ref = exceptional_case_funding_reference

  Background: On the outcome screen enter an Education claim

  Whenever a provider submits an Education claim some matter type codes
  are only valid if there is also an exceptional case funding reference.
  This validaton is date dependent and based on the case start date.
  If the claim is an ECF Matter then the provider must also use the
  Procurement Area code PA20000 and Access Point code AP20000.  These
  are special PA/AP codes set up for use when an ECF Ref is given.

  Given user is on their submission details page

  @delete_outcome_after
  Scenario Outline: Add a valid outcome for Education where case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: No ECF validation after 01-Sep-2019
    Some Education matter type codes no longer require an ECF reference

    |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    |	ESEN:ENUR	|		|	01/09/19	|	PA00181	|	AP00000	|
    |	EDDA:EDSC	|		|	01/09/19	|	PA00180	|	AP00000	|
    |	EEQU:EPRU	|		|	01/09/19	|	PA00179	|	AP00000	|
    |	EDJR:ECOL	|		|	01/09/19	|	PA00182	|	AP00000	|

  @delete_outcome_after
  Scenario Outline: Add a valid outcome for Education where case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: Still ECF validation after 01-Sep-2019
    Claims are valid if these Education matter types have an ECF reference

    |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    |	ESEN:EUNI	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    |	EDDA:EAAP	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    |	EEQU:ELOC	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    |	EDJR:EIAP	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|

  @delete_outcome_after
  Scenario Outline: Add an invalid outcome for Education where case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """

    Examples: Still ECF validation after 01-Sep-2019
    Claims are invalid if these Education matter types have no ECF reference

    |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    |	ESEN:EDSC	|		|	01/09/19	|	PA20000	|	AP20000	|
    |	EDDA:EPRU	|		|	01/09/19	|	PA20000	|	AP20000	|
    |	EEQU:ECOL	|		|	01/09/19	|	PA20000	|	AP20000	|
    |	EDJR:EUNI	|		|	01/09/19	|	PA20000	|	AP20000	|

  @delete_outcome_after
  Scenario Outline: Add a valid outcome for Education where case start date between '01-APR-2013' and '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: ECF validation before 01-Sep-2019 mandatory for all Education claims
    Claims are valid if these Education matter types have an ECF reference

    |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    |	ESEN:EPRU	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EDDA:EPRU	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EEQU:ECOL	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EDJR:ECOL	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	ENEG:EUNI	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EXCE:EUNI	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EDOT:EAAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EADM:EAAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EGTO:ELOC	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EPRO:ELOC	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EREO:EIAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|

  @delete_outcome_after
  Scenario Outline: Add an invalid outcome for Education where case start date between '01-APR-2013' and '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """

    Examples: ECF validation before 01-Sep-2019 mandatory for all Education claims
    Claims are invalid if these Education matter types have no ECF reference
    |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    |	ESEN:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EDDA:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EEQU:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EDJR:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	ENEG:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EXCE:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EDOT:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EADM:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EGTO:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EPRO:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    |	EREO:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
