Then /^I should be successfully logged in as "(.*)"$/ do |company_name|
  @wildfire.dashboard.dashboard_header.company_id.text.should eql company_name
end