require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'

Capybara.default_driver = :selenium

# Set environment specific variables
module PortalEnv
  path = File.join(File.dirname(__FILE__), 'portal_env.yml')
  environment = YAML.safe_load(File.read(path))
  @portal = environment[ENV['TEST_ENV']]

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

World(PortalEnv)
