# CWA Feature Tests

Feature tests for CWA in order to replace some of the manual testing.  This work is currently a spike and will be gradually built up over time.

## Setup

Clone the repo

Run `bundle`

## Running tests

Run all features -

`bundle exec cucumber`

Run a single feature -

`bundle exec cucumber features/my_feature.feature`

## Environments

Currently the tests are configured to run against the Test environment, this environment is only accessible when inside the MoJ network. (http://portal.tst.legalservices.gov.uk)
