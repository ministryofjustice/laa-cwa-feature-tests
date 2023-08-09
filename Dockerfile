# Use the ruby:2.7-slim base image
FROM --platform=linux/amd64 ruby:2.7-slim

# Set environment variables for Oracle Instant Client
ENV ORACLE_HOME /opt/oracle/instantclient
ENV LD_LIBRARY_PATH /opt/oracle/instantclient
ENV PATH=$PATH:$ORACLE_HOME

# Add new user to execute tests
RUN groupadd -g 2000 testgroup && useradd -g testgroup testuser -u 1000 -m

# Install Oracle Instant Client and other necessary dependencies
RUN apt-get update \
    && apt-get install -y libaio1 wget unzip \
    && mkdir -p /opt/oracle \
    && cd /opt/oracle \
    && wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-sqlplus-linuxx64.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-sdk-linuxx64.zip \
    && unzip instantclient-basiclite-linuxx64.zip -d /opt/oracle/instantclient \
    && unzip instantclient-sqlplus-linuxx64.zip -d /opt/oracle/instantclient \
    && unzip instantclient-sdk-linuxx64.zip -d /opt/oracle/instantclient \
    && rm instantclient-basiclite-linuxx64.zip instantclient-sqlplus-linuxx64.zip instantclient-sdk-linuxx64.zip\
    && cd instantclient \
    && mv instantclient_21_11/* .  \
    && echo /opt/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf \
    && ldconfig

RUN apt-get install -y build-essential

# Install geckodriver and ceritificates
RUN apt-get install -y --no-install-recommends ca-certificates curl firefox-esr \
 && rm -fr /var/lib/apt/lists/* \
 && curl -L https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz | tar xz -C /usr/local/bin \
 && apt-get purge -y ca-certificates curl


# Copy your Ruby application files to the container (if needed)
# COPY . .
RUN mkdir -p /usr/src/app
COPY . /usr/src/app
### Update ownership for local repository and tests
RUN chown testuser:testgroup -R /usr/src/app

### Switch user to testuser
USER 1000
WORKDIR /usr/src/app

# Set any other environment variables you may need (if applicable)
# ENV RAILS_ENV production
ENV TEST_ENV=tst
ENV HEADLESS=true

# Install all ruby gems from gemfile
RUN bundle install

# Install the ruby-oci8 gem
RUN gem install ruby-oci8

# Start your Ruby application (if applicable)
# CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD bundle exec cucumber
# CMD ruby dbconnect.rb
