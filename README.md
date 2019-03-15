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

Set the environment variable `TEST_ENV` with

`export TEST_ENV=dev`

Portal environment specific variables are set in `portal_env.yml` in the following format:

```
dev:
  url: portal-url
  username: username
  password: password
```

The details in this file should match the details in the Portal environment.

CWA environment specific variables are set in `cwa_env.yml` in the following format:

```
dev:
  firmname:
  account_number:
  submission_period:
  area_of_law:
  submission_ref:
```

The details in this file should match the details in the CWA environment.
