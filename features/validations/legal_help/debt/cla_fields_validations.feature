Feature: Debt Bulk load validations

  Background:
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.DEB#1"

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE before April 2013
    Given the following Matter Types are chosen:
      | DMCA:DSCH |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 31/03/2013      | <blank>        | <blank>       |
      | 2 | 31/03/2013      | 1234567        | <blank>       |
      | 3 | 31/03/2013      | <blank>        | EPRE          |
      | 4 | 31/03/2013      | 1234567        | EPRE          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE       |
      | 1 | DMCA:DSCH   | <none>                      |
      | 2 | DMCA:DSCH   | XXLSC_AM_LAR2_CLA_REF_MSG   |
      | 3 | DMCA:DSCH   | XXLSC_AM_LAR2_CLA_EXEMP_MSG |
      | 4 | DMCA:DSCH   | XXLSC_AM_LAR2_CLA_REF_MSG   |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013, CLA_EXEMPTION: <NONE>
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 01/04/2013      | <blank>        | <blank>       |
      | 2 | 01/04/2013      | 1234567        | <blank>       |
      | 3 | 01/04/2013      | 1234567        | <blank>       |
      | 4 | 01/04/2013      | 123456         | <blank>       |
      | 5 | 01/04/2013      | 0000000        | <blank>       |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE         |
      | 1 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_REQ     |
      | 2 | DIVB:DIBP   | <none>                        |
      | 3 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_INVALID |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013, CLA_EXEMPTION: EPRE
    Note: EPRE can be used along with an already used CLA_REF_NUMBER
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 01/04/2013      | <blank>        | EPRE          |
      | 2 | 01/04/2013      | 1234567        | EPRE          |
      | 3 | 01/04/2013      | 1234567        | EPRE          |
      | 4 | 01/04/2013      | 123456         | EPRE          |
      | 5 | 01/04/2013      | 0000000        | EPRE          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE          |
      | 1 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_EPRE_REQ |
      | 2 | DIVB:DIBP   | <none>                         |
      | 3 | DIVB:DIBP   | <none>                         |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT   |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT   |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013, CLA_EXEMPTION: ECHI
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION | CLIENT_DATE_OF_BIRTH |
      | 1 | 01/04/2013      | <blank>        | ECHI          | 02/04/1995           |
      | 2 | 01/04/2013      | 1234567        | ECHI          | 02/04/1995           |
      | 3 | 01/04/2013      | 1234567        | ECHI          | 02/04/1995           |
      | 4 | 01/04/2013      | 123456         | ECHI          | 02/04/1995           |
      | 5 | 01/04/2013      | 0000000        | ECHI          | 02/04/1995           |
      | 6 | 01/04/2013      | <blank>        | ECHI          | 01/04/1995           |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE         |
      | 1 | DIVB:DIBP   | <none>                        |
      | 2 | DIVB:DIBP   | <none>                        |
      | 3 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_INVALID |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 6 | DIVB:DIBP   | XXLSC_AM_LAR2_ECHI_CAGE_MSG   |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013, CLA_EXEMPTION: EDET
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 01/04/2013      | <blank>        | EDET          |
      | 2 | 01/04/2013      | 1234567        | EDET          |
      | 3 | 01/04/2013      | 1234567        | EDET          |
      | 4 | 01/04/2013      | 123456         | EDET          |
      | 5 | 01/04/2013      | 0000000        | EDET          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE         |
      | 1 | DIVB:DIBP   | <none>                        |
      | 2 | DIVB:DIBP   | <none>                        |
      | 3 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_INVALID |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013, CLA_EXEMPTION: <NONEXISTENT>
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 01/04/2013      | 1234567        | <NONEXISTENT> |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                      |
      | 1 | DIVB:DIBP   | <NONEXISTENT> is not a valid CLA_EXEMPTION |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013 _and_ after 15 May 2020, CLA_EXEMPTION: <NONE>
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 15/05/2020      | <blank>        | <blank>       |
      | 2 | 15/05/2020      | 1234567        | <blank>       |
      | 3 | 15/05/2020      | 1234567        | <blank>       |
      | 4 | 15/05/2020      | 123456         | <blank>       |
      | 5 | 15/05/2020      | 0000000        | <blank>       |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE         |
      | 1 | DIVB:DIBP   | <none>                        |
      | 2 | DIVB:DIBP   | <none>                        |
      | 3 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_INVALID |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013 _and_ after 15 May 2020, CLA_EXEMPTION: EPRE
    Note: EPRE can be used along with an already used CLA_REF_NUMBER
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 15/05/2020      | <blank>        | EPRE          |
      | 2 | 15/05/2020      | 1234567        | EPRE          |
      | 3 | 15/05/2020      | 1234567        | EPRE          |
      | 4 | 15/05/2020      | 123456         | EPRE          |
      | 5 | 15/05/2020      | 0000000        | EPRE          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE        |
      | 1 | DIVB:DIBP   | <none>                       |
      | 2 | DIVB:DIBP   | <none>                       |
      | 3 | DIVB:DIBP   | <none>                       |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013 _and_ after 15 May 2020, CLA_EXEMPTION: ECHI
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION | CLIENT_DATE_OF_BIRTH |
      | 1 | 15/05/2020      | <blank>        | ECHI          | 16/05/2002           |
      | 2 | 15/05/2020      | 1234567        | ECHI          | 16/05/2002           |
      | 3 | 15/05/2020      | 1234567        | ECHI          | 16/05/2002           |
      | 4 | 15/05/2020      | 123456         | ECHI          | 16/05/2002           |
      | 5 | 15/05/2020      | 000000         | ECHI          | 16/05/2002           |
      | 6 | 15/05/2020      | <blank>        | ECHI          | 15/05/2002           |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE         |
      | 1 | DIVB:DIBP   | <none>                        |
      | 2 | DIVB:DIBP   | <none>                        |
      | 3 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_INVALID |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 6 | DIVB:DIBP   | XXLSC_AM_LAR2_ECHI_CAGE_MSG   |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013 _and_ after 15 May 2020, CLA_EXEMPTION: EDET
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 15/05/2020      | <blank>        | EDET          |
      | 2 | 15/05/2020      | 1234567        | EDET          |
      | 3 | 15/05/2020      | 1234567        | EDET          |
      | 4 | 15/05/2020      | 123456         | EDET          |
      | 5 | 15/05/2020      | 0000000        | EDET          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE         |
      | 1 | DIVB:DIBP   | <none>                        |
      | 2 | DIVB:DIBP   | <none>                        |
      | 3 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_INVALID |
      | 4 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |
      | 5 | DIVB:DIBP   | XXLSC_AM_LAR2_CLA_REF_FORMAT  |

  Scenario: Bulkload Civil Debt outcomes with CASE_START_DATE after April 2013 _and_ after 15 May 2020, CLA_EXEMPTION: <NONEXISTENT>
    Given the following Matter Types are chosen:
      | DIVB:DIBP |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | CLA_REF_NUMBER | CLA_EXEMPTION |
      | 1 | 15/05/2020      | <blank>        | <NONEXISTENT> |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                      |
      | 1 | DIVB:DIBP   | <NONEXISTENT> is not a valid CLA_EXEMPTION |
