Feature: Check ECF Validation for Education claims

  #pa = procurement_area
  #ap = access_point
  #ecf_ref = exceptional_case_funding_reference
  #case_id = 901-983


  Background: On the outcome screen enter an Education claim

  Whenever a provider submits an Education claim some matter type codes
  are only valid if there is also an exceptional case funding reference.
  This validaton is date dependent and mostly driven by the case start date.
  If the claim is an ECF Matter then the provider must use the
  Procurement Area code PA20000 and Access Point code AP20000.  These
  are special PA/AP codes set up for use when an ECF Matter is reported.

  Given user is on their submission details page

  Scenario Outline: Add a valid submission for Education where the case start date >= '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: Submission validation after 01-Sep-2019
    Providers can submit some Education claims without an ECF reference and some with ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 901	| ESEN:ENUR	|		|	01/09/19	|	PA00181	|	AP00000	|
    | 902 |	EDDA:EDSC	|		|	01/09/19	|	PA00180	|	AP00000	|
    |	903 | EEQU:EPRU	|		|	01/09/19	|	PA00179	|	AP00000	|
    |	904 | EDJR:ECOL	|		|	01/09/19	|	PA00182	|	AP00000	|
    | 905 |	ENEG:EDSC	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 906 |	EXCE:EPRU	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 907 |	EDOT:ECOL	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 908 |	EADM:EUNI	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 909 |	EGTO:EUNI	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 910 |	EPRO:EUNI	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|
    | 911 |	EREO:EUNI	|	1234567AB	|	01/09/19	|	PA20000	|	AP20000	|

  Scenario Outline: Add an invalid outcome for Education where case start date > '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """

    Examples: Submission validation after 01-Sep-2019
    Providers can only submit some Education claims with an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 800 |	ENEG:EDSC	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 801 |	EXCE:EPRU	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 802 |	EDOT:ECOL	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 803 |	EADM:EUNI	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 804 |	EGTO:EUNI	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 805 |	EPRO:EUNI	|		|	01/09/19	|	PA20000	|	AP20000	|
    | 806 |	EREO:EUNI	|		|	01/09/19	|	PA20000	|	AP20000	|

  Scenario Outline: Add a valid outcome for Education where case start date between '01-APR-2013' and '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: ECF validation between 01-Apr-2013 and 01-Sep-2019
    Education claims are valid if these Education matter types have an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 916 |	ESEN:EPRU	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 917 |	EDDA:EPRU	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 918 |	EEQU:ECOL	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 919 |	ENEG:EUNI	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 920 |	EXCE:EUNI	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 921 |	EDOT:EAAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 922 |	EADM:EAAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 923 |	EGTO:ELOC	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 924 |	EPRO:ELOC	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 925 |	EREO:EIAP	|	1234567AB	|	31/08/19	|	PA20000	|	AP20000	|
    | 926 |	ESEN:EPRU	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 927 |	EDDA:EPRU	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 928 |	EEQU:ECOL	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 929 |	ENEG:EUNI	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 930 |	EXCE:EUNI	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 931 |	EDOT:EAAP	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 932 |	EADM:EAAP	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 933 |	EGTO:ELOC	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 934 |	EPRO:ELOC	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|
    | 935 |	EREO:EIAP	|	1234567AB	|	01/04/13	|	PA20000	|	AP20000	|

  Scenario Outline: Add an invalid outcome for Education where case start date between '01-APR-2013' and '01-Sep-2019'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if it is reported with an Exceptional Case Funding reference.
      """

    Examples: ECF validation between 01-Apr-2013 and 01-Sep-2019
    Education claims are invalid if these matter types have no ECF reference
    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 936 |	ESEN:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 937 |	EDDA:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 938 |	EEQU:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 939 |	ENEG:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 940 |	EXCE:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 941 |	EDOT:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 942 |	EADM:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 943 |	EGTO:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 944 |	EPRO:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 945 |	EREO:ENUR	|		|	31/08/19	|	PA20000	|	AP20000	|
    | 946 |	ESEN:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 947 |	EDDA:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 948 |	EEQU:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 949 |	ENEG:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 950 |	EXCE:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 951 |	EDOT:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 952 |	EADM:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 953 |	EGTO:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 954 |	EPRO:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|
    | 955 |	EREO:ENUR	|		|	01/04/13	|	PA20000	|	AP20000	|

  Scenario Outline: Add a valid outcome for Education where case start date before '01-APR-2013'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome saves successfully

    Examples: ECF validation before 01-Apr-2013
    Education claims before 01-APR-2013 do not require an ECF reference

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 962 |	ESEN:EPRU	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 963 |	EDDA:EPRU	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 964 |	ENEG:EUNI	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 965 |	EXCE:EUNI	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 966 |	EDOT:EAAP	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 967 |	EADM:EAAP	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 968 |	EGTO:ELOC	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 969 |	EPRO:ELOC	|		|	31/03/13	|	PA00167	|	AP00000	|
    | 970 |	EREO:EIAP	|		|	31/03/13	|	PA00167	|	AP00000	|

  Scenario Outline: EEQU is not a valid matter type I code for Education where case start date before '01-APR-2013'
  When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
  Then the outcome does not save and gives an error containing:
    """
    The combination of reporting codes that has been reported cannot be used with a case start date that is prior to 01-APR-2013 because one or more element is only active on or after this date.
    """
    Examples: Matter Type I code EEQU cannot be used before 01-Apr-2013

  | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
  | 973 |	EEQU:EPRU	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
  | 974 |	EEQU:EPRU	|		|	31/03/13	|	PA00167	|	AP00000	|

  Scenario Outline: Add an ivalid outcome for Education where case start date before '01-APR-2013'
    When user adds an outcome for Education with "<matter type>", "<ecf ref>", "<case start date>", "<pa>", "<ap>" and "<case id>"
    Then the outcome does not save and gives an error containing:
      """
      This case does not require an ECF reference to be recorded as the case was started prior to 01-APR-2013
      """

    Examples: ECF validation before 01-Apr-2013
    No claims require an ECF Reference if the case start date is before 01-APR-2013

    | case id |	matter type	|	ecf ref |	case start date	|	pa	|	ap |
    | 975 |	ESEN:EPRU	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 976 |	EDDA:EPRU	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 977 |	ENEG:EUNI	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 978 |	EXCE:EUNI	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 979 |	EDOT:EAAP	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 980 |	EADM:EAAP	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 981 |	EGTO:ELOC	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 982 |	EPRO:ELOC	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
    | 983 |	EREO:EIAP	|	12345678AB	|	31/03/13	|	PA20000	|	AP20000	|
