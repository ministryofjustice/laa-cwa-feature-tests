# Use the ruby:2.7-slim base image
FROM --platform=linux/amd64 ruby:2.7-slim

# Set environment variables for Oracle Instant Client
ENV ORACLE_HOME /opt/oracle/instantclient
ENV LD_LIBRARY_PATH /opt/oracle/instantclient
ENV PATH=$PATH:$ORACLE_HOME

# Install Oracle Instant Client and other necessary dependencies
RUN apt-get update \
    && apt-get install -y libaio1 wget unzip \
    && apt-get install -y build-essential  \
    && apt-get -y install vim \
    && mkdir -p /opt/oracle \
    && cd /opt/oracle \
    && wget https://download.oracle.com/otn_software/linux/instantclient/2340000/instantclient-basiclite-linux.x64-23.4.0.24.05.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/2340000/instantclient-sqlplus-linux.x64-23.4.0.24.05.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/2340000/instantclient-sdk-linux.x64-23.4.0.24.05.zip \
    && unzip -o instantclient-basiclite-linux.x64-23.4.0.24.05.zip -d /opt/oracle/instantclient \
    && unzip -o instantclient-sqlplus-linux.x64-23.4.0.24.05.zip -d /opt/oracle/instantclient \
    && unzip -o instantclient-sdk-linux.x64-23.4.0.24.05.zip -d /opt/oracle/instantclient \
    && rm instantclient-basiclite-linux.x64-23.4.0.24.05.zip instantclient-sqlplus-linux.x64-23.4.0.24.05.zip instantclient-sdk-linux.x64-23.4.0.24.05.zip\
    && cd instantclient \
    && mv instantclient_23_4/* .  \
    && echo /opt/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf \
    && ldconfig


# Install geckodriver and ceritificates
RUN apt-get install -y --no-install-recommends ca-certificates curl firefox-esr \
 && rm -fr /var/lib/apt/lists/* \
 && curl -L https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz | tar xz -C /usr/local/bin

# Copy your Ruby application files to the container (if needed)
# COPY . .
RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app

# Set any other environment variables you may need (if applicable)
# ENV RAILS_ENV production
ENV TEST_ENV=tst
ENV HEADLESS=true

# Install all ruby gems from gemfile
RUN bundle config set --local with docker
RUN gem update --system 3.2.3
RUN bundle install

# Install the ruby-oci8 gem
RUN gem install ruby-oci8


# Add new user to execute tests
RUN groupadd -g 2000 testgroup && useradd -g testgroup testuser -u 1000 -m

### Update ownership for local repository and tests
RUN chown testuser:testgroup -R /usr/src/app

### Switch user to testuser
USER 1000

# Start your Ruby application (if applicable)
# CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD bundle exec cucumber
# CMD ruby dbconnect.rb

CMD bundle exec cucumber
