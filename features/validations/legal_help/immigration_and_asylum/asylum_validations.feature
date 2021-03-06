Feature: Asylum Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"

  Scenario: Bulkload Civil Asylum outcomes with CASE_START_DATE around 1 April 2013
    The following Matter Types are valid only from 01/04/2013.
    Given the following Matter Types are chosen:
      | IACC:IASY |
      | IACC:IFRA |
      | IACC:IFST |
      | IACC:IIRC |
      | IACC:ILEA |
      | IACC:IOTH |
      | IACC:IOUT |
      | IACC:IRVL |
      | IACD:IASY |
      | IACD:IFRA |
      | IACD:IFST |
      | IACD:IIRC |
      | IACD:ILEA |
      | IACD:IOTH |
      | IACD:IOUT |
      | IACD:IRVL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE |
      | 1 | 01/04/2013      |
      | 2 | 31/03/2013      |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE          |
      | 1 | <none>                         |
      | 2 | XXLSC_AM_LAR2_PRIOR_SR_REQ_MSG |

  Scenario: Bulkload Civil Asylum outcomes with CASE_START_DATE around 25 October 2019
    The following Matter Types can be used from 25/10/2019.
    Even if the trafficking criteria exemption code applies, these combinations should not be valid.
    Given the following Matter Types are chosen:
      | IACC:IGOL |
      | IACD:IGOL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 25/10/2019      | <blank>                      |
      | 2 | 24/10/2019      | <blank>                      |
      | 3 | 01/04/2013      | TR001                        |
      | 4 | 25/10/2019      | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                |
      | 1 | <none>                                                                               |
      | 2 | XXLSC_AM_PRE_LAR2_COMB_MSG                                                           |
      | 3 | XXLSC_AM_PRE_LAR2_COMB_MSG                                                           |
      | 4 | The Exemption Criteria Satisfied code is not valid for this matter type combination. |

  Scenario: Bulkload Civil Asylum outcomes with EXEMPTION_CRITERIA_SATISFIED: TR001
    The following Matter Types can be used with the trafficking criteria exemption code.
    Given the following Matter Types are chosen:
      | IACC:IASY |
      | IACC:IFRA |
      | IACC:IFST |
      | IACC:IIRC |
      | IACC:ILEA |
      | IACC:IOTH |
      | IACC:IOUT |
      | IACC:IRVL |
      | IACD:IASY |
      | IACD:IFRA |
      | IACD:IFST |
      | IACD:IIRC |
      | IACD:ILEA |
      | IACD:IOTH |
      | IACD:IOUT |
      | IACD:IRVL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2013      | TR001                        |
      | 2 | 01/04/2013      | <blank>                      |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Bulkload Civil Asylum outcomes with EXEMPTION_CRITERIA_SATISFIED: LE001
    The following Matter Types can be used with the care leavers exemption code.
    Please note that an ECF number must be provided for the claim to be valid.
    Given the following Matter Types are chosen:
      | IACC:IASY |
      | IACC:IFRA |
      | IACC:IFST |
      | IACC:IIRC |
      | IACC:ILEA |
      | IACC:IOTH |
      | IACC:IOUT |
      | IACC:IRVL |
      | IACD:IASY |
      | IACD:IFRA |
      | IACD:IFST |
      | IACD:IIRC |
      | IACD:ILEA |
      | IACD:IOTH |
      | IACD:IOUT |
      | IACD:IRVL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2013      | PA20000          | AP20000      | LE001                        | 1234567AB             |
      | 2 | 01/04/2013      | PA20000          | AP20000      | LE001                        | <none>                |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE        |
      | 1 | <none>                       |
      | 2 | XXLSC_AM_LAR2_ECF_FORMAT_MSG |

  Scenario: Bulkload Civil Asylum outcomes with EXCL_CASE_FUNDING_REF
    The following Matter Types can be brought earlier into scope if an ECF number is provided.
    If the case start date is 1 April 2013, a ECF number must be provided.
    Please note: IAC[C-D]:IGOL cannot be used before 25 October 2019
    Given the following Matter Types are chosen:
      | IACC:IGOL |
      | IACD:IGOL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 | 25/10/2019      | PA20000          | AP20000      | 1234567AB             |
      | 2 | 25/10/2019      | <default>        | <default>    | <blank>               |
      | 3 | 01/04/2013      | <default>        | <default>    | <blank>               |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE      |
      | 1 | <none>                     |
      | 2 | <none>                     |
      | 3 | XXLSC_AM_PRE_LAR2_COMB_MSG |

  Scenario: Bulkload Civil Asylum outcomes with CLAIM_TYPE: Stage Disbursment Claim
    Given the following Matter Types are chosen:
      | IACC:IASY |
      | IACC:IFRA |
      | IACC:IFST |
      | IACC:IIRC |
      | IACC:ILEA |
      | IACC:IOTH |
      | IACC:IOUT |
      | IACC:IRVL |
      | IACC:IGOL |
      | IACD:IASY |
      | IACD:IFRA |
      | IACD:IFST |
      | IACD:IIRC |
      | IACD:ILEA |
      | IACD:IOTH |
      | IACD:IOUT |
      | IACD:IRVL |
      | IACD:IGOL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | OUTCOME_CODE |
      | 1 | 25/10/2019      | DC         | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
