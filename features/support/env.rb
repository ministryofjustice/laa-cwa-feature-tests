require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'
require 'selenium-webdriver'
require 'site_prism'
require 'builder'

Capybara.register_driver :firefox do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
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

module MonthlySubmission 

  path = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  environment = YAML.safe_load(File.read(path))
  @config = environment.fetch(ENV.fetch('TEST_ENV').downcase)

  attr_reader :area_of_law, :account, :submission_period, :schedule_num

  def self.submission_header
    hash = {'area_of_law' => 'LEGAL HELP',
    'account' => '0F238U',
    'submission_period' => 'APR-2020',
    'schedule_num' => '0F238U/CIVIL'
    }
  end
end

module CWAProvider

  path = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  environment = YAML.safe_load(File.read(path))
  @config = environment.fetch(ENV.fetch('TEST_ENV').downcase)
  @shared = environment.fetch('shared')
  @area_of_law = []

  def self.url
    @config['url']
  end

  def self.area_of_law=(aol)
    @area_of_law = aol
  end

  def self.area_of_law
    @area_of_law
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

  def self.submission
    if area_of_law.eql? 'CRIME LOWER'
      crime_lower_submission
    elsif area_of_law.eql? 'LEGAL HELP'
      legal_help_submission
    elsif area_of_law.eql? 'MEDIATION'
      mediation_submission
    else
      raise("Invalid Area of Law #{area_of_law}")
    end
  end

  def self.submission_by_ref(ref) # TODO: change references
    if ref
      id, _ = ref.split('#').last
      submissions.find do |submission|
        submission.id.to_s == id
      end || raise("Missing #{ref} test submission")
    end
  end

  def self.legal_help_submission
    @legal_help_submission ||= OpenStruct.new(submission_for(:legal_help))
  end

  def self.mediation_submission
    @mediation_submission ||= OpenStruct.new(submission_for(:mediation))
  end

   def self.crime_lower_submission
     @crime_lower_submission ||= OpenStruct.new(submission_for(:crime_lower))
   end

  def self.submission_for(area_of_law)
    submissions.find do |submission|
      submission['area_of_law'] == area_of_law.to_s.upcase.tr('_', ' ')
    end
  end

  def self.errors
    JSON.parse(@shared['errors'].to_json, object_class: OpenStruct)
  end

end

World(PortalEnv, CWAProvider, MonthlySubmission)