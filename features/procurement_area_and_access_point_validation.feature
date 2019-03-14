Feature: Check procurement area and access point validation

Scenario Outline: Add an outcome sucessfully
  Given user is on their sumission details page
  When user adds a valid outcome with <case_id>, <case_start_date>, <procurement_area> and <access_point>
  Then the outcome saves sucessfully with <ufn>

Examples:
  | case_id | case_start_date | procurement_area | access_point | ufn          |
  |    '011'|   '01-Jul-2019' |        'PA00002' |    'AP00000' | '010719/011' |
  |    '012'|   '05-Jul-2019' |        'PA00002' |    'AP00000' | '050719/012' |
  |    '013'|   '05-Jun-2019' |        'PA00002' |    'AP00002' | '050619/013' |
  |    '014'|   '05-Jul-2019' |        'PA00124' |    'AP00000' | '050719/014' |
  |    '015'|   '05-Jun-2019' |        'PA00124' |    'AP00113' | '050619/015' |
  |    '016'|   '05-Jun-2019' |        'PA00125' |    'AP00000' | '050619/016' |

Scenario Outline: Check it errors with invalid combinations
  Given user is on their sumission details page
  When user adds a valid outcome with <case_id>, <case_start_date>, <procurement_area> and <access_point>
  Then the outcome does not save and gives an error

Examples:
  | case_id | case_start_date | procurement_area | access_point |
  |    '017'|   '01-Jul-2019' |        'PA00002' |    'AP00002' |
  |    '018'|   '05-Jun-2019' |        'PA00002' |    'AP00000' |
  |    '019'|   '05-Jun-2019' |        'PA00124' |    'AP00000' |
  |    '020'|   '05-Jul-2019' |        'PA00124' |    'AP00113' |
  |    '021'|   '05-Jul-2019' |        'PA00127' |    'AP00115' |
