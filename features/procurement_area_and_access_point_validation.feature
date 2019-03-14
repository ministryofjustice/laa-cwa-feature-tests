Feature: Check procurement area and access point validation

Scenario Outline: Add an outcome sucessfully
  Given user is on their sumission details page
  When user adds a valid outcome with <case_id>, <case_start_date>, <procurement_area> and <access_point>
  Then the outcome saves sucessfully

Examples:
  | case_id | case_start_date | procurement_area | access_point |
  |    '001'|   '01-Jul-2019' |        'PA00002' |    'AP00000' |
  |    '002'|   '05-Jul-2019' |        'PA00002' |    'AP00000' |
  |    '003'|   '05-Jun-2019' |        'PA00002' |    'AP00002' |
  |    '004'|   '05-Jul-2019' |        'PA00124' |    'AP00000' |
  |    '005'|   '05-Jun-2019' |        'PA00124' |    'AP00113' |
  |    '006'|   '05-Jun-2019' |        'PA00125' |    'AP00000' |

Scenario Outline: Check it errors with invalid combinations
  Given user is on their sumission details page
  When user adds a valid outcome with <case_id>, <case_start_date>, <procurement_area> and <access_point>
  Then the outcome does not save and gives an error

Examples:
  | case_id | case_start_date | procurement_area | access_point |
  |    '007'|   '01-Jul-2019' |        'PA00002' |    'AP00002' |
  |    '008'|   '05-Jun-2019' |        'PA00002' |    'AP00000' |
  |    '009'|   '05-Jun-2019' |        'PA00124' |    'AP00000' |
  |    '010'|   '05-Jul-2019' |        'PA00124' |    'AP00113' |
  |    '011'|   '05-Jul-2019' |        'PA00127' |    'AP00115' |
