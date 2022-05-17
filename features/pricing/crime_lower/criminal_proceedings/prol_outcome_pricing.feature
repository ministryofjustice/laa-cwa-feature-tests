Feature: PROL outcome pricing
  Rules: The following mag court fee schemes are used with the PROL claim code
    1st Jan 1995  - 2nd Oct 2011
    3rd Oct 2011  - 19th Mar 2014
    20th Mar 2014 - 30th Jun 2015
    1st Jul 2015  - 31st Mar 2016
    1st Apr 2016  - present

  Pricing calculations: CWA checks that the entered profit cost matches a valid value for the mag court fee scheme
  in use.

Background:
  Given user is on their crime lower submission details page

@valid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEES
Scenario: Manually enter PROL outcomes using the mag court fee scheme 01-JAN-1995 to 02-OCT-2011

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
  | PROL        |                |                  | 1005.49     | 010195/001 | 02-JAN-1995         | C1013          |
  Then the outcome saves successfully

@valid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEE_LAR
Scenario: Manually enter PROL outcomes using the mag court fee scheme 03-OCT-2011 to 19-MAR-2014

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 03-OCT-2011    | 1EW              | 517.05      | 031011/001 | 04-OCT-2011         | C1013          | 1234567890 |
  Then the outcome saves successfully

@valid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_CFEE_LAR2
Scenario: Manually enter PROL outcomes using the mag court fee scheme 20-MAR-2014 to 30-JUN-2015

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 20-MAR-2014    | 1EW              | 471.81      | 200314/001 | 21-MAR-2014         | C1013          | 1234567890 |
  Then the outcome saves successfully

@valid @crime_lower @delete_outcome_before @XXLSC_MCOURT_FEE_CFC_2015
Scenario: Manually enter PROL outcomes using the mag court fee scheme 01-JUL-2015 to 31-MAR-2016

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 01-JUL-2015    | 1EW              | 426.57      | 010715/001 | 02-JUL-2015         | C1013          | 1234567890 |
  Then the outcome saves successfully

@valid @crime_lower @delete_outcome_before @XXLSC_MC_FEE_REV_PRE_JULY_2015
Scenario: Manually enter PROL outcomes using the mag court fee scheme from 01-APR-2016

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 01-APR-2016    | 1EW              | 471.81      | 010416/001 | 02-APR-2016         | C1013          | 1234567890 |
  Then the outcome saves successfully

#@invalid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEES
#Scenario: Manually enter PROL outcomes using the mag court fee scheme 01-JAN-1995 to 02-OCT-2011
#
#  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
#  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station |
#  | PROL        |                |                  | 1005.49     | 010195/001 | 02-JAN-1995         | C1013          |
#  Then the outcome saves successfully

@invalid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_COURT_FEE_LAR
Scenario: Manually enter PROL outcomes using the mag court fee scheme 03-OCT-2011 to 19-MAR-2014

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 03-OCT-2011    | 1EW              | 518.05      | 031011/002 | 04-OCT-2011         | C1013          | 1234567890 |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for Category 1: Either Way / PROL matters. Please enter a valid fee in the profit costs field.
  """

@invalid @crime_lower @delete_outcome_before @XXLSC_MAGISTRATE_CFEE_LAR2
Scenario: Manually enter PROL outcomes using the mag court fee scheme 20-MAR-2014 to 30-JUN-2015

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 20-MAR-2014    | 1EW              | 472.81      | 200314/002 | 21-MAR-2014         | C1013          | 1234567890 |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for Category 1: Either Way / PROL matters. Please enter a valid fee in the profit costs field.
  """

@invalid @crime_lower @delete_outcome_before @XXLSC_MCOURT_FEE_CFC_2015
Scenario: Manually enter PROL outcomes using the mag court fee scheme 01-JUL-2015 to 31-MAR-2016

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 01-JUL-2015    | 1EW              | 427.57      | 010715/002 | 02-JUL-2015         | C1013          | 1234567890 |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for Category 1: Either Way / PROL matters. Please enter a valid fee in the profit costs field.
  """

@invalid @crime_lower @delete_outcome_before @XXLSC_MC_FEE_REV_PRE_JULY_2015
Scenario: Manually enter PROL outcomes using the mag court fee scheme from 01-APR-2016

  When user adds outcomes for Crime Lower Criminal Proceedings with fields like this:
  | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id    |
  | PROL        | 01-APR-2016    | 1EW              | 472.81      | 010416/002 | 02-APR-2016         | C1013          | 1234567890 |
  Then the outcome does not save and gives an error containing:
  """
  The fee you have entered is not valid for Category 1: Either Way / PROL matters. Please enter a valid fee in the profit costs field.
  """
