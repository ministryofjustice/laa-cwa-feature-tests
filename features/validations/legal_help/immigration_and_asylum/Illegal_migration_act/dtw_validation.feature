Feature: claims validations for DTW(detention travel and waiting cost) for following codes

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IFRA |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS |
      | 1 |     001 | 010413/001 | CM         |      01/04/2013 |          31/03/2023 | IA           |            1 |
      | 2 |     002 | 010413/002 | SC         |      01/04/2013 |          31/03/2023 | --           |            1 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMXC:IBAI |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | FOLLOW_ON_WORK | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IC           |            1 | N/A            | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |            1 | N/A            | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMXC:IRVL |
      | IMXL:IOTH |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | CM         |      01/04/2013 |          30/04/2023 | IA           |            1 | CM001                        |
      | 2 | SC         |      01/04/2013 |          30/04/2023 | --           |            1 | CM001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMLH:ILEA |
      | IMXC:IBAI |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | EXCL_CASE_FUNDING_REF | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | CM         |      01/04/2023 |          30/04/2023 | IC           |            1 |             1234567AB | PA20000          | AP20000      |
      | 2 | SC         |      01/04/2023 |          30/04/2023 | --           |            1 |             1234567AB | PA20000          | AP20000      |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with IACD with DTW > 1
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IACD:ILEA |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | TRAVEL_COSTS | EXCL_CASE_FUNDING_REF | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | CM         |      31/03/2023 | IA           |            1 |             1234567AB | PA20000          | AP20000      |
      | 2 | SC         |      30/08/2018 | --           |            1 |             1234567AB | PA20000          | AP20000      |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | IACD:ILEA   | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | IACD:ILEA   | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with IMCD with DTW > 1
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMOT#4"
    Given the following Matter Types are chosen:
      | IMCD:ICZN |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | OUTCOME_CODE | TRAVEL_COSTS | EXCL_CASE_FUNDING_REF | PROCUREMENT_AREA | ACCESS_POINT |
      | 1 | CM         |      31/03/2023 | IA           |            1 |             1234567AB | PA20000          | AP20000      |
      | 2 | SC         |      30/08/2018  | --           |            1 |             1234567AB | PA20000          | AP20000      |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | IMCD:ICZN   | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | IMCD:ICZN   | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IOUT |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |            1 |         100 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |            1 |         100 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST |
      | 1 |     001 | 010423/001 | CM         |      01/04/2023 |          30/04/2023 | IX           |            0 |         100 |
      | 2 |     002 | 010423/002 | SC         |      01/04/2023 |          30/04/2023 | --           |            0 |         100 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | UFN        | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | PROFIT_COST | EXEMPTION_CRITERIA_SATISFIED |
      | 1 |     001 | 151223/001 | CM         |      15/12/2023 |          15/12/2023 | IX           |            1 |         100 | TR001                        |
      | 2 |     002 | 151223/002 | SC         |      15/12/2023 |          15/12/2023 | --           |            1 |         100 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE |
      | 1 | <none>                |
      | 2 | <none>                |
