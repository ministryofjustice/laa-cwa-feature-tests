  Feature: Validation for Immigration and Asylum claims

   Background:
   Given user is on their "MEDIATION" submission details page

  @delete_outcome_after @manual_submission @invalid
  Scenario Outline: Mediation cases
    When user adds an outcome for "Legal Help" "Immigration and Asylum" with "<case id>", "<mt>", "<ecs code>", "<ecf ref>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully
    Examples:
     | mt        | case start date | 
     | ASSM:ASSA |  01/11/19        |
    



# Background:
#   Given user is on their "CRIME LOWER" submission details page

# @valid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEES @manual
# Scenario: Manually enter PROE outcomes using the mag court fee scheme 01-JAN-1995 to 02-OCT-2011

#   When user adds outcomes for "Crime Lower" "Criminal Proceedings" with fields like this:
#   | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
#   | PROE        |                |                  | 306.25      | 010195/001 | 02-JAN-1995         | C1013          |
#   Then the outcome saves successfully

# @valid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEE_LAR @manual
# Scenario: Manually enter PROE outcomes using the mag court fee scheme 03-OCT-2011 to 19-MAR-2014

#   When user adds outcomes for "Crime Lower" "Criminal Proceedings" with fields like this:
#   | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
#   | PROE        | 03-OCT-2011    | 1EW              | 213.35      | 031011/001 | 04-OCT-2011         | C1013          | 1234567890 |
#   Then the outcome saves successfully