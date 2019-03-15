require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'

Capybara.default_driver = :selenium

# Set environment specific variables
path = File.join(File.dirname(__FILE__), 'environments.yml')
environments = YAML.safe_load(File.read(path))
$portal = environments['portal'][ENV['TEST_ENV']]
$cwa = environments['cwa'][ENV['TEST_ENV']]
