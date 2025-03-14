Feature: YOUY code Manual and Bulk load validations

  @manual_submission
  Scenario: Manually enter YOUY outcomes
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id |
      | YOUY        |    06-DEC-2024 |           1A-LSF |      884.61 | 061224/001 |         06-DEC-2024 | C1013          | 1234567 |
    Then the outcome saves successfully

  @manual_submission
  Scenario: Manually enter YOUY outcomes without certain mandatory fields completed
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id |
      | YOUY        |                |                  |         100 | 061224/001 |         06-DEC-2024 | C1013          |         |
    Then the outcome does not save and this popup error appears:
      """
      A value must be entered for "Representation Order Date".
      A value must be entered for "Standard Fee Category".
      A value must be entered for "MAAT ID".
      """

  @manual_submission
  Scenario: Manually enter YOUY outcomes and test some drop down lists are correct
    Given user is on their "CRIME LOWER" submission details page
    When user enters an outcome for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type |
      | YOUY        |
    Then the drop down list "standard_fee_cat" contains the following values:
      | 1a - Higher |
      |  1a - Lower |
      | 1b - Higher |
      |  1b - Lower |

  @manual_submission
  Scenario: Manually enter YOUY outcomes , check for DSCC format validation
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id | dscc_number |
      | YOUY        |    06-DEC-2024 |           1A-LSF |      884.61 | 061224/001 |         06-DEC-2024 | C1013          | 1234567 |           1 |
    Then the outcome does not save and gives an error containing:
      """
      The DSCC Number you have reported is invalid. DSCC Numbers must be 10 characters long and in the format yymmnnnnnl. Please enter a valid value in the DSCC Number field.
      """

  @manual_submission
  Scenario: Manually enter YOUY outcomes , check for case concluded date earlier to start date
    Given user is on their "CRIME LOWER" submission details page
    When user adds outcomes for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type | rep_order_date | standard_fee_cat | profit_cost | ufn        | work_concluded_date | police_station | maat_id | dscc_number |
      | YOUY        |     06-12-2024 |           1A-LSF |           0 | 061224/001 |         05-DEC-2024 | C1013          | 1234567 |  201012345A |
    Then the outcome does not save and gives an error containing:
      """
      Case Concluded Date is before Case Start Date
      The Representation Order Date must be before the case concluded date. Please enter a valid value.
      """
