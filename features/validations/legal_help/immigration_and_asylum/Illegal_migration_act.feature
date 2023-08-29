Feature: Validation for Illegal Immigration Act

  Background:
    Given user is on their "LEGAL HELP" submission details page

  @delete_outcome_after @manual_submission @invalid
  Scenario Outline: No ECS code is allowed
    When user adds an outcome for "Legal Help" "Immigration" with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the error message "<error message>" appears

    Examples:
      | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                                                                                                                                     |
      |     001 | IMMA:IMRN |          | 1234567AB |      01/05/2023 | PA00136 | AP00137 | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000). |
      |     002 | IMMA:IMRN | CM001    | 1234567AB |      01/05/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     003 | IMMA:IMRN | CM001    | 1234567AB |      01/05/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     004 | IMMA:IMRN | CM001    |           |      01/05/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     005 | IMMA:IMRN | LE001    | 1234567AB |      01/05/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     006 | IMMA:IMRN | LE001    |           |      01/05/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     007 | IMMA:IMRN | LE001    |           |      01/05/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     008 | IMMA:IMRN | TR001    | 1234567AB |      01/05/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     009 | IMMA:IMRN | TR001    | 1234567AB |      01/05/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
      |     010 | IMMA:IMRN | TR001    |           |      01/05/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid asylum claim for code combination IMMA:IMRN. Completed Matter Claims
    Case start date has to be on or after 01/01/2024. Date is set to 01/05/2023 for testing purpose
    Valid outcome codes are: -- IG, IH, IU, IW, IY, IZ

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code |
      |     001 | IMMA:IMRN   |      01/05/2023 | --           |
      |     002 | IMMA:IMRN   |      01/05/2023 | IA           |
      |     003 | IMMA:IMRN   |      01/05/2023 | IB           |
      |     004 | IMMA:IMRN   |      01/05/2023 | IC           |
      |     005 | IMMA:IMRN   |      01/05/2023 | ID           |
      |     006 | IMMA:IMRN   |      01/05/2023 | IE           |
      |     007 | IMMA:IMRN   |      01/05/2023 | IF           |
      |     008 | IMMA:IMRN   |      01/05/2023 | IG           |
    # |     009 | IMMA:IMRN   |      01/05/2023 | IH           |
      |     010 | IMMA:IMRN   |      01/05/2023 | IU           |
      |     011 | IMMA:IMRN   |      01/05/2023 | IV           |
      |     012 | IMMA:IMRN   |      01/05/2023 | IW           |
      |     013 | IMMA:IMRN   |      01/05/2023 | IX           |
      |     014 | IMMA:IMRN   |      01/05/2023 | IY           |
      |     015 | IMMA:IMRN   |      01/05/2023 | IZ           |
    Then the outcome saves successfully

# commented this test as there is a bug in the code which gives pricing error  when using stage disbursement claims
  # @delete_outcome_after @manual_submission @valid
  # Scenario: Stage disbursement claim
  #   When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
  #     | case_id | matter_type | case_start_date | work_concluded_date | claim_type | ho_ucn   | ho_interview | outcome_code | procurement_area | access_point |
  #     |     001 | IMMA:IMRN   |      01/05/2023 |          01/08/2023 | DC         | 12345678 |            0 | --           | PA00136          | AP00137      |
  #   Then the outcome saves successfully

 @delete_outcome_after @manual_submission @valid
  Scenario: Stage claim
    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | work_concluded_date | claim_type | ho_ucn   | ho_interview | outcome_code | procurement_area | access_point |
      |     001 | IMMA:IMRN   |      01/05/2023 |          01/08/2023 | SC         | 12345678 |            0 | --           | PA00136          | AP00137      |
    Then the outcome saves successfully