Feature: Validation: Additional payments 

  Background: 
    Given a test firm user is logged in CWA

Scenario: Validation for IALH:IMER does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IALH:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IALH:IMER                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IMER                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IALH:IMER                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IMER                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IALH:IMER                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IMER                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IALH:IMER                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IMER                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IALH:IMER                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |


Scenario: Validation for IALH:IPAS does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IALH:IPAS |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IALH:IPAS                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IPAS                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IALH:IPAS                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IPAS                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IALH:IPAS                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IPAS                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IALH:IPAS                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IALH:IPAS                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IALH:IPAS                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |

Scenario: Validation for IAXL:IMER does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IAXL:IMER                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IMER                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IAXL:IMER                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IMER                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IAXL:IMER                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IMER                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IAXL:IMER                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IMER                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IAXL:IMER                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |

Scenario: Validation for IAXL:IPAS does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IAXL:IPAS |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IAXL:IPAS                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IPAS                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IAXL:IPAS                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IPAS                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IAXL:IPAS                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IPAS                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IAXL:IPAS                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IAXL:IPAS                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IAXL:IPAS                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |


Scenario: Validation for IMXL:IMER does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMXL:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMXL:IMER                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMXL:IMER                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IMXL:IMER                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMXL:IMER                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IMXL:IMER                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMXL:IMER                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IMXL:IMER                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMXL:IMER                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IMXL:IMER                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |


Scenario: Validation for IMLH:IMER does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IMER                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IMER                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IMLH:IMER                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IMER                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IMLH:IMER                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IMER                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IMLH:IMER                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IMER                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IMLH:IMER                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |

Scenario: Validation for IMLH:IPAS does not allow additional payments for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IPAS |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |
      | 2 | 011012/102 | 102|CM         |    01/10/2012 |         100   | N             |         1 |              0 |             N       |                     0 |            0 | IE            |
      | 3 | 011012/103 | 103|CM         |    01/10/2012 |         100   | N             |         0 |              1 |             N       |                     0 |            0 | IE            |
      | 4 | 011012/104 | 104|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             Y        |                     0 |            0 | IE            |
      | 4 | 011012/105 | 105|CM         |    01/10/2012 |         100   | N             |         0 |              0 |             N        |                     1 |            0 | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IPAS                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IPAS                   | 011012/102     | VALIDATION4 | 1 is not a valid CMRH_ORAL |
      | IMLH:IPAS                   | 011012/102     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IPAS                   | 011012/103     | VALIDATION4 | 1 is not a valid CMRH_TELEPHONE |
      | IMLH:IPAS                   | 011012/103     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IPAS                   | 011012/104     | VALIDATION4 | Y is not a valid SUBSTANTIVE_HEARING |
      | IMLH:IPAS                   | 011012/104     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IPAS                   | 011012/105     | VALIDATION4 | 1 is not a valid ADJOURNED_HEARING_FEE |
      | IMLH:IPAS                   | 011012/105     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |

Scenario: Validation for IMLH:IPAS does not allow additional payments for cases after 01/10/12 for stage claim
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IPAS |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |OUTCOME_CODE|
      | 1 | 011012/101 | 101|SC         |    01/10/2012 |         100   | N             |         0 |              0 |             N       |                     0 |            1 | IE            |--|
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IPAS                   | 011012/101     | ADDITIONAL_PAY_VALIDATION | As this claim involves one of the Matter Type Code IPAS or IMER, work in relation to the following cannot be claimed: HO interview Fee(s), Adjourned Hearing Fee(s), Substantive Hearing Fee, CMRH Oral Fee(s), CMRH Telephone Fee(s). Please amend your claim accordingly. |
      | IMLH:IPAS                   | 011012/101     | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |

Scenario: Validation for IMLH:IPAS does not allow profit costs + Disbursements > 100 for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IPAS |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST |DISBURSEMENTS_AMOUNT| VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101|CM         |    01/10/2012 |         100   | 1|N             |         0 |              0 |             N       |                     0 |            0     | IE            |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IPAS                   | 011012/101     | PROFIT_DISB_COST_VALIDATION | The total of the figures recorded against the Profit Costs Excluding VAT and/or Disbursements Excluding VAT exceed permissible limit for this matter of £100.00 (as it has been reported with the code IPAS or IMER). |

Scenario: Validation for IMLH:IMER does not allow Disbursements costs > 100 for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST |DISBURSEMENTS_AMOUNT| VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101   |CM          |    01/10/2012   |         0 |101| N             |         0 |              0 |             N       |                     0 |            0     | IE        |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IMER                   | 011012/101     | PROFIT_DISB_COST_VALIDATION | The total of the figures recorded against the Profit Costs Excluding VAT and/or Disbursements Excluding VAT exceed permissible limit for this matter of £100.00 (as it has been reported with the code IPAS or IMER). |

Scenario: Validation for IMLH:IMER does not allow profit costs > 100 for cases after 01/10/12
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST |DISBURSEMENTS_AMOUNT| VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |
      | 1 | 011012/101 | 101   |CM          |    01/10/2012   |         101 |0| N             |         0 |              0 |             N       |                     0 |            0     | IE        |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type                              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IMER                   | 011012/101     | PROFIT_DISB_COST_VALIDATION | The total of the figures recorded against the Profit Costs Excluding VAT and/or Disbursements Excluding VAT exceed permissible limit for this matter of £100.00 (as it has been reported with the code IPAS or IMER). |


  Scenario: Validation for IMLH:IPAS does not allow counsel costs > 0  for cases after 01/10/12 with CM and SC claim types
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IPAS |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST  |COUNSEL_COST | VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW     | STAGE_REACHED |OUTCOME_CODE|
      | 1 | 011012/101 | 101   |CM          |    01/10/2012 |         100    |   1         | N             |         0  |              0      |                 N     |                     0 |            0     | IE            |IX          |
      | 2 | 011012/102 | 102   |SC          |    01/10/2012 |         100    |   1         | N             |         0  |              0      |             N       |                     0 |            0     | IE            |--          |
    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IPAS                   | 011012/101     | COUNSEL_COST_VALIDATION | As this claim involves one of the Matter Type Codes IPAS or IMER, Counsel costs cannot be claimed. Please ensure this field is set to zero. |
      | IMLH:IPAS                   | 011012/102     | COUNSEL_COST_VALIDATION | As this claim involves one of the Matter Type Codes IPAS or IMER, Counsel costs cannot be claimed. Please ensure this field is set to zero. |
      | IMLH:IPAS                   | 011012/102     | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |

Scenario: Validation for IMLH:IMER does not allow counsel costs > 0  for cases after 01/10/12 with CM and SC claim types
    And user prepares to submit outcomes for test provider "LEGAL HELP.IMMAS#12"
    Given the following Matter Types are chosen:
      | IMLH:IMER |
    When the following outcomes are bulkloaded:
      | # | UFN        |CASE_ID| CLAIM_TYPE | CASE_START_DATE | PROFIT_COST |COUNSEL_COST| VAT_INDICATOR | CMRH_ORAL | CMRH_TELEPHONE | SUBSTANTIVE_HEARING | ADJOURNED_HEARING_FEE | HO_INTERVIEW | STAGE_REACHED |OUTCOME_CODE|
      | 1 | 011012/101 | 101   |CM          |    01/10/2012   |         100 |1           | N             |         0 |              0 |             N       |                     0 |            0     | IE        |IX          |
      | 2 | 011012/102 | 102   | SC         |    01/10/2012   |         100 |1           | N             |         0 |              0 |             N       |                     0 |            0     | IE        |--          |

    Then user should see the outcome results page
    And the following errors:
      | Matter Type / Stage Reached | UFN            | Error Type              | Description                                                                                                                                                                                                                                                                                    |
      | IMLH:IMER                   | 011012/101     | COUNSEL_COST_VALIDATION | As this claim involves one of the Matter Type Codes IPAS or IMER, Counsel costs cannot be claimed. Please ensure this field is set to zero. |
      | IMLH:IMER                   | 011012/102     | COUNSEL_COST_VALIDATION | As this claim involves one of the Matter Type Codes IPAS or IMER, Counsel costs cannot be claimed. Please ensure this field is set to zero. |
      | IMLH:IMER                   | 011012/102     | Invalid SR-OC Combination | The reporting code combination that has been used is not valid. Please amend accordingly. |