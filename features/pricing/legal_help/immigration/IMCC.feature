Feature: Pricing: IMCC: Immigration - Stage 2c (CLR)

  Background:
    Given a test firm user is logged in CWA
    And the user prepares to add outcomes in the "Immigration" category of law
    And the user wants to add outcomes with any Matter Type 1 from:
      """
      IMCC: Immigration - Stage 2c (CLR)
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

  Scenario: Claims priced with: Additional Payments
    When the user adds outcomes with:
      """
      additional payments
      """
    Then the outcomes are priced at:
      """
      standard fee + additional payments
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

  @escape_fee_flag
  Scenario: Claims priced with: Escape Fee Flag (additional payments)
    When the user adds outcomes with:
      """
      profit + counsel costs (minus additional payments) exceeding the escape threshold
      """
    Then the outcomes are flagged as escape fee cases

  @escape_fee_flag
  Scenario: Claims priced with: NO Escape Fee Flag (additional payments)
    When the user adds outcomes with:
      """
      profit + counsel costs (minus additional payments) NOT exceeding the escape threshold
      """
    Then the outcomes are NOT flagged as escape fee cases
