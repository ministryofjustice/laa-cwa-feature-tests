Feature: Validation for Illegal Immigration Act

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  # @delete_outcome_after @manual_submission @invalid
  # Scenario Outline: No ECS code is allowed
  #   When user adds an outcome for "Legal Help" "Immigration" with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
  #   Then the outcome does not save and the error message "<error message>" appears

  #   Examples: 
  #     | case id | mt        | ecs code | ecf ref   | case start date | pa      | ap      | error message                                                                                                                                                                                                     |
  #     |     001 | IMMA:IMRN |          | 1234567AB |      01/08/2023 | PA00136 | AP00137 | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000). |
  #     |     002 | IMMA:IMRN | CM001    | 1234567AB |      01/08/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     003 | IMMA:IMRN | CM001    | 1234567AB |      01/08/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     004 | IMMA:IMRN | CM001    |           |      01/08/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     005 | IMMA:IMRN | LE001    | 1234567AB |      01/08/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     006 | IMMA:IMRN | LE001    |           |      01/08/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     007 | IMMA:IMRN | LE001    |           |      01/08/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     008 | IMMA:IMRN | TR001    | 1234567AB |      01/08/2023 | PA00136 | AP00137 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     009 | IMMA:IMRN | TR001    | 1234567AB |      01/08/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |
  #     |     010 | IMMA:IMRN | TR001    |           |      01/08/2023 | PA20000 | AP20000 | The Exemption Criteria Satisfied code is not valid for this matter type combination.                                                                                                                              |

  @delete_outcome_after @manual_submission @valid
  Scenario Outline: Add valid asylum claim for code combination IAXL:IDIF.
    Case start date has to be on or after 25th April 2022.
    Valid outcome codes are: -- IG, IH, IU, IW, IY, IZ

    When user adds outcomes for "Legal Help" "Immigration And Asylum" with fields like this:
      | case_id | matter_type | case_start_date | outcome_code |
      |     001 | IMMA:IMRN   |      01/08/2023 | --           |        
      |     002 | IMMA:IMRN   |      01/08/2023 | IG           |         
      |     003 | IMMA:IMRN   |      01/08/2023 | IH           |           
      |     004 | IMMA:IMRN   |      01/08/2023 | IU           |           
      |     005 | IMMA:IMRN   |      01/08/2023 | IW           |           
      |     006 | IMMA:IMRN   |      01/08/2023 | IY           |         
      |     007 | IMMA:IMRN   |      01/08/2023 | IZ           |
    Then the outcome saves successfully
