Feature: Immigration Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"

  Scenario: Bulkload Civil Immigration outcomes with CASE_START_DATE around 1 April 2019
    The following Matter Types are valid only from 01/04/2019.
    Given the following Matter Types are chosen:
      | IMCC:IDOM |
      | IMCC:IILL |
      | IMCC:IIRC |
      | IMCC:IOTH |
      | IMCC:IOUT |
      | IMCC:IRVL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2019      | <blank>                      |
      | 2 | 31/03/2019      | <blank>                      |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE      |
      | 1 | <none>                     |
      | 2 | XXLSC_AM_PRE_LAR2_COMB_MSG |

  Scenario: Bulkload Civil Immigration outcomes with CASE_START_DATE around 25 October 2019
    The following Matter Types can be used from 25/10/2019.
    If the trafficking criteria exemption code applies, then the start date is 01/04/2019.
    Given the following Matter Types are chosen:
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:ISTU |
      | IMCC:ITWE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 25/10/2019      | <blank>                      |
      | 2 | 24/10/2019      | <blank>                      |
      | 3 | 01/04/2019      | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE     |
      | 1 | <none>                    |
      | 2 | XXLSC_AM_EXEMPTION_NEEDED |
      | 3 | <none>                    |

  Scenario: Bulkload Civil Immigration outcomes CASE_START_DATE around 25 October 2019 (exceptions)
    Exception: IMCC:IGOL cannot be used before the 25 October 2019.
    Even if the trafficking criteria exemption code applies, this combination should not be valid.
    Given the following Matter Types are chosen:
      | IMCC:IGOL |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 25/10/2019      | <blank>                      |
      | 2 | 24/04/2019      | <blank>                      |
      | 3 | 24/04/2019      | TR001                        |
      | 4 | 25/10/2019      | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE      |
      | 1 | <none>                     |
      | 2 | XXLSC_AM_PRE_LAR2_COMB_MSG |
      | 3 | XXLSC_AM_PRE_LAR2_COMB_MSG |
  # | 4 | UNIMPLEMETED_SHOULD_ERROR  |

  Scenario: Bulkload Civil Asylum outcomes with EXEMPTION_CRITERIA_SATISFIED: TR001
    The following Matter Types can be used with the trafficking criteria exemption code.
    Given the following Matter Types are chosen:
      | IMCC:IDOM |
      | IMCC:IILL |
      | IMCC:IIRC |
      | IMCC:IOTH |
      | IMCC:IOUT |
      | IMCC:IRVL |
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:ISTU |
      | IMCC:ITWE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | 01/04/2019      | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Bulkload Civil Immigration outcomes with EXEMPTION_CRITERIA_SATISFIED: LE001
    The following Matter Types can be used with the care leavers exemption code.
    Please note that an ECF number must be provided for the claim to be valid.
    Given the following Matter Types are chosen:
      | IMCC:IDOM |
      | IMCC:IILL |
      | IMCC:IIRC |
      | IMCC:IOTH |
      | IMCC:IOUT |
      | IMCC:IRVL |
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:ISTU |
      | IMCC:ITWE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXEMPTION_CRITERIA_SATISFIED | EXCL_CASE_FUNDING_REF |
      | 1 | 01/04/2019      | PA20000          | AP20000      | LE001                        | 1234567AB             |
      | 2 | 01/04/2019      | PA20000          | AP20000      | LE001                        | <none>                |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE        |
      | 1 | <none>                       |
      | 2 | XXLSC_AM_LAR2_ECF_FORMAT_MSG |

  Scenario: Bulkload Civil Immigration outcomes with EXCL_CASE_FUNDING_REF
    The following Matter Types can be brought earlier into scope if an ECF number is provided.
    If the case start date is 1 April 2019, a ECF number must be provided.
    Given the following Matter Types are chosen:
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:ISTU |
      | IMCC:ITWE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 | 25/10/2019      | PA20000          | AP20000      | 1234567AB             |
      | 2 | 25/10/2019      | <default>        | <default>    | <blank>               |
      | 3 | 01/04/2019      | PA20000          | AP20000      | <blank>               |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE     |
      | 1 | <none>                    |
      | 2 | <none>                    |
      | 3 | XXLSC_AM_EXEMPTION_NEEDED |

  Scenario: Bulkload Civil Immigration outcomes with CLAIM_TYPE: Stage Disbursment Claim
    The following Matter Types allow stage disbursment claims.
    Please note that the Outcome Code has to be '--' in this case.
    Given the following Matter Types are chosen:
      | IMCC:IDOM |
      | IMCC:IILL |
      | IMCC:IIRC |
      | IMCC:IOTH |
      | IMCC:IOUT |
      | IMCC:IRVL |
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:IGOL |
      | IMCC:ISTU |
      | IMCC:ITWE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLAIM_TYPE | OUTCOME_CODE |
      | 1 | 25/10/2019      | DC         | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |

  Scenario: Bulkoad Civil Immigration outcomes with CLAIM_TYPE: Stage Disbursment Claim and WORK_CONCLUDED_DATE
    The 3 month Stage Billing rule is validated between Case Start Date and Claim Date (Work Concluded Date).
    Given the following Matter Types are chosen:
      | IMCC:IDOM |
      | IMCC:IILL |
      | IMCC:IIRC |
      | IMCC:IOTH |
      | IMCC:IOUT |
      | IMCC:IRVL |
      | IMCC:ICZN |
      | IMCC:IEMP |
      | IMCC:IEUL |
      | IMCC:IFME |
      | IMCC:IFVI |
      | IMCC:IGOL |
      | IMCC:ISTU |
      | IMCC:ITWE |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE |
      | 1 | DC         | 01/01/2020      | 01/04/2020          | --           |
      | 2 | DC         | 01/01/2020      | 31/03/2020          | --           |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                          |
      | 1 | <none>                                                                                                                                         |
      | 2 | Stage disbursement claims can only be claimed where 3 months have elapsed from the date the matter was opened. Please refer to the guidelines. |