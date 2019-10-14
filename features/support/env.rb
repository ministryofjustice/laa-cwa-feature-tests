require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'
require 'selenium-webdriver'
require 'site_prism'

Capybara.register_driver :firefox do |app|
  capabilities = Selenium::WebDriver::Remote::W3C::Capabilities.firefox(
    accept_insecure_certs: true
  )
  options = Selenium::WebDriver::Firefox::Options.new()
  options.args << '--headless' if ENV['HEADLESS'] == 'true'
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    marionette: true,
    desired_capabilities: capabilities,
    options: options
  )
end

Capybara.default_driver = :firefox
Capybara.default_max_wait_time = 5

# Set portal environment specific variables
module PortalEnv
  path = File.join(File.dirname(__FILE__), 'portal_env.yml')
  environment = YAML.safe_load(File.read(path))
  @portal = environment.fetch(ENV.fetch('TEST_ENV').downcase)

  def self.url
    @portal['url']
  end

  def self.cwa_provider_user
    @portal['cwa_provider_user']
  end

  def self.cwa_provider_user_password
    @portal['cwa_provider_user_password']
  end
end

module CWAProvider
  path = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  environment = YAML.safe_load(File.read(path))
  @cwa = environment.fetch(ENV.fetch('TEST_ENV').downcase)

  def self.url
    @cwa['url']
  end

  def self.firm_name
    @cwa['firm_name']
  end

  def self.account_number
    @cwa['account_number']
  end

  def self.submissions
    @cwa['submissions']
  end

  def self.legal_help_submission
    @legal_help_submission ||= OpenStruct.new(submission_for(:legal_help))
  end

  def self.crime_lower_submission
    @crime_lower_submission ||= OpenStruct.new(submission_for(:crime_lower))
  end

  def self.submission_for(area_of_law)
    submissions.find do |submission|
      submission['area_of_law'] == area_of_law.to_s.upcase.tr('_', ' ')
    end
  end
end

World(PortalEnv, CWAProvider)
