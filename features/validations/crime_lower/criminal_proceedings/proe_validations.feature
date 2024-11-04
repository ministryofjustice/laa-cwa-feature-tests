
  Feature: PROE code Manual and Bulk load validations
  
  @manual_submission
  Scenario: Manually enter PROE outcomes and test some drop down lists are correct
    Given user is on their "CRIME LOWER" submission details page
    When user enters an outcome for "Crime Lower" "criminal proceedings" with fields like this:
      | matter_type |
      | PROE        |
    Then the drop down list "crime_matter_type" contains the following values:
      | 1-Offences against the person                                                      |
      | 2-Homicide and related grave offences                                              |
      | 3-Sexual offences and associated offences against children                         |
      | 4-Robbery                                                                          |
      | 5-Burglary                                                                         |
      | 6-Criminal damage                                                                  |
      | 7-Theft (including taking vehicle without consent)                                 |
      | 8-Fraud and forgery and other offences of dishonesty not otherwise categorised     |
      | 9-Public order offences                                                            |
      | 10-Drug offences                                                                   |
      | 11-Driving and motor vehicle offences (other than those covered by codes 1, 6 & 7) |
      | 12-Other offences                                                                  |
      | 13-Terrorism                                                                       |
      | 14-Anti-social behaviour orders                                                    |
      | 15-Sexual offender orders                                                          |
      | 16-Other prescribed proceedings                                                    |
      | 36-Breach of part 1 Injunctions under the ASBCP Act 2014                           |