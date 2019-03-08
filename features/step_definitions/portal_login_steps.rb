When('I visit the portal url') do
  visit('http://portal.stg.legalservices.gov.uk')
end

Then('I see the portal login page') do
  page.has_content?('To sign in to the Online Portal')
end
