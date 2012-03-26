Then /^I should be successfully logged in as "(.*)"$/ do |company_name|
  @wildfire.dashboard.dashboard_header.company_id.text.should eql company_name
end

Given /^I am viewing the "(.*)" account$/ do |company_name|
  #page.execute_script("$('a[title=SFOutdoors]')._show()")
  #page.execute_script("$('div.multiuser_company_selector a').mousedown()")
  @wildfire.dashboard.dashboard_header.choose_company company_name
end
