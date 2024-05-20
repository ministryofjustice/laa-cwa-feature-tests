require_relative '../pages/outcome_page.rb'
include OutcomePage

Before do
  # This workaround seems to fool Firefox into thinking that it's not
  # a big deal if the certificate signature is a bit off as it seems in UAT.
  # It's not clear why it works, but by visiting the URL below *before*
  # anything else, will trigger a redirection to the portal login page.
  if ENV['TEST_ENV'] == 'uat' && !defined?($acknowledged_cert)
    visit('https://cwa.uat.legalservices.gov.uk/oa_servlets/AppsLogin')
    $acknowledged_cert ||= true
  end
end

Before do
  # Logout from CWA _and_ Portal before each scenario is run
  visit("#{CWAProvider.url}/OA_HTML/OALogout.jsp?")
  visit("#{PortalEnv.url}/oam/server/logout?")
end

Before('@crime_lower') do |scenario|
  CWAProvider.area_of_law = 'CRIME LOWER'
end

Before('@legal_help') do |scenario|
  CWAProvider.area_of_law = 'CRIME LOWER'
end

Before('@mediation') do |scenario|
  CWAProvider.area_of_law = 'MEDIATION'
end

Before('@delete_outcome_before') do |scenario|
  visit("#{CWAProvider.url}/OA_HTML/OALogout.jsp?")
  visit("#{PortalEnv.url}/oam/server/logout?")
  delete_all_outcomes
  visit("#{CWAProvider.url}/OA_HTML/OALogout.jsp?")
  visit("#{PortalEnv.url}/oam/server/logout?")
end

After('@delete_outcome_after') do |scenario|
  if scenario.passed?
    visit("#{CWAProvider.url}/OA_HTML/OALogout.jsp?")
    visit("#{PortalEnv.url}/oam/server/logout?")
    delete_all_outcomes
  end
end

After do |scenario|
  byebug if scenario.failed? && ENV['DEBUG_FAILURES'] == 'true'
  #call the API and unlock the provider account in use
  if ENV['FT_API'] == 'true'
    api_endpoint = ENV.fetch('CWA_TEST_PROVIDER_API')
    url = URI("https://#{api_endpoint}:8080/api/provider/unlockById/#{CWAProvider.submission.id}")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Put.new(url)
    response = http.request(request)
    puts response.read_body
  end
end

at_exit do
  tmp_path = File.expand_path(Helpers::Bulkload::TMP_DIR)
  tmp_files = Dir.glob("#{tmp_path}/*")
  FileUtils.rm_f(tmp_files)
end
