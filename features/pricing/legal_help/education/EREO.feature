Feature: Pricing: EREO: Institution establishment/reorganisation (opening, closing, merging etc)

  Background:
    Given a test firm user is logged in CWA
    And the user prepares to add outcomes in the "Education" category of law
    And the user wants to add outcomes with any Matter Type 1 from:
      """
      EREO: Institution establishment/reorganisation (opening, closing, merging etc)
      """

  Scenario: Claims priced with: Standard Fee Scheme
    When the user adds outcomes with:
      """
      profit + counsel costs exceeding the standard fee of £1.00
      """
    Then the outcomes are priced at:
      """
      standard fee
      """

  Scenario: Claims priced with: Disbursements
    When the user adds outcomes with:
      """
      disbursements and disbursements VAT
      """
    Then the outcomes are priced at:
      """
      standard fee + disbursements + disbursements VAT
      """

  Scenario: Claims priced with: VAT Indicator enabled
    When the user adds outcomes with:
    """
    VAT indicator enabled for profit and counsel costs
    """
    Then the outcomes are priced at:
      """
      standard fee + VAT
      """

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag
    When the user adds outcomes with:
      """
      profit + counsel costs exceeding the escape threshold
      """
    Then the outcomes are flagged as escape fee cases

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag
    When the user adds outcomes with:
      """
      profit + counsel costs NOT exceeding the escape threshold
      """
    Then the outcomes are NOT flagged as escape fee cases
