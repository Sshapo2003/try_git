Given /^I have a tracked Facebook property$/ do
  @wildfire.account_management.tracked_properties.load
  @wildfire.account_management.tracked_properties.add_facebook_page('http://www.facebook.com/arsenal')
end

Given /^I have a tracked Twitter property$/ do
  @wildfire.account_management.tracked_properties.load
  @wildfire.account_management.tracked_properties.add_twitter_account('wildfireapp')
end

When /^I add the Facebook page "([^"]*)" to Tracked Properties$/ do |page_url|
  @wildfire.account_management.tracked_properties.load
  @wildfire.account_management.tracked_properties.add_facebook_page(page_url)
end

When /^I add the Twitter profile "([^"]*)" to Tracked Properties$/ do |account_name|
  @wildfire.account_management.tracked_properties.load
  @wildfire.account_management.tracked_properties.add_twitter_account(account_name)
end

When /^I remove the tracked property$/ do
  @wildfire.account_management.tracked_properties.remove_property
end

Then /^I should see the page "([^"]*)" in Tracked Properties$/ do |expected_name|
  property_names = @wildfire.account_management.tracked_properties.tracked_properties.collect {|p| p[:name] }
  property_names.should include expected_name
end

Then /^I should see the Twitter profile "([^"]*)" in Tracked Properties$/ do |expected_name|
  @wildfire.account_management.tracked_properties.tracked_properties.should include({:name => expected_name, :property_type => 'Twitter Account'})
end

Then /^I should have no tracked properties$/ do
  @wildfire.account_management.tracked_properties.should_not have_properties
end