require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'
require 'selenium-webdriver'
require 'site_prism'
require 'builder'
require_relative 'portal_env'
require_relative 'cwa_provider'

# Additional setup code
CWAProvider.set_environment(ENV['TEST_ENV'] || 'dev')
CWAProvider.set_use_api(ENV['USE_API'] == 'true')
CWAProvider.set_logging(ENV['CWA_PROVIDER_LOGGING'] == 'true')
CWAProvider.api_url = ENV['API_URL']

Capybara.register_driver :firefox do |app|
  options = Selenium::WebDriver::Options.firefox(
    accept_insecure_certs: true
  )
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('--headless') if ENV['HEADLESS'] == 'true'
  options.add_argument('--incognito')
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options
  )
end

Capybara.default_driver = :firefox
Capybara.default_max_wait_time = 5

World(PortalEnv, CWAProvider)
