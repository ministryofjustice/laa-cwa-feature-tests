# features/support/hooks.rb

require 'aws-sdk-s3'
require_relative '../pages/outcome_page.rb'
include OutcomePage

Before do
  Capybara.current_window.resize_to(1920, 1080)
end

Before do
  @start_time = Time.now
  acknowledge_certificate if ENV['TEST_ENV'] == 'uat' && !defined?($acknowledged_cert)
  logout_from_cwa_and_portal
end

Before do |scenario|
  log_scenario_details(scenario)
end

Before('@crime_lower') do
  CWAProvider.area_of_law = 'CRIME LOWER'
end

Before('@legal_help') do
  CWAProvider.area_of_law = 'LEGAL HELP'
end

Before('@mediation') do
  CWAProvider.area_of_law = 'MEDIATION'
end

Before('@delete_outcome_before') do
  logout_from_cwa_and_portal
  delete_all_outcomes
  logout_from_cwa_and_portal
end

After('@delete_outcome_after') do |scenario|
  if scenario.passed?
    logout_from_cwa_and_portal
    delete_all_outcomes
  end
end

After do |scenario|
  byebug if scenario.failed? && ENV['DEBUG_FAILURES'] == 'true'
  puts "The scenario '#{scenario.name}' failed." if scenario.failed?
end

After do |scenario|
  #only unlock if scenario passed otherwise leave locked
  if scenario.passed? && CWAProvider.use_api
    CWAProvider.unlock_by_id
  end
end

# After do |scenario|
#   duration = Time.now - @start_time
#   puts "The scenario '#{scenario.name}' took #{duration.round(2)} seconds to run."
# end

After do |scenario|
  if scenario.failed?
    timestamp = Time.now.strftime('%d%m%Y-%H%M%S')
    filename = "#{scenario.name.gsub(/\s+/, '_')}_#{timestamp}.png"
    local_path = "/tmp/#{filename}"

    # Save screenshot locally
    page.save_screenshot(local_path)
    puts "Saved screenshot to #{local_path}"

    if (ENV['S3'] == 'true')
      # Upload to S3
      s3 = Aws::S3::Client.new(region: ENV['AWS_REGION'])
      bucket = ENV['BUCKET_NAME']
      release = ENV['RELEASE_NAME']
      key = "feature-test-runs/#{release}/artefacts/screenshots/#{filename}"

      begin
        s3.put_object(bucket: bucket, key: key, body: File.open(local_path))
        puts "Uploaded screenshot to s3://#{bucket}/#{key}"
      rescue Aws::S3::Errors::ServiceError => e
        puts "Failed to upload screenshot: #{e.message}"
      end
    end
  end
end


# At exit hook
at_exit do
  clean_up_temp_files
end

# Helper methods
def acknowledge_certificate
  visit('https://cwa.uat.legalservices.gov.uk/oa_servlets/AppsLogin')
  $acknowledged_cert ||= true
end

def log_scenario_details(scenario)
  location = scenario.location.to_s
  feature_file, line_number = location.split(':')
  feature_name = extract_feature_name(feature_file)

  puts "Running feature: #{feature_name}"
  puts "Feature file location: #{feature_file}"

  # Extract category_of_law if LEGAL HELP
  area_of_law = extract_specific_part(feature_file, 2)
  if area_of_law == 'legal_help'
    category_of_law = extract_specific_part(feature_file, 3)
    puts "Extracted LH category_of_law: #{category_of_law}"
    CWAProvider.feature_col = category_of_law
  end
  CWAProvider.feature_file = feature_file
end

def extract_feature_name(feature_file)
  File.basename(feature_file, '.feature').split('_').map(&:capitalize).join(' ')
end

def extract_specific_part(feature_file, position)
  feature_file.split('/')[position]
end

def logout_from_cwa_and_portal
  visit("#{CWAProvider.url}/OA_HTML/OALogout.jsp?")
  visit("#{PortalEnv.url}/oam/server/logout?")
end

def clean_up_temp_files
  tmp_path = File.expand_path(Helpers::Bulkload::TMP_DIR)
  tmp_files = Dir.glob("#{tmp_path}/*")
  FileUtils.rm_f(tmp_files)
end