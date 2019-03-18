require_relative '../pages/outcome_page.rb'
include OutcomePage

After('@delete_outcome_after') do
  delete_all_outcomes
end

After do
  visit('https://portal.tst.legalservices.gov.uk/oam/server/logout?')
end
