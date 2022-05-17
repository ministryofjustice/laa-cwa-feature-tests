Feature: PROV outcome pricing
  Rules: The following mag court fee schemes are used with the PROV claim code
    23rd Mar 2014 - 30th Jun 2015
    1st Jul 2015  - 31st Mar 2016
    1st Apr 2016  - present

  Pricing calculations: CWA checks that the entered profit cost matches a valid value for the mag court fee scheme
  in use.

Background:
  Given user is on their crime lower submission details page

@valid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEE_ASB
Scenario: Manually enter PROV outcomes using the mag court fee scheme 23-MAR-2015 to 30-JUN-2015

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROV        | 23-MAR-2015    | CHF              | 640.94      | 230315/001 | 24-MAR-2015         | C1013          |
  Then the outcome saves successfully

@valid @crime_lower @delete_outcome_before @XXLSC_MCOURT_FEE_CFC_2015
Scenario: Manually enter PROV outcomes using the mag court fee scheme 01-JUL-2015 to 31-MAR-2016

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROV        | 01-JUL-2015    | CHF              | 579.48      | 010715/001 | 02-JUL-2015         | C1013          |
  Then the outcome saves successfully

@valid @crime_lower @delete_outcome_before @XXLSC_MC_FEE_REV_PRE_JULY_2015
Scenario: Manually enter PROV outcomes using the mag court fee scheme 01-APR-2016 to present

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROV        | 01-APR-2016    | CHF              | 640.94      | 010416/001 | 02-APR-2016         | C1013          |
  Then the outcome saves successfully

@invalid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEE_ASB
Scenario: Manually enter PROV outcomes using the mag court fee scheme 23-MAR-2015 to 30-JUN-2015

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROV        | 23-MAR-2015    | CHF              | 641.94      | 230315/002 | 24-MAR-2015         | C1013          |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for CHF (Contested Higher Fee) / PROV matters. Please enter a valid fee in the profit costs field.
  """

@invalid @crime_lower @delete_outcome_before @XXLSC_MCOURT_FEE_CFC_2015
Scenario: Manually enter PROV outcomes using the mag court fee scheme 01-JUL-2015 to 31-MAR-2016

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROV        | 01-JUL-2015    | CHF              | 580.48      | 010715/002 | 02-JUL-2015         | C1013          |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for CHF (Contested Higher Fee) / PROV matters. Please enter a valid fee in the profit costs field.
  """

@invalid @crime_lower @delete_outcome_before @XXLSC_MC_FEE_REV_PRE_JULY_2015
Scenario: Manually enter PROV outcomes using the mag court fee scheme 01-APR-2016 to present

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROV        | 01-APR-2016    | CHF              | 641.94      | 010416/002 | 02-APR-2016         | C1013          |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for CHF (Contested Higher Fee) / PROV matters. Please enter a valid fee in the profit costs field.
  """
