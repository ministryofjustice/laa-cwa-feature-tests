Feature: Validate Procurement Area field

  Background: 
    Given user is on their "LEGAL HELP" submission details page

  Scenario Outline: validate procurement area for IMMIGRATION with case start date < 15/11/2010 with specific PA/AP codes
    When user adds an manual outcome "Legal Help" "Immigration" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: 
      | case id | mt        | stage_reached | case start date | pa      | ap      | irc_surgery |
      |     501 | IMLB:IOUT | IE            |        14/11/10 | PA00142 | AP00187 | No          |
      |     502 | IMLB:IOUT | IE            |        14/11/10 | PA00143 | AP00187 | No          |
      |     503 | IMLB:IOUT | IE            |        14/11/10 | PA00144 | AP00187 | No          |
      |     504 | IMLB:IOUT | IE            |        14/11/10 | PA00145 | AP00187 | No          |
      |     505 | IMLB:IOUT | IE            |        14/11/10 | PA00146 | AP00187 | No          |
      |     506 | IMLB:IOUT | IE            |        14/11/10 | PA00147 | AP00187 | No          |
      |     507 | IMLB:IOUT | IE            |        14/11/10 | PA00148 | AP00187 | No          |
      |     508 | IMLB:IOUT | IE            |        14/11/10 | PA00149 | AP00187 | No          |
      |     509 | IMLB:IOUT | IE            |        14/11/10 | PA00150 | AP00187 | No          |
      |     510 | IMLB:IOUT | IE            |        14/11/10 | PA00177 | AP00187 | No          |
      |     511 | IMLB:IOUT | IE            |        14/11/10 | PA00178 | AP00187 |             |

  Scenario Outline: validate procurement area for ASYLUM with case start date < 15/11/2010 with specific PA/AP codes
    When user adds an manual outcome "Legal Help" "Immigration" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: 
      | case id | mt        | stage_reached | case start date | pa      | ap      | irc_surgery |
      |     512 | IALB:IOUT | IE            |        14/11/10 | PA00142 | AP00187 | No          |
      |     513 | IALB:IOUT | IE            |        14/11/10 | PA00143 | AP00187 | No          |
      |     514 | IALB:IOUT | IE            |        14/11/10 | PA00144 | AP00187 | No          |
      |     515 | IALB:IOUT | IE            |        14/11/10 | PA00145 | AP00187 | No          |
      |     516 | IALB:IOUT | IE            |        14/11/10 | PA00146 | AP00187 | No          |
      |     517 | IALB:IOUT | IE            |        14/11/10 | PA00147 | AP00187 | No          |
      |     518 | IALB:IOUT | IE            |        14/11/10 | PA00148 | AP00187 | No          |
      |     519 | IALB:IOUT | IE            |        14/11/10 | PA00149 | AP00187 | No          |
      |     520 | IALB:IOUT | IE            |        14/11/10 | PA00150 | AP00187 | No          |
      |     521 | IALB:IOUT | IE            |        14/11/10 | PA00177 | AP00187 | No          |
      |     522 | IALB:IOUT | IE            |        14/11/10 | PA00178 | AP00187 |             |

  Scenario Outline: validate procurement area for IMMIGRATION and ASYLUM where case start date >= 15/11/2010 with PA/AP code
    When user adds an manual outcome "Legal Help" "Immigration" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the "<error_message>" appears

    Examples: 
      | case id | mt        | stage_reached | case start date | pa      | ap      | irc_surgery | error_message                                                                                                                                                                                                                                                                                                                                                                                       |
      |     523 | IMLB:IOUT | IE            |        15/11/10 | PA00178 | AP00187 | No          | Completion of the IRC Surgery fields are required only when a relevant PA and AP code has been selected: PA00142 (Brook House IRC), PA00143 (Campsfield IRC), PA00144 (Colnbrook IRC), PA00147 (Harmondsworth IRC), PA00148 (Tinsley House IRC), PA00150 (Yarl's Wood IRC), PA00177 (Morton Hall IRC) and PA00188 (Derwentside IRC) and AP codes AP00186 (fast track) and AP00187 (non-fast track). |
      |     524 | IALB:IOUT | IE            |        15/11/10 | PA00178 | AP00187 | No          | Completion of the IRC Surgery fields are required only when a relevant PA and AP code has been selected: PA00142 (Brook House IRC), PA00143 (Campsfield IRC), PA00144 (Colnbrook IRC), PA00147 (Harmondsworth IRC), PA00148 (Tinsley House IRC), PA00150 (Yarl's Wood IRC), PA00177 (Morton Hall IRC) and PA00188 (Derwentside IRC) and AP codes AP00186 (fast track) and AP00187 (non-fast track). |

  Scenario Outline: validate procurement area for IMMIGRATION and ASYLUM for null PA where case start date >= 15/11/2010
    When user adds an manual outcome "Legal Help" "Immigration" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the "<error_message>" appears

    Examples: 
      | case id | mt        | stage_reached | case start date | pa | ap | irc_surgery | error_message                                                                                                                                                                                |
      |     525 | IMLB:IOUT | IE            |        15/11/10 |    |    |             | When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information . |
      |     526 | IALB:IOUT | IE            |        15/11/10 |    |    |             | When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information . |

  Scenario Outline: validate procurement area for IMMIGRATION and ASYLUM for null PA where case start date < 15/11/2010
    When user adds an manual outcome "Legal Help" "Immigration" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the "<error_message>" appears

    Examples: 
      | case id | mt        | stage_reached | case start date | pa | ap | irc_surgery | error_message                                                                                                                                                                                |
      |     525 | IMLB:IOUT | IE            |        14/11/10 |    |    |             | When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information . |
      |     526 | IALB:IOUT | IE            |        14/11/10 |    |    |             | When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information . |

  Scenario Outline: validate procurement area for IMMIGRATION and ASYLUM where case start date < 15/11/2010  with PA/AP code
    When user adds an manual outcome "Legal Help" "Immigration" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the "<error_message>" appears

    Examples: 
      | case id | mt        | stage_reached | case start date | pa      | ap      | irc_surgery | error_message                                                                                                                                                                                                                                                                                                                                      |
      |     527 | IMLB:IOUT | IE            |        13/10/10 | PA00188 | AP00187 | No          | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      |     528 | IMLB:IOUT | IE            |        14/11/10 | PA00188 | AP00187 | No          | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      |     529 | IALB:IOUT | IE            |        13/10/10 | PA00188 | AP00187 | No          | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |
      |     530 | IALB:IOUT | IE            |        14/11/10 | PA00188 | AP00187 | No          | Data is missing or incorrect in the Procurement Area and/or Access Point fields. For Immigration matters which have a start date that is prior to 15-Nov-2010 the Procurement Area, if populated, can only be an Immigration Removal Centre (IRC). If an IRC is recorded in the Procurement Area field a valid Access Point must also be recorded. |

  Scenario Outline: validate procurement area for Housing for null PA where case start date >= 15/11/2010
    When user adds an manual outcome "Legal Help" "Housing" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the "<error_message>" appears

    Examples: 
      | case id | mt        | stage_reached | case start date | pa | ap | irc_surgery | error_message                                                                                                                                                                                |
      |     531 | HHOM:HPRI | HA            |        15/11/10 |    |    |             | When reporting an outcome with a case start date that is on or after 15-Nov-2010, the Procurement Area field must be complete. Please populate this field with the appropriate information . |

  Scenario Outline: validate procurement area for Housing for null PA case start date < 15/11/2010
    When user adds an manual outcome "Legal Help" "Housing" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: 
      | case id | mt        | stage_reached | case start date | pa | ap | irc_surgery |
      |     532 | HHOM:HPRI | HA            |        14/11/10 |    |    |             |

  Scenario Outline: validate procurement area for Housing case start date prior 15/11/2010 with PA code
    When user adds an manual outcome "Legal Help" "Housing" with "<case id>", "<mt>", "<irc_surgery>", "<stage_reached>", "<case start date>", "<pa>" and "<ap>"
    Then the outcome does not save and the "<error_message>" appears

    Examples: 
      | case id | mt        | stage_reached | case start date | pa      | ap | irc_surgery | error_message                                                                                                                                                        |
      |     533 | HHOM:HPRI | HA            |        14/11/10 | PA00010 |    |             | The case start date of this matter is prior to 15-Nov-2010 . A Procurement Area cannot be recorded against this matter. Please amend the outcome details accordingly |
