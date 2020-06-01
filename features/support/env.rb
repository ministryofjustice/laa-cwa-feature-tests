require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'
require 'selenium-webdriver'
require 'site_prism'
require 'builder'

Capybara.register_driver :firefox do |app|
  capabilities = Selenium::WebDriver::Remote::W3C::Capabilities.firefox(
    accept_insecure_certs: true
  )
  options = Selenium::WebDriver::Firefox::Options.new()
  options.args << '--headless' if ENV['HEADLESS'] == 'true'
  options.args << '--incognito'
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
  @config = environment.fetch(ENV.fetch('TEST_ENV').downcase)

  def self.url
    @config['url']
  end

  def self.cwa_provider_user
    @config['cwa_provider_user']
  end

  def self.cwa_provider_user_password
    @config['cwa_provider_user_password']
  end
end

module CWAProvider
  path = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  environment = YAML.safe_load(File.read(path))
  @config = environment.fetch(ENV.fetch('TEST_ENV').downcase)
  @shared = environment.fetch('shared')

  def self.url
    @config['url']
  end

  def self.submissions
    JSON.parse(@config['submissions'].to_json, object_class: OpenStruct).tap do |submissions|
      submissions.each do |submission|
        fields = @shared['valuesets'].find do |valueset|
          valueset['name'] == submission.valueset
        end&.fetch('fields', [])
        submission.lines = fields.map do |field|
          OpenStruct.new(field)
        end
      end
    end
  end

  def self.submission(ref)
    if ref
      id, _ = ref.split('#').last
      submissions.find do |submission|
        submission.id.to_s == id
      end
    end
  end

  def self.errors
    JSON.parse(@shared['errors'].to_json, object_class: OpenStruct)
  end
end

World(PortalEnv, CWAProvider)
