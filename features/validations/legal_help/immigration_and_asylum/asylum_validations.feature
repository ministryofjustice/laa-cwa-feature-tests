@bulkload
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

      @idif
      Scenario: Bulkload Civil Asylum outcomes for MT combination IAXL:IDIF with
        CASE_START_DATE around 25 April 2022, and a case start date in the future.
        The following Matter Types are valid only from 25/04/2022.
        Given the following Matter Types are chosen:
          | IAXL:IDIF |
        And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | OUTCOME_CODE |
          | 1 | 25/04/2022      | --           |
          | 2 | 24/04/2022      | --           |
          | 3 | 24/04/2042      | --           |
        Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE          |
          | 1 | <none>                         |
          | 2 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 3 | The reporting code combination that has been used is not valid. Please amend accordingly. |

      @idif
      Scenario: Bulkload Civil Asylum outcomes for MT combination IAXL:IDIF with
        a valid CASE_START_DATE of 25 April 2022
        The following outcome codes are valid --, IG, IH, IU, IW, IY, IZ.
        Other outcome codes are not valid.
        Given the following Matter Types are chosen:
          | IAXL:IDIF |
        And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | OUTCOME_CODE |
          | 1 | 25/04/2022      | --           |
          | 2 | 26/04/2022      | IG           |
          | 3 | 26/04/2022      | IH           |
          | 4 | 26/04/2022      | IU           |
          | 5 | 26/04/2022      | IW           |
          | 6 | 26/04/2022      | IY           |
          | 7 | 26/04/2022      | IZ           |
          | 8 | 26/04/2022      | IA           |
          | 9 | 26/04/2022      | IB           |
          | 10 | 26/04/2022     | IC           |
          | 11 | 26/04/2022     | ID           |
          | 12 | 26/04/2022     | IE           |
          | 14 | 26/04/2022     | IF           |
          | 15 | 26/04/2022     | IV           |
          | 16 | 26/04/2022     | IX           |
        Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE          |
          | 1 | <none>                         |
          | 2 | <none>                         |
          | 3 | <none>                         |
          | 4 | <none>                         |
          | 5 | <none>                         |
          | 6 | <none>                         |
          | 7 | <none>                         |
          | 8 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 9 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 10 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 11 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 12 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 14 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 15 | The reporting code combination that has been used is not valid. Please amend accordingly. |
          | 16 | The reporting code combination that has been used is not valid. Please amend accordingly. |

      @idif
      Scenario: Bulkload Civil Asylum outcomes for MT combination IAXL:IDIF with CLAIM_TYPE: Stage Claim
        Given the following Matter Types are chosen:
          | IAXL:IDIF |
        And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | CLAIM_TYPE | OUTCOME_CODE |
          | 1 | 25/04/2022      | SC         | --           |
        Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE |
          | 1 | <none>                |

      @idif
      Scenario: Bulkload Civil Asylum outcomes with EXEMPTION_CRITERIA_SATISFIED: CM001
                For MT combination IAXL:IDIF, ECS code CM001 is not valid, but it can be left blank.
                If ECS code LE001 is used, even though it is not required, then ECF reference is
                required, and PA/AP codes must be PA20000/AP20000
        Given the following Matter Types are chosen:
          | IAXL:IDIF |
        And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED | EXCL_CASE_FUNDING_REF | OUTCOME_CODE |
          | 1 | 25/04/2022      | PA00137          | AP00153      | CM001                        | 1234567AB             | --           |
          | 2 | 25/04/2022      | PA00137          | AP00153      |                              |                       | --           |
          | 3 | 25/04/2022      | PA00137          | AP00153      | TR001                        |                       | --           |
          | 4 | 25/04/2022      | PA20000          | AP20000      | LE001                        | 1234567AA             | --           |
        Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE        |
          | 1 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                     |
          | 2 | <none>                       |
          | 3 | <none>                       |
          | 4 | <none>                       |

      @idif
      Scenario: Bulkload Civil Asylum outcomes with MT combination IAXL:IDIF and Case Concluded Date
                before Case Start Date (invalid), after Case Start Date (valid) and with NULL (invalid)
      Given the following Matter Types are chosen:
          | IAXL:IDIF |
      And the following outcomes are bulkloaded:
          | # | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | OUTCOME_CODE | WORK_CONCLUDED_DATE |
          | 1 | 25/04/2022      | PA00137          | AP00153      | IZ           | 25/05/2022          |
          | 2 | 25/04/2022      | PA00137          | AP00153      | IZ           | 20/04/2022          |
          | 3 | 25/04/2022      | PA00137          | AP00153      | IZ           |                     |
          | 4 | 25/05/2022      | PA00137          | AP00153      | IZ           | 20/05/2022          |
      Then the following results are expected:
          | # | ERROR_CODE_OR_MESSAGE |
          | 1 | <none>                |
          | 2 | The Case Concluded Date entered is not valid - It must be after the Case Start Date/date element of the UFN, not after today and for Civil cases after the clients date of birth |
          | 3 | WORK_CONCLUDED_DATE is missing |
          | 4 | The Case Concluded Date entered is not valid - It must be after the Case Start Date/date element of the UFN, not after today and for Civil cases after the clients date of birth |
