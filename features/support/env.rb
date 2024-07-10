require 'capybara/cucumber'
require 'rspec/expectations'
require 'byebug'
require 'awesome_print'
require 'selenium-webdriver'
require 'site_prism'
require 'builder'
require 'open-uri'
require 'yaml'
require 'json'
require 'net/http'

if ENV['BROWSER'] == 'chrome'
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--disable-gpu') # Disabling GPU for headless mode stability

  if ENV['HEADLESS'] == 'true'
    options.add_argument("--headless=new") # new headless option
    #options.add_argument('--headless')
  end

  options.accept_insecure_certs = true

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.current_driver = :chrome
  Capybara.default_driver = :chrome
end

if ENV['BROWSER'] == 'firefox'
  Capybara.register_driver :firefox do |app|
    options = Selenium::WebDriver::Firefox::Options.new
    #options.headless! if ENV['HEADLESS'] == 'true'
    options.add_argument('--headless') if ENV['HEADLESS'] == 'true'
    options.add_argument('--incognito')
    
    options.accept_insecure_certs = true

    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: options
    )
  end

  driver_type = ENV['HEADLESS'] == 'true' ? :selenium_headless : :selenium
  Capybara.current_driver = driver_type
  Capybara.default_driver = driver_type
end

# Set portal environment specific variables
module PortalEnv
  #path = File.join(File.dirname(__FILE__), 'portal_env.yml')
  #environment = YAML.safe_load(File.read(path))
  #@config = environment.fetch(ENV.fetch('TEST_ENV').downcase)

  def self.url
    ENV['URL']
    #@config['url']
  end

  def self.cwa_provider_user
    ENV['USERNAME']
    #@config['cwa_provider_user']
  end

  def self.cwa_provider_user_password
    ENV['PASSWORD']
    #@config['cwa_provider_user_password']
  end
end

module CWAProvider
  path = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  environment = YAML.safe_load(File.read(path))
  @config = environment.fetch(ENV.fetch('TEST_ENV').downcase)
  @shared = environment.fetch('shared')
  @area_of_law = []

  def self.set_provider
    api_endpoint = ENV.fetch('CWA_TEST_PROVIDER_API', 'http://localhost:8081')
    url = "#{api_endpoint}/api/provider"

    params = { area_of_law: self.area_of_law, category_of_law: self.category_of_law }
    #params[:category_of_law] = self.category_of_law if self.area_of_law == 'LEGAL HELP'
  
    puts "Parameters: #{params}" # Debugging statement to print out parameters

    uri = URI(url)
    uri.query = URI.encode_www_form(params)

    puts "Fetching provider data from: #{uri}"

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https' # Enable SSL if the API uses HTTPS
  
    request = Net::HTTP::Get.new(uri)
    
    begin
      response = http.request(request)
  
      unless response.is_a?(Net::HTTPSuccess)
        raise "Failed to fetch provider data: #{response.code} #{response.message}"
      end

      puts "Response received: #{response.body}"
  
      @provider = JSON.parse(response.body, object_class: OpenStruct)
    rescue StandardError => e
      raise "Error while fetching provider data: #{e.message}"
    end
  end

  def self.provider 
    @provider
  end

  def self.url
    @config['url']
  end

  def self.ft_api
    TRUE if ENV['FT_API'] == 'true'
  end

  def self.category_of_law=(col)
    @category_of_law = col 
  end

  def self.category_of_law
    @category_of_law
  end

  def self.area_of_law=(aol)
    if ['LEGAL HELP', 'CRIME LOWER', 'MEDIATION'].include? aol
      @area_of_law = aol
    else
      raise("Invalid Area of Law : #{aol}")
    end 
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
    if ft_api
      if provider.nil?
        set_provider
        provider
      else
        provider
      end
    else 
      if area_of_law.eql? 'CRIME LOWER'
        crime_lower_submission
      elsif area_of_law.eql? 'LEGAL HELP'
        legal_help_submission
      elsif area_of_law.eql? 'MEDIATION'
        mediation_submission
      end
    end
  end

  def self.submission_by_ref(ref) # TODO: change references
    if ft_api
      if provider.nil?
        set_provider
        puts self.provider
        self.provider
      else
        self.provider
      end
    else
      if ref
        id, _ = ref.split('#').last
        submissions.find do |submission|
          submission.id.to_s == id
        end || raise("Missing #{ref} test submission")
      end
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

World(PortalEnv, CWAProvider)
