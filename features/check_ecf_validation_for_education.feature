Feature: Check ECF Validation for Education claims

  #pa = procurement_area
  #ap = access_point
  #ecf_ref = exceptional_case_funding_reference

  Background: On the outcome screen enter an Education claim

  Whenever a provider submits an Education claim some matter type codes
  are only valid if there is also an exceptional case funding reference.
  This validaton is date dependent and mostly driven by the case start date.
  If the claim is an ECF Matter then the provider must use the
  Procurement Area code PA20000 and Access Point code AP20000.  These
  are special PA/AP codes set up for use when an ECF Matter is reported.

  Given user is on their submission details page

  Scenario Outline: Add a valid submission for Education where the case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: Submission validation after 01-Sep-2019
    Providers can submit some Education claims without an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 001	| ESEN:ENUR	|		|	01/09/19	|	PA00181	|	AP00000	|
    | 002 |	EDDA:EDSC	|		|	01/09/19	|	PA00180	|	AP00000	|
    |	003 | EEQU:EPRU	|		|	01/09/19	|	PA00179	|	AP00000	|
    |	004 | EDJR:ECOL	|		|	01/09/19	|	PA00182	|	AP00000	|

  Scenario Outline: Add a valid outcome for Education where case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: ECF validation after 01-Sep-2019
    Claims are valid if these Education matter types have an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 005 |	ESEN:EUNI	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 006 |	EDDA:EAAP	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 007 |	EEQU:ELOC	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 008 |	EDJR:EIAP	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|

  Scenario Outline: Add an invalid outcome for Education where case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """

    Examples: ECF validation after 01-Sep-2019
    Claims are invalid if these Education matter types have no ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 009 |	ESEN:EDSC	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 010 |	EDDA:EPRU	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 011 |	EEQU:ECOL	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 012 |	EDJR:EUNI	|		|	01/09/19	|	PA20000	|	AP20000	|

  Scenario Outline: Add a valid outcome for Education where case start date between '01-APR-2013' and '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: ECF validation between 01-Apr-2013 and 01-Sep-2019
    Education claims are valid if these Education matter types have an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 013 |	ESEN:EPRU	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 014 |	EDDA:EPRU	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 015 |	EEQU:ECOL	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 016 |	ENEG:EUNI	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 017 |	EXCE:EUNI	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 018 |	EDOT:EAAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 019 |	EADM:EAAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 020 |	EGTO:ELOC	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 021 |	EPRO:ELOC	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 022 |	EREO:EIAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 023 |	ESEN:EPRU	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 024 |	EDDA:EPRU	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 025 |	EEQU:ECOL	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 027 |	ENEG:EUNI	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 028 |	EXCE:EUNI	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 029 |	EDOT:EAAP	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 030 |	EADM:EAAP	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 031 |	EGTO:ELOC	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 032 |	EPRO:ELOC	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 033 |	EREO:EIAP	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|

  Scenario Outline: Add an invalid outcome for Education where case start date between '01-APR-2013' and '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """

    Examples: ECF validation between 01-Apr-2013 and 01-Sep-2019
    Education claims are invalid if these matter types have no ECF reference
    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 034 |	ESEN:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 035 |	EDDA:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 036 |	EEQU:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 038 |	ENEG:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 039 |	EXCE:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 040 |	EDOT:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 041 |	EADM:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 042 |	EGTO:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 043 |	EPRO:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 044 |	EREO:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 045 |	ESEN:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 046 |	EDDA:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 047 |	EEQU:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 049 |	ENEG:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 050 |	EXCE:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 051 |	EDOT:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 052 |	EADM:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 053 |	EGTO:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 054 |	EPRO:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 055 |	EREO:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|

  Scenario Outline: Ensure the new code EDJR can only be used after 01-SEP-2019
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      Invalid code
      """

    Examples: EDJR validation before 01-SEP-2019
    The EDJR Education Matter Type I Code cannot be used before 01-SEP-2019
    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 056 |	EECJ:ENUR	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 057 |	EDJR:ENUR	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 058 |	EDJR:ENUR	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 059 |	EDJR:ENUR	|		|	01/04/13	|	PA00167	|	AP00000	|
    | 060 |	EDJR:ENUR	|	1234567AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 061 |	EDJR:ENUR	|		|	31/03/13	|	PA00167	|	AP00000	|

  Scenario Outline: Add a valid outcome for Education where case start date before '01-APR-2013'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: ECF validation before 01-Apr-2013
    Education claims before 01-APR-2013 do not require an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 061 |	ESEN:EPRU	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 062 |	EDDA:EPRU	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 063 |	EEQU:ECOL	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 064 |	ENEG:EUNI	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 065 |	EXCE:EUNI	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 066 |	EDOT:EAAP	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 067 |	EADM:EAAP	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 068 |	EGTO:ELOC	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 069 |	EPRO:ELOC	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 070 |	EREO:EIAP	|		|	31/03/13	|	PA00167	|	AP00000	|

  Scenario Outline: Add a valid outcome for Education where case start date before '01-APR-2013'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      This case does not require an ECF reference to be recorded as the case was started prior to 01-APR-2013
      """

    Examples: ECF validation before 01-Apr-2013
    No claims require an ECF Reference if the case start date is before 01-APR-2013

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 071 |	ESEN:EPRU	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 072 |	EDDA:EPRU	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 073 |	EEQU:ECOL	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 074 |	ENEG:EUNI	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 075 |	EXCE:EUNI	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 076 |	EDOT:EAAP	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 077 |	EADM:EAAP	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 078 |	EGTO:ELOC	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 079 |	EPRO:ELOC	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 080 |	EREO:EIAP	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
