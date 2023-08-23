export HEADLESS='true'
export TEST_ENV='tst'
cucumber  --format pretty --expand --format json -o "report.json"  features
ruby features/support/report_builder.rb 
open cucumber_web_report.html