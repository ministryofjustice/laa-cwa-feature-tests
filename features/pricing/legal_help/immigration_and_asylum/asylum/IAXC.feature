Feature: Pricing: IAXC: Asylum - CLR Work Not Subject to the Standard Fee Scheme

  Background:
    Given a test firm user is logged in CWA
    And the user prepares to add outcomes in the "Asylum" category of law
    And the user wants to add outcomes with any Matter Type 1 from:
      """
      Asylum - CLR Work Not Subject to the Standard Fee Scheme
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

  Scenario: Claims priced with: Additional Payments
    When the user adds outcomes with:
      """
      additional payments
      """
    Then the outcomes are priced at:
      """
      hourly rates + additional payments
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

  Scenario: Claims priced with: Hourly Rates (Separated Migrant Child)
    When the user adds outcomes with:
      """
      exemption criteria separated migrant child
      """
    Then the outcomes are priced at:
      """
      hourly rates
      """
