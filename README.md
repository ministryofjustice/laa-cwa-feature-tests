# CWA Feature Tests

Feature tests for CWA in order to replace some of the manual testing.  This work is currently a spike and will be gradually built up over time.

## Setup

Install geckodriver

`brew install geckodriver`

Clone the repo

Run `bundle`

## Running tests

Run all features -

`bundle exec cucumber`

Run a single feature -

`bundle exec cucumber features/my_feature.feature`

## Environments and users

Currently the tests are configured to run against the Test environment, this environment is only accessible when inside the MoJ network. (http://portal.tst.legalservices.gov.uk)

The log in test logs in using the USERNAME and PASSWORD environment
variables which you should set before running the test.  You also need to ensure that the user exists in the test environment.  

For the CWA open provider submission feature you will need to set the firm details as well.  

Examples of values given below, please note value must match data already present in the environment.

```
export USERNAME=test
export PASSWORD=password
export FIRMNAME="EXAMPLE SOLICITORS"
export ACCOUNT_NUMBER=0A123B
export PERIOD=DEC-2010
export AREA_OF_LAW="LEGAL HELP"
export SUBMISSION_REF=0A123B/11.2
```
