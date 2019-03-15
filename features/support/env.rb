require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'

Capybara.default_driver = :selenium

# Set portal environment specific variables
module PortalEnv
  path = File.join(File.dirname(__FILE__), 'portal_env.yml')
  environment = YAML.safe_load(File.read(path))
  @portal = environment[ENV['TEST_ENV'].downcase]

  def self.url
    @portal['url']
  end

  def self.username
    @portal['username']
  end

  def self.password
    @portal['password']
  end
end

# Set CWA environment specific variables
module CWAEnv
  path = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  environment = YAML.safe_load(File.read(path))
  @cwa = environment[ENV['TEST_ENV'].downcase]

  def self.firmname
    @cwa['firmname']
  end

  def self.account_number
    @cwa['account_number']
  end

  def self.submission_period
    @cwa['submission_period']
  end

  def self.area_of_law
    @cwa['area_of_law']
  end

  def self.submission_ref
    @cwa['submission_ref']
  end
end

World(PortalEnv, CWAEnv)
