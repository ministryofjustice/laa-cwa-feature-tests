@bulkload
Feature: HLPAS Bulk load validations

  Background: 
    Given a test firm user is logged in CWA
    And user prepares to submit outcomes for test provider "LEGAL HELP.ELA#16"

  Scenario: Bulkload HLPAS outcomes
    Given the following Matter Types are chosen:
      | LDIB:LBEN |
      | LDIB:LOTH |
      | LDOS:LPUB |
      | LDOS:LPRI |
      | LDOS:LHAC |
      | LDOS:LOWN |
      | LDOS:LHLS |
      | LDOS:LCRE |
      | LDOS:LIBP |
      | LDOS:LSCH |
      | LDOS:LVAL |
      | LDOS:LMIX |
      | LDOS:LBEN |
      | LDOS:LOTH |
      | LDOT:LPUB |
      | LDOT:LPRI |
      | LDOT:LHAC |
      | LDOT:LOWN |
      | LDOT:LHLS |
      | LDOT:LCRE |
      | LDOT:LIBP |
      | LDOT:LSCH |
      | LDOT:LVAL |
      | LDOT:LMIX |
      | LDOT:LBEN |
      | LDOT:LOTH |
      | LWCB:LPUB |
      | LWCB:LPRI |
      | LWCB:LHAC |
      | LWCB:LOWN |
      | LWCB:LHLS |
      | LWCB:LCRE |
      | LWCB:LIBP |
      | LWCB:LSCH |
      | LWCB:LVAL |
      | LWCB:LMIX |
      | LWCB:LBEN |
      | LWCB:LOTH |
      | LWRA:LPRI |
      | LWRA:LHAC |
      | LWRA:LOWN |
      | LWRA:LHLS |
      | LWRA:LCRE |
      | LWRA:LIBP |
      | LWRA:LSCH |
      | LWRA:LVAL |
      | LWRA:LMIX |
      | LWRA:LBEN |
      | LWRA:LOTH |
      | LWRV:LPUB |
      | LWRV:LPRI |
      | LWRV:LHAC |
      | LWRV:LOWN |
      | LWRV:LHLS |
      | LWRV:LCRE |
      | LWRV:LIBP |
      | LWRV:LSCH |
      | LWRV:LVAL |
      | LWRV:LMIX |
      | LWRV:LBEN |
      | LWRV:LOTH |
      | LWAP:LPUB |
      | LWAP:LPRI |
      | LWAP:LHAC |
      | LWAP:LOWN |
      | LWAP:LHLS |
      | LWAP:LCRE |
      | LWAP:LIBP |
      | LWAP:LSCH |
      | LWAP:LVAL |
      | LWAP:LMIX |
      | LWAP:LBEN |
      | LWAP:LOTH |
      | LWOV:LPUB |
      | LWOV:LPRI |
      | LWOV:LHAC |
      | LWOV:LOWN |
      | LWOV:LHLS |
      | LWOV:LCRE |
      | LWOV:LIBP |
      | LWOV:LSCH |
      | LWOV:LVAL |
      | LWOV:LMIX |
      | LWOV:LBEN |
      | LWOV:LOTH |
      | LWBD:LPUB |
      | LWBD:LPRI |
      | LWBD:LHAC |
      | LWBD:LOWN |
      | LWBD:LHLS |
      | LWBD:LCRE |
      | LWBD:LIBP |
      | LWBD:LSCH |
      | LWBD:LVAL |
      | LWBD:LMIX |
      | LWBD:LBEN |
      | LWBD:LOTH |
      | LWLG:LPUB |
      | LWLG:LPRI |
      | LWLG:LHAC |
      | LWLG:LOWN |
      | LWLG:LHLS |
      | LWLG:LCRE |
      | LWLG:LIBP |
      | LWLG:LSCH |
      | LWLG:LVAL |
      | LWLG:LMIX |
      | LWLG:LBEN |
      | LWLG:LOTH |
      | LWOT:LPUB |
      | LWOT:LPRI |
      | LWOT:LHAC |
      | LWOT:LOWN |
      | LWOT:LHLS |
      | LWOT:LCRE |
      | LWOT:LIBP |
      | LWOT:LSCH |
      | LWOT:LVAL |
      | LWOT:LMIX |
      | LWOT:LBEN |
      | LWOT:LOTH |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |      01/06/2024 | LA           | LA            | HP00001          |
    Then the following results are expected:
      | #   | MATTER_TYPE | ERROR_CODE_OR_MESSAGE |
      |   1 | LDOS:LPUB   | <none>                |
      |   2 | LDIB:LBEN   | <none>                |
      |   3 | LDIB:LOTH   | <none>                |
      |   4 | LDOS:LPUB   | <none>                |
      |   5 | LDOS:LPRI   | <none>                |
      |   6 | LDOS:LHAC   | <none>                |
      |   7 | LDOS:LOWN   | <none>                |
      |   8 | LDOS:LHLS   | <none>                |
      |   9 | LDOS:LCRE   | <none>                |
      |  10 | LDOS:LIBP   | <none>                |
      |  11 | LDOS:LSCH   | <none>                |
      |  12 | LDOS:LVAL   | <none>                |
      |  13 | LDOS:LMIX   | <none>                |
      |  14 | LDOS:LBEN   | <none>                |
      |  15 | LDOS:LOTH   | <none>                |
      |  16 | LDOT:LPUB   | <none>                |
      |  17 | LDOT:LPRI   | <none>                |
      |  18 | LDOT:LHAC   | <none>                |
      |  19 | LDOT:LOWN   | <none>                |
      |  20 | LDOT:LHLS   | <none>                |
      |  21 | LDOT:LCRE   | <none>                |
      |  22 | LDOT:LIBP   | <none>                |
      |  23 | LDOT:LSCH   | <none>                |
      |  24 | LDOT:LVAL   | <none>                |
      |  25 | LDOT:LMIX   | <none>                |
      |  26 | LDOT:LBEN   | <none>                |
      |  27 | LDOT:LOTH   | <none>                |
      |  28 | LWCB:LPUB   | <none>                |
      |  29 | LWCB:LPRI   | <none>                |
      |  30 | LWCB:LHAC   | <none>                |
      |  31 | LWCB:LOWN   | <none>                |
      |  32 | LWCB:LHLS   | <none>                |
      |  33 | LWCB:LCRE   | <none>                |
      |  34 | LWCB:LIBP   | <none>                |
      |  35 | LWCB:LSCH   | <none>                |
      |  36 | LWCB:LVAL   | <none>                |
      |  37 | LWCB:LMIX   | <none>                |
      |  38 | LWCB:LBEN   | <none>                |
      |  39 | LWCB:LOTH   | <none>                |
      |  40 | LWRA:LPRI   | <none>                |
      |  41 | LWRA:LHAC   | <none>                |
      |  42 | LWRA:LOWN   | <none>                |
      |  43 | LWRA:LHLS   | <none>                |
      |  44 | LWRA:LCRE   | <none>                |
      |  45 | LWRA:LIBP   | <none>                |
      |  46 | LWRA:LSCH   | <none>                |
      |  47 | LWRA:LVAL   | <none>                |
      |  48 | LWRA:LMIX   | <none>                |
      |  49 | LWRA:LBEN   | <none>                |
      |  50 | LWRA:LOTH   | <none>                |
      |  51 | LWRV:LPUB   | <none>                |
      |  52 | LWRV:LPRI   | <none>                |
      |  53 | LWRV:LHAC   | <none>                |
      |  54 | LWRV:LOWN   | <none>                |
      |  55 | LWRV:LHLS   | <none>                |
      |  56 | LWRV:LCRE   | <none>                |
      |  57 | LWRV:LIBP   | <none>                |
      |  58 | LWRV:LSCH   | <none>                |
      |  59 | LWRV:LVAL   | <none>                |
      |  60 | LWRV:LMIX   | <none>                |
      |  61 | LWRV:LBEN   | <none>                |
      |  62 | LWRV:LOTH   | <none>                |
      |  63 | LWAP:LPUB   | <none>                |
      |  64 | LWAP:LPRI   | <none>                |
      |  65 | LWAP:LHAC   | <none>                |
      |  66 | LWAP:LOWN   | <none>                |
      |  67 | LWAP:LHLS   | <none>                |
      |  68 | LWAP:LCRE   | <none>                |
      |  69 | LWAP:LIBP   | <none>                |
      |  70 | LWAP:LSCH   | <none>                |
      |  71 | LWAP:LVAL   | <none>                |
      |  73 | LWAP:LMIX   | <none>                |
      |  74 | LWAP:LBEN   | <none>                |
      |  75 | LWAP:LOTH   | <none>                |
      |  76 | LWOV:LPUB   | <none>                |
      |  77 | LWOV:LPRI   | <none>                |
      |  78 | LWOV:LHAC   | <none>                |
      |  79 | LWOV:LOWN   | <none>                |
      |  80 | LWOV:LHLS   | <none>                |
      |  81 | LWOV:LCRE   | <none>                |
      |  82 | LWOV:LIBP   | <none>                |
      |  83 | LWOV:LSCH   | <none>                |
      |  84 | LWOV:LVAL   | <none>                |
      |  85 | LWOV:LMIX   | <none>                |
      |  86 | LWOV:LBEN   | <none>                |
      |  87 | LWOV:LOTH   | <none>                |
      |  88 | LWBD:LPUB   | <none>                |
      |  89 | LWBD:LPRI   | <none>                |
      |  90 | LWBD:LHAC   | <none>                |
      |  91 | LWBD:LOWN   | <none>                |
      |  92 | LWBD:LHLS   | <none>                |
      |  93 | LWBD:LCRE   | <none>                |
      |  94 | LWBD:LIBP   | <none>                |
      |  95 | LWBD:LSCH   | <none>                |
      |  96 | LWBD:LVAL   | <none>                |
      |  97 | LWBD:LMIX   | <none>                |
      |  98 | LWBD:LBEN   | <none>                |
      |  99 | LWBD:LOTH   | <none>                |
      | 100 | LWLG:LPUB   | <none>                |
      | 101 | LWLG:LPRI   | <none>                |
      | 102 | LWLG:LHAC   | <none>                |
      | 103 | LWLG:LOWN   | <none>                |
      | 104 | LWLG:LHLS   | <none>                |
      | 105 | LWLG:LCRE   | <none>                |
      | 106 | LWLG:LIBP   | <none>                |
      | 107 | LWLG:LSCH   | <none>                |
      | 108 | LWLG:LVAL   | <none>                |
      | 109 | LWLG:LMIX   | <none>                |
      | 110 | LWLG:LBEN   | <none>                |
      | 111 | LWLG:LOTH   | <none>                |
      | 112 | LWOT:LPUB   | <none>                |
      | 113 | LWOT:LPRI   | <none>                |
      | 114 | LWOT:LHAC   | <none>                |
      | 115 | LWOT:LOWN   | <none>                |
      | 116 | LWOT:LHLS   | <none>                |
      | 117 | LWOT:LCRE   | <none>                |
      | 118 | LWOT:LIBP   | <none>                |
      | 119 | LWOT:LSCH   | <none>                |
      | 120 | LWOT:LVAL   | <none>                |
      | 121 | LWOT:LMIX   | <none>                |
      | 122 | LWOT:LBEN   | <none>                |
      | 123 | LWOT:LOTH   | <none>                |

  Scenario: Bulkload HLPAS outcomes with all procurement area codes, outcome codes, stage reach codes
    Given the following Matter Types are chosen:
      | LDIB:LBEN |
    And the following outcomes are bulkloaded:
      | #   | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      |   1 |      01/06/2024 | LA           | LA            | HP00001          |
      |   2 |      01/06/2024 | LB           | LB            | HP00002          |
      |   3 |      01/06/2024 | LC           | LC            | HP00003          |
      |   4 |      01/06/2024 | LD           | LA            | HP00004          |
      |   5 |      01/06/2024 | LE           | LA            | HP00005          |
      |   6 |      01/06/2024 | LF           | LA            | HP00006          |
      |   7 |      01/06/2024 | LG           | LA            | HP00007          |
      |   8 |      01/06/2024 | LH           | LA            | HP00008          |
      |   9 |      01/06/2024 | LI           | LA            | HP00009          |
      |  10 |      01/06/2024 | LJ           | LA            | HP00010          |
      |  11 |      01/06/2024 | LK           | LA            | HP00011          |
      |  12 |      01/06/2024 | LL           | LA            | HP00012          |
      |  13 |      01/06/2024 | LM           | LA            | HP00013          |
      |  14 |      01/06/2024 | LN           | LA            | HP00014          |
      |  15 |      01/06/2024 | LO           | LA            | HP00015          |
      |  16 |      01/06/2024 | LP           | LA            | HP00016          |
      |  17 |      01/06/2024 | LQ           | LA            | HP00017          |
      |  18 |      01/06/2024 | LR           | LA            | HP00018          |
      |  19 |      01/06/2024 | LS           | LA            | HP00019          |
      |  20 |      01/06/2024 | LT           | LA            | HP00020          |
      |  21 |      01/06/2024 | LU           | LA            | HP00021          |
      |  22 |      01/06/2024 | LV           | LA            | HP00022          |
      |  23 |      01/06/2024 | LW           | LA            | HP00023          |
      |  24 |      01/06/2024 | LX           | LA            | HP00024          |
      |  25 |      01/06/2024 | LY           | LA            | HP00025          |
      |  26 |      01/06/2024 | LZ           | LA            | HP00026          |
      |  27 |      01/06/2024 | LA           | LA            | HP00027          |
      |  28 |      01/06/2024 | LA           | LA            | HP00028          |
      |  29 |      01/06/2024 | LA           | LA            | HP00029          |
      |  30 |      01/06/2024 | LA           | LA            | HP00030          |
      |  31 |      01/06/2024 | LA           | LA            | HP00031          |
      |  32 |      01/06/2024 | LA           | LA            | HP00032          |
      |  33 |      01/06/2024 | LA           | LA            | HP00033          |
      |  34 |      01/06/2024 | LA           | LA            | HP00034          |
      |  35 |      01/06/2024 | LA           | LA            | HP00035          |
      |  36 |      01/06/2024 | LA           | LA            | HP00036          |
      |  37 |      01/06/2024 | LA           | LA            | HP00037          |
      |  38 |      01/06/2024 | LA           | LA            | HP00038          |
      |  39 |      01/06/2024 | LA           | LA            | HP00039          |
      |  40 |      01/06/2024 | LA           | LA            | HP00040          |
      |  41 |      01/06/2024 | LA           | LA            | HP00041          |
      |  42 |      01/06/2024 | LA           | LA            | HP00042          |
      |  43 |      01/06/2024 | LA           | LA            | HP00043          |
      |  44 |      01/06/2024 | LA           | LA            | HP00044          |
      |  45 |      01/06/2024 | LA           | LA            | HP00045          |
      |  46 |      01/06/2024 | LA           | LA            | HP00046          |
      |  47 |      01/06/2024 | LA           | LA            | HP00047          |
      |  48 |      01/06/2024 | LA           | LA            | HP00048          |
      |  49 |      01/06/2024 | LA           | LA            | HP00049          |
      |  51 |      01/06/2024 | LA           | LA            | HP00050          |
      |  52 |      01/06/2024 | LA           | LA            | HP00051          |
      |  53 |      01/06/2024 | LA           | LA            | HP00052          |
      |  54 |      01/06/2024 | LA           | LA            | HP00053          |
      |  55 |      01/06/2024 | LA           | LA            | HP00054          |
      |  56 |      01/06/2024 | LA           | LA            | HP00055          |
      |  57 |      01/06/2024 | LA           | LA            | HP00056          |
      |  58 |      01/06/2024 | LA           | LA            | HP00057          |
      |  59 |      01/06/2024 | LA           | LA            | HP00058          |
      |  60 |      01/06/2024 | LA           | LA            | HP00059          |
      |  61 |      01/06/2024 | LA           | LA            | HP00060          |
      |  62 |      01/06/2024 | LA           | LA            | HP00061          |
      |  63 |      01/06/2024 | LA           | LA            | HP00062          |
      |  64 |      01/06/2024 | LA           | LA            | HP00063          |
      |  65 |      01/06/2024 | LA           | LA            | HP00064          |
      |  66 |      01/06/2024 | LA           | LA            | HP00065          |
      |  67 |      01/06/2024 | LA           | LA            | HP00066          |
      |  68 |      01/06/2024 | LA           | LA            | HP00067          |
      |  69 |      01/06/2024 | LA           | LA            | HP00068          |
      |  70 |      01/06/2024 | LA           | LA            | HP00069          |
      |  71 |      01/06/2024 | LA           | LA            | HP00070          |
      |  72 |      01/06/2024 | LA           | LA            | HP00071          |
      |  73 |      01/06/2024 | LA           | LA            | HP00072          |
      |  74 |      01/06/2024 | LA           | LA            | HP00073          |
      |  75 |      01/06/2024 | LA           | LA            | HP00074          |
      |  76 |      01/06/2024 | LA           | LA            | HP00075          |
      |  77 |      01/06/2024 | LA           | LA            | HP00076          |
      |  78 |      01/06/2024 | LA           | LA            | HP00077          |
      |  79 |      01/06/2024 | LA           | LA            | HP00078          |
      |  80 |      01/06/2024 | LA           | LA            | HP00079          |
      |  81 |      01/06/2024 | LA           | LA            | HP00080          |
      |  82 |      01/06/2024 | LA           | LA            | HP00081          |
      |  83 |      01/06/2024 | LA           | LA            | HP00082          |
      |  84 |      01/06/2024 | LA           | LA            | HP00083          |
      |  85 |      01/06/2024 | LA           | LA            | HP00084          |
      |  86 |      01/06/2024 | LA           | LA            | HP00085          |
      |  87 |      01/06/2024 | LA           | LA            | HP00086          |
      |  88 |      01/06/2024 | LA           | LA            | HP00087          |
      |  89 |      01/06/2024 | LA           | LA            | HP00088          |
      |  90 |      01/06/2024 | LA           | LA            | HP00089          |
      |  91 |      01/06/2024 | LA           | LA            | HP00090          |
      |  92 |      01/06/2024 | LA           | LA            | HP00091          |
      |  93 |      01/06/2024 | LA           | LA            | HP00092          |
      |  94 |      01/06/2024 | LA           | LA            | HP00093          |
      |  95 |      01/06/2024 | LA           | LA            | HP00094          |
      |  96 |      01/06/2024 | LA           | LA            | HP00095          |
      |  97 |      01/06/2024 | LA           | LA            | HP00096          |
      |  98 |      01/06/2024 | LA           | LA            | HP00097          |
      |  99 |      01/06/2024 | LA           | LA            | HP00098          |
      | 100 |      01/06/2024 | LA           | LA            | HP00099          |
      | 101 |      01/06/2024 | LA           | LA            | HP00100          |
      | 102 |      01/06/2024 | LA           | LA            | HP00101          |
      | 103 |      01/06/2024 | LA           | LA            | HP00102          |
      | 104 |      01/06/2024 | LA           | LA            | HP00103          |
      | 105 |      01/06/2024 | LA           | LA            | HP00104          |
      | 106 |      01/06/2024 | LA           | LA            | HP00105          |
      | 107 |      01/06/2024 | LA           | LA            | HP00106          |
      | 108 |      01/06/2024 | LA           | LA            | HP00107          |
      | 109 |      01/06/2024 | LA           | LA            | HP00108          |
      | 110 |      01/06/2024 | LA           | LA            | HP00109          |
      | 111 |      01/06/2024 | LA           | LA            | HP00110          |
    Then there should be no problem outcomes
    Then user confirms the submission

  Scenario: Bulkload HLPAS outcomes with invalid procurement area codes for ecf matter
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA | EXCL_CASE_FUNDING_REF |
      | 1 |      01/06/2024 | LA           | LA            | HP00001          |             1234567AB |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                             |
      | 1 | LWOT:LCRE   | It has been indicated that the matter has Exceptional Case Funding (as an ECF Reference has been recorded in the outcome details). The PA and AP must be populated with the values: ECF Matter (PA20000/AP20000). |

  Scenario: Bulkload HLPAS outcomes with valid procurement area codes for ecf matter
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA | ACCESS_POINT | EXCL_CASE_FUNDING_REF |
      | 1 |      01/06/2024 | LA           | LA            | PA20000          | AP20000      |             1234567AB |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE |
      | 1 | LWOT:LCRE   | <none>                |

  Scenario: Bulkload HLPAS outcomes with duplicate claims
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |     001 |      01/06/2024 | LA           | LA            | HP00001          |
      | 2 |     001 |      01/06/2024 | LB           | LB            | HP00002          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                        |
      | 1 | LWOT:LCRE   | The UFN you have entered has been used for a previous Legal Help outcome reported under this office account number 0J180R. Please enter a unique UFN number. You may need to change the Case ID to ensure that UFN is valid. |

  Scenario: Bulkload HLPAS outcomes with duplicate claims
    Given the following Matter Types are chosen:
      | LWOT:LCRE |
    And the following outcomes are bulkloaded:
      | # | CASE_ID | CLIENT_DATE_OF_BIRTH | UCN             | CASE_START_DATE | OUTCOME_CODE | STAGE_REACHED | PROCUREMENT_AREA |
      | 1 |     001 |           14/06/1963 | 14061963/T/PERS |      01/06/2024 | LA           | LA            | HP00001          |
      | 2 |     001 |           14/06/1962 | 14061962/T/PERS |      01/06/2024 | LB           | LB            | HP00002          |
    Then the following results are expected:
      | # | MATTER_TYPE | ERROR_CODE_OR_MESSAGE                                                                                                                                                                                                        |
      | 1 | LWOT:LCRE   | The UFN you have entered has been used for a previous Legal Help outcome reported under this office account number 0J180R. Please enter a unique UFN number. You may need to change the Case ID to ensure that UFN is valid. |
