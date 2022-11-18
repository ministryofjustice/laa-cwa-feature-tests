Feature: Validation for Clinical Negligence claims

    Background:
        Given user is on their "LEGAL HELP" submission details page

    @delete_outcome_after @manual_submission @valid
    Scenario Outline: Add valid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | exemption_criteria_satisfied | excl_case_funding_ref | case_start_date | procurement_area | access_point |
            | 607     | NBTH:NNHN   |                              | 1234567AB             | 01/11/19        | PA20000          | AP20000      |
            | 608     | NBTH:NNHN   | CN001                        |                       | 01/11/19        | PA00167          | AP00000      |
        Then the outcome saves successfully

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | excl_case_funding_ref | case_start_date | procurement_area | access_point |
            | 601     | NBTH:NNHN   | 1234567AB             | 01/11/19        | PA00167          | AP00000      |
        Then the outcome does not save and gives an error containing:
            """
            It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000).
            """

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | case_start_date | procurement_area | access_point | 
            | 602     | NBTH:NNHN   | 01/11/19        | PA00167          | AP00000      | 

        Then the outcome does not save and gives an error containing:
            """
            The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details.
            """

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | case_start_date | procurement_area | access_point |
            | 603     | NBTH:NNHN   | 01/11/19        | PA20000          | AP20000      |

        Then the outcome does not save and gives an error containing:
            """
            The combination of reporting codes can only be used for cases started on or after 01-APR-2013 if an Exceptional Case Funding reference is recorded or if an exemption criterion has been satisfied and this has been indicated in the outcome details.
            """

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | exemption_criteria_satisfied | excl_case_funding_ref | case_start_date | procurement_area | access_point |
            | 604     | NBTH:NNHN   | CN001                        | 1234567AB             | 01/11/19        | PA00167          | AP00000      |

        Then the outcome does not save and gives an error containing:
            """
            For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.
            """

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | exemption_criteria_satisfied | excl_case_funding_ref | case_start_date | procurement_area | access_point |
            | 605     | NBTH:NNHN   | CN001                        | 1234567AB             | 01/11/19        | PA20000          | AP20000      |

        Then the outcome does not save and gives an error containing:
            """
            For the case being reported it is not necessary to record an exemption criterion. Please leave the field blank.
            """

    @delete_outcome_after @manual_submission @invalid
    Scenario Outline: Reject invalid Medical Negligence claims
        When user adds outcomes for "Legal Help" "Clinical Negligence" with fields like this:
            | case_id | matter_type | exemption_criteria_satisfied | case_start_date | procurement_area | access_point |
            | 606     | NBTH:NNHN   | CN001                        | 01/11/19        | PA20000          | AP20000      |
        Then the outcome does not save and gives an error containing:
            """
            The PA (PA20000) and/or AP (AP20000) fields have been populated with ECF Matter. This value can only be used if the ECF Reference field is also populated.
            """
  