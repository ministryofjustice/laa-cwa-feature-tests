Feature: Pricing: QPRO: Provision of goods and services

  Background:
    Given a test firm user is logged in CWA
    And the user prepares to add outcomes in the "Discrimination" category of law
    And the user wants to add outcomes with any Matter Type 1 from:
      """
      QPRO: Provision of goods and services
      """

  Scenario: Claims priced with: hourly rates Scheme
    When the user adds outcomes with:
      """
      profit and counsel costs according to hourly rates
      """
    Then the outcomes are priced at:
      """
      hourly rates
      """

  Scenario: Claims priced with: Disbursements
    When the user adds outcomes with:
      """
      disbursements and disbursements VAT
      """
    Then the outcomes are priced at:
      """
      hourly rates + disbursements + disbursements VAT
      """

  Scenario: Claims priced with: VAT Indicator enabled
    When the user adds outcomes with:
    """
    VAT indicator enabled for profit and counsel costs
    """
    Then the outcomes are priced at:
      """
      hourly rates + VAT
      """

  Scenario: Claims priced with: hourly rates Scheme
    When the user adds outcomes with:
      """
      profit + counsel costs exceeding the max price cap
      """
    Then the outcomes are priced at:
      """
      max price cap
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
