#!/bin/bash

export HEADLESS='false'
export TEST_ENV='tst'

# cucumber  --format pretty --expand --format json -o "report.json"

bundle exec parallel_cucumber features/validations -n 3

# bundle exec parallel_cucumber features/validations -n 2 &
# step1_pid=1$!

# bundle exec parallel_cucumber features/pricing -n 2 & 
# step2_pid=2$!

# steps run in parallel

# wait $step1_1
# wait $step2_1


# ruby features/support/report_builder.rb
open cucumber_web_report.html

