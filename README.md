# CWA Feature Tests

Feature tests for CWA in order to replace some of the manual testing. This work will be gradually built up over time and should include any new piece of development done in CWA.

## Setup

Install geckodriver

`brew install geckodriver`

Clone the repo, cd into it, install dependencies

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

## Runtime configuration

### Run tests in Headless mode

You can you set the `HEADLESS=true` env if you want to run tests in headless mode,
in order to gain more speed and be able to run them in an environment that does not
have desktop virtualization available.
This is currently setup for Firefox only and it doesn't work for some features, as
they may require popup windows to be opened (so extra configuration is needed).
For more information about the Headless mode please have a look at [this doc](https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Headless_mode).

### Debugging

An optional `DEBUG_FAILURES=true` env can be set to step with the debugger into failed
scenarios with `byebug`. This can be useful to investigate the context of a failure,
for instance to be able to look at the latest opened window or instance variables.

### Removing Bulkload files

An optional `BULKLOAD_TMP_DELETE=false` env can be set to ensure that any dynamically
created bulkload files are not automatically deleted after feature tests have completed.
These files are found in features\support\bulkload\fixtures\tmp.
