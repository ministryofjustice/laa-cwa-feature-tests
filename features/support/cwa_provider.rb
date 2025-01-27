require 'yaml'
require 'json'
require 'ostruct'
require 'net/http'
require 'uri'
require 'awesome_print'

module CWAProvider
  CONFIG_FILE = File.join(File.dirname(__FILE__), 'cwa_env.yml')
  CRIME_LOWER = 'CRIME LOWER'
  LEGAL_HELP = 'LEGAL HELP'
  MEDIATION = 'MEDIATION'

  DIRECTORY_TO_LH_CATEGORY_MAP = {
    'claims_against_public_authorities' => 'AAP',
    'clinical_negligence' => 'MED',
    'community_care' => 'COM',
    'consumer_general_contract' => 'CON',
    'debt' => 'DEB',
    'discrimination' => 'DISC',
    'early_legal_advice' => 'ELA',
    'education' => 'EDU',
    'employment' => 'EMP',
    'family' => 'MAT',
    'housing' => 'HOU',
    'immigration' => 'IMMOT',
    'immigration_and_asylum' => 'IMMAS',
    'mental_health' => 'MHE',
    'personal_injury' => 'PI',
    'public_law' => 'PUB',
    'residual' => 'MSC',
    'residual_list' => 'RESIDUAL',
    'welfare_benefits' => 'WB'
  }

  class << self
    ATTRIBUTES = [
      :feature_file,
      :area_of_law,
      :environment,
      :use_api,
      :logging,
      :category_of_law,
      :feature_col,
      :api_url,
      :locked_id
    ]
  
    attr_accessor *ATTRIBUTES

    def area_of_law=(new_area_of_law)
      if @area_of_law != new_area_of_law
        puts "Changing area_of_law from #{@area_of_law} to #{new_area_of_law}" if logging
        @area_of_law = new_area_of_law
        @submissions = nil # Clear cached submissions
        puts "Cleared cached submissions" if logging
      end
    end

    def url
      config['url']
    end

    def submissions
      puts "Fetching submissions for area_of_law: #{area_of_law}" if logging
      @submissions ||= fetch_submissions(area_of_law: area_of_law)
      puts "Submissions fetched: #{@submissions.inspect}" if logging
      @submissions
    end

    def submission
      case area_of_law
      when CRIME_LOWER
        puts "Fetching crime_lower_submission" if logging
        crime_lower_submission
      when LEGAL_HELP
        puts "Fetching legal_help_submission" if logging
        legal_help_submission
      when MEDIATION
        puts "Fetching mediation_submission" if logging
        mediation_submission
      else
        raise("Invalid Area of Law #{area_of_law}")
      end
    end

    def submission_by_ref(ref)
      id = ref.split('#').last
      match = ref.match(/^[A-Z ]+/)
      match ? match[0].strip : nil
      self.area_of_law = match.to_s
      criteria = { id: id, area_of_law: self.area_of_law }
      puts "criteria: #{criteria}" if logging
      fetch_submissions(criteria) || raise("Missing #{ref} test submission")
    end

    def legal_help_submission
      if @legal_help_submission && !@legal_help_submission.to_h.empty?
        puts "Returning memoized legal_help_submission: #{@legal_help_submission.inspect}" if logging
      else
        puts "Calling submission_for(:legal_help)" if logging
        result = submission_for(:legal_help)
        if result.nil?
          puts "submission_for(:legal_help) returned nil, not creating OpenStruct" if logging
          @legal_help_submission = nil
        else
          puts "submission_for(:legal_help) returned: #{result.inspect}" if logging
          @legal_help_submission = OpenStruct.new(result)
          puts "New legal_help_submission: #{@legal_help_submission.inspect}" if logging
        end
      end
      @legal_help_submission
    end

    def mediation_submission
      if @mediation_submission && !@mediation_submission.to_h.empty?
        puts "Returning memoized mediation_submission: #{@mediation_submission.inspect}" if logging
      else
        puts "Calling submission_for(:mediation)" if logging
        result = submission_for(:mediation)
        if result.nil?
          puts "submission_for(:mediation) returned nil, not creating OpenStruct" if logging
          @mediation_submission = nil
        else
          puts "submission_for(:mediation) returned: #{result.inspect}" if logging
          @mediation_submission = OpenStruct.new(result)
          puts "New mediation_submission: #{@mediation_submission.inspect}" if logging
        end
      end
      @mediation_submission
    end
    
    def crime_lower_submission
      if @crime_lower_submission && !@crime_lower_submission.to_h.empty?
        puts "Returning memoized crime_lower_submission: #{@crime_lower_submission.inspect}" if logging
      else
        puts "Calling submission_for(:crime_lower)" if logging
        result = submission_for(:crime_lower)
        if result.nil?
          puts "submission_for(:crime_lower) returned nil, not creating OpenStruct" if logging
          @crime_lower_submission = nil
        else
          puts "submission_for(:crime_lower) returned: #{result.inspect}" if logging
          @crime_lower_submission = OpenStruct.new(result)
          puts "New crime_lower_submission: #{@crime_lower_submission.inspect}" if logging
        end
      end
      @crime_lower_submission
    end

    def submission_for(area_of_law)
      puts "Inside submission_for method with area_of_law: #{area_of_law}" if logging
      # Ensure submissions are initialized
      submissions
    
      if submissions.nil? || submissions.empty?
        puts "No submissions available" if logging
        return nil
      end
    
      s = submissions
      puts "Submissions state: #{s.inspect}" if logging
      puts "Comparing submission area_of_law: #{s['area_of_law'].strip} with #{area_of_law.to_s.upcase.tr('_', ' ').strip}" if logging
      if s['area_of_law'].strip == area_of_law.to_s.upcase.tr('_', ' ').strip
        s
      else
        puts "No matching submission for #{area_of_law}"
        nil
      end
    end

    def errors
      JSON.parse(shared['errors'].to_json, object_class: OpenStruct)
    end

    def set_environment(env)
      @environment = env
      reload_config
    end

    def set_use_api(use_api)
      @use_api = use_api
    end

    def set_logging(logging)
      @logging = logging
    end

    def unlock_by_id
      unless self.locked_id 
        puts "No locked_id, nothing to unlock, returning."
        return
      end

      url = URI("#{self.api_url}/unlockById/#{self.locked_id}")

      # Output the curl command for debug
      curl_command = "curl -X PUT '#{url}'"
      puts "Curl Command: #{curl_command}" if logging
    
      # Create a new HTTP PUT request
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Put.new(url)

      # Execute the request and get the response
      response = http.request(request)
    
      # Check if the request was successful
      if response.is_a?(Net::HTTPSuccess)
        puts "Successfully unlocked ID: #{self.locked_id}" if logging
      else
        puts "Failed to unlock ID: #{self.locked_id}"
        puts "Error: #{response.code} #{response.message}"
      end

      submission = nil

    end

    private

    DENY_LIST = [
    'features/validations/legal_help/immigration_and_asylum/access_point_validation_manual.feature',
    'path/to/denied_feature_2.feature'
    # Add more feature files as needed
    ]

    def should_use_api?
      @use_api && !DENY_LIST.include?(self.feature_file)
    end

    def config
      @config ||= ConfigLoader.load(environment)
    end

    def shared
      @shared ||= ConfigLoader.load("shared")
    end

    def reload_config
      @config = ConfigLoader.load(@environment)
      @submissions = nil # Clear cached submissions
    end

    def fetch_submissions(criteria = {})
      puts "Fetching submissions with criteria: #{criteria}" if logging
      base_submission = parse_submissions_from_yaml(criteria)
      puts "Base submission: #{base_submission.inspect}" if logging
      
      unless should_use_api?
        if base_submission.to_h.empty?
          raise "Unable to locate provider in the yaml file using #{criteria} for env #{environment}."
        end
        if !@use_api
          puts "API usage is disabled (use_api is false), returning base submission." if logging
        elsif DENY_LIST.include?(self.feature_file)
          puts "Feature file is on the deny list, returning base submission." if logging
        end
        return base_submission
      end
    
      puts "Using API, fetching submissions from API" if logging
      if area_of_law == 'LEGAL HELP'
        self.category_of_law = DIRECTORY_TO_LH_CATEGORY_MAP[self.feature_col]
      end

      api_overrides = fetch_submissions_from_api

      puts "#{api_overrides.inspect}" if logging
      merged_submission = merge_submissions(base_submission, api_overrides.first.data)
      puts "merged_submission: #{merged_submission.inspect}" if logging

      self.locked_id = merged_submission['id']

      merged_submission
    end

    def fetch_submissions_from_api
      uri = URI(self.api_url)
      params = { area_of_law: area_of_law }

      # Conditionally add category_of_law parameter if area_of_law is "LEGAL HELP"
      if area_of_law == 'LEGAL HELP'       
        params[:category_of_law] = self.category_of_law
      end

      uri.query = URI.encode_www_form(params)
    
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)

      # Output the curl command for debug
      curl_command = "curl -X GET '#{uri}'"
      puts "Curl Command: #{curl_command}" if logging

      response = http.request(request)
    
      if response.is_a?(Net::HTTPSuccess)
        body = response.body
        raise "API response is empty" if body.nil? || body.strip.empty?
    
        [JSON.parse(body, object_class: OpenStruct)]
      else
        raise "API request failed with status: #{response.code} #{response.message}"
      end
    rescue StandardError => e
      puts "fetch_submissions_from_api: Error fetching submissions from API: #{e.message}"
      []
    end

    def parse_submissions_from_yaml(criteria = {})
      submissions = JSON.parse(config['submissions'].to_json, object_class: OpenStruct)

      matching_submission = submissions.find do |submission|
        criteria.all? do |key, value|
          submission_value = submission[key.to_s]
          submission_value.to_s == value.to_s
        end
      end

      if matching_submission
        valuesets = shared['valuesets'] || []
        fields = valuesets.find { |valueset| valueset['name'] == matching_submission.valueset }&.fetch('fields', [])
        matching_submission.lines = fields.map { |field| OpenStruct.new(field) }
      end
    
      puts "matching_submission: #{matching_submission}" if logging && matching_submission
      puts "No matching submission found in yaml file using #{criteria} on #{self.environment}." if logging && matching_submission.nil?

      matching_submission || OpenStruct.new
    end

    def merge_submissions(base_submission, api_overrides)
      fields_to_override = %w[account_number area_of_law period schedule_number schedule_ref id]

      api_overrides_hash = api_overrides.to_h

      if base_submission.to_h.empty?
        api_overrides_hash.each do |key, value|
          puts "Setting #{key} to #{value}" if logging
          base_submission[key.to_s] = value
        end
      else
        api_overrides_hash.each do |key, value|
          if fields_to_override.include?(key.to_s) && base_submission[key.to_s] != value && base_submission.respond_to?(key)
            puts "Overriding #{key}: #{base_submission[key.to_s]} -> #{value}" if logging
            base_submission[key.to_s] = value
          end
        end
      end

      base_submission['locked'] = 'Y'

      base_submission
    end

  end

  class ConfigLoader
    @config_cache = {}

    def self.load(environment)
      @config_cache[environment] ||= YAML.safe_load(File.read(CONFIG_FILE)).fetch(environment)
    end

    def self.clear_cache
      @config_cache.clear
    end
  end
end