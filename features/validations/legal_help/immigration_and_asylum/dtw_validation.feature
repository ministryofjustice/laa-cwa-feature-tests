Feature: claims validations for DTW(detention travel and waiting cost) for following codes

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"
    Given the following Matter Types are chosen:
      | IAXC:IASY |
      | IAXL:IFRA |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS |
      | 1 | CM         |      01/04/2013 |          31/03/2023 | IA           |            1 |
      | 2 | SC         |      01/04/2013 |          31/03/2023 | --           |            1 |
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
      | IMAP:ILEA |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS | EXEMPTION_CRITERIA_SATISFIED |
      | 1 | CM         |      01/03/2023 |          31/03/2023 | IA           |            1 | TR001                        |
      | 2 | SC         |      01/03/2023 |          31/03/2023 | --           |            1 | TR001                        |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |

  Scenario: Add stage claim and completed matter with counsel cost zero and non zero values
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#5"
    Given the following Matter Types are chosen:
      | IAXL:IDAS |
    And the following outcomes are bulkloaded:
      | # | CLAIM_TYPE | CASE_START_DATE | WORK_CONCLUDED_DATE | OUTCOME_CODE | TRAVEL_COSTS |
      | 1 | CM         |      01/04/2023 |          30/04/2023 | IX           |            1 |
      | 2 | SC         |      01/04/2023 |          30/04/2023 | --           |            1 |
    Then the following results are expected:
      | # | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                                                                            |
      | 1 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
      | 2 | Values greater than 0.00 cannot be entered in the Detention Travel and Waiting Costs Excluding VAT field for this claim. For hourly rate cases any Detention Travel and Wait related costs should be claimed as part of your profit costs and entered in the profit costs field. |
