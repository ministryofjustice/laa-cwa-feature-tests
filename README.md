# CWA Feature Tests

Feature tests for CWA are used to replace some of the manual testing.

This work is being gradually built up over time and should include any new piece
of development done in CWA.

In some cases, feature tests will be used as an exploratory tool and in support
of complex CWA refactoring excercises.

## Setup

After cloning the repository, you'll have to make sure your local development
environment is configured to run the test suite.

Refer to the steps below bearing in mind **these instructions support macOS only**.

### Install Ruby

The version of Ruby specified in the [`.ruby-version`](.ruby-version) file needs
to be installed and activated for the project.

If you already have it, you can skip this step.

Please note: these instructions support the `rbenv` Ruby version management tool
only. Other tools might be more preferrable based on your experience.

#### Install rbenv

Install `rbenv` following the steps available at:
https://github.com/rbenv/rbenv#using-package-managers

After restarting the terminal, make sure you `cd` into this project, then run:
```sh
$ RUBY_VERSION=$(cat .ruby-version) && \
  rbenv install $RUBY_VERSION && \
  rbenv local $RUBY_VERSION && \
  rbenv rehash
```

### Install bundler

```sh
$ gem install bundler
```

### Install dependencies

```sh
$ bundle install
```

### Install Homebrew

You'll need Homebrew to install external dependencies.

To install, follow the steps at: https://brew.sh/

#### Install system dependencies

Once Homebrew is installed, run:

```sh
brew bundle
```

Also note: at this point you'll have to install Firefox if it's not already
present in your system.

### Setup git-crypt

Some files needed to run the test suite are encrypted.

Use the following steps to become a new `git-crypt` collaborator and be able to
unlock them.

#### Generate GPG key

In order to be added as a collaborator you'll need to generate a GPG key.

Please note: if you think you have one already, please run `gpg --list-keys` to
find your pubkey.

To generate a new key, run:

```sh
$ gpg --gen-key
```

When prompted add your full name, your MoJ digital email, and a strong
passphrase.

Take note of the generated pubkey, e.g. 79D7ED31A434E40C4FA019E4A51C74C25D2BE66C
and export it in the terminal:

```sh
$ export GPG_PUBKEY=<PASTE PUBKEY HASH HERE>
```

#### Export the public key

This step will generate a file name containing your pubkey in the
`$HOME/Downloads` directory and assumes you have already followed the steps at
[Generate GPG key](#generate-gpg-key) and in the same terminal window.

Please run:

```sh
$ gpg --armor --export --output $HOME/Downloads/$GPG_PUBKEY.gpg $GPG_PUBKEY
```

Once saved, the file needs to be sent to any user who already have the authority
to add users to `git-crypt` for this project.

Once added as git-crypt collaborator according to
[Adding git-crypt collaborators](#adding-git-crypt-collaborators), you can run:

```sh
$ git checkout main && git pull
$ git-crypt unlock
```

#### Adding git-crypt collaborators

These steps can be performed by anyone who's already a `git-crypt` collaborator
for the project.

##### Import the GPG key

At this stage, the assumption is that a pubkey has been received by the new
collaborator via Slack or email and saved under `$HOME/Downloads` according to
[Export the public key](#export-the-public-key).

Open your terminal and run the following commands:

```sh
$ export GPG_PUBKEY=<PASTE RECEIVED PUBKEY HASH HERE>
```

```sh
$ gpg --import $HOME/Downloads/$GPG_PUBKEY
```

```sh
$ gpg ––edit–key $GPG_PUBKEY
```

This will lead to a prompt where you can get the fingerprint sending the command: 

```
> fpr
```

Select a trust level:

```
> trust
```

After verifying the fingerprint, save changes:

```
> save
```

Finally, quit the prompt:

```
> quit
```

##### Raising new collaborator Pull Request

Create a new branch starting off `main`:

```sh
$ git checkout -b add-new-git-crypt-collaborator-$GPG_PUBKEY
```

Then run:

```sh
$ git-crypt add-gpg-user $GPG_PUBKEY
```

A new commit will be automatically added; raise a Pull Request, tag the new
collaborator and merge it once approved.


## Running tests

To run all features:

```sh
$ bundle exec cucumber
```

To run a single feature:

```sh
$ bundle exec cucumber features/my_feature.feature
```

## Environments and users

Set the environment variable `TEST_ENV` with:

```
export TEST_ENV=dev
```

You can choose between: `dev`, `tst` and `uat`.

Portal environment-specific variables are set in
[`portal_env.yml`](features/support/portal_env.yml) in the following format:

```yaml
dev:
  url: portal-url
  cwa_provider_user: username
  cwa_provider_user_password: password
...
```

The details in this file should match the details in the Portal environment.

CWA environment-specific variables are set in
[`cwa_env.yml`](features/support/cwa_env.yml) in the following format:

```yaml
dev:
  url:
  firm_name:
  account_number:
  submissions:
    - area_of_law:
      period:
      reference:
...
```

The details in this file should match the details in the CWA environment.

## Runtime configuration

### Run tests in Headless mode

In order to gain more speed and be able to run tests in an environment that does
not have desktop virtualization available, you can run tests in Headless mode
with:

```sh
export HEADLESS=true
```

This is currently configured to work with Firefox only and it may not work for some features.

For more information about the Headless mode please have a look at
[this doc](https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Headless_mode).

### Debugging

To enable debugging at runtime, you can enable debugging for failing test
scenarios with:

```sh
$ export DEBUG_FAILURES=true
```

You can also use the `byebug` to debug the step definitions.

Ff you are not familiar with the tool or as a refresher, refer to
[these commands](https://github.com/deivid-rodriguez/byebug#byebugs-commands)
and [this guide](https://github.com/deivid-rodriguez/byebug/blob/master/GUIDE.md#guide).
