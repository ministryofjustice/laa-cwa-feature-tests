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
  cwa_provider_user: username
  cwa_provider_user_password: password
```

The details in this file should match the details in the Portal environment.

CWA environment specific variables are set in `cwa_env.yml` in the following format:

```
dev:
  url:
  firm_name:
  account_number:
  submissions:
    - area_of_law:
      period:
      reference:
```

The details in this file should match the details in the CWA environment.
