Given /^I have added the twitter account "([^"]*)" to Wildfire$/ do |twitter_name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.add_twitter_property(twitter_name)
end

When /^I (?:add|have added) the Facebook page "([^"]*)" to (?:Wildfire|Your Properties)$/ do |fb_page_name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.add_facebook_property(fb_page_name)
end

When /^I add the twitter account "([^"]*)" to Wildfire$/ do |twitter_name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.add_twitter_property(twitter_name)
end

When /^I remove the Facebook page "(.*?)" from Your Properties$/ do |page_name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.remove_facebook_property(page_name)
end

When /^I remove the twitter account "(.*?)" from Wildfire$/ do |name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.remove_twitter_property(name)
end

Then /^I should see the following social properties:$/ do |table|
  table.hashes.each do |property|
    @wildfire.account_management.your_properties.should have_property(property['Name'])
  end
end

Then /^I should see Twitter account "([^"]*)" in Your Properties$/ do |twitter_name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.should have_twitter_property(twitter_name)
end

Then /^I should see Facebook page "([^"]*)" in Your Properties$/ do |page_name|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.should have_facebook_property(page_name)
end

Then /^I should have (\d+) social properties$/ do |count|
  @wildfire.account_management.your_properties.load
  @wildfire.account_management.your_properties.social_properties.count.should == count.to_i
end

Then /^I should be able to compose a message to "(.*?)"$/ do |property_name|
  wait_until(30) do
    @wildfire.account_management.sidebar.load_application(:messages)
    @wildfire.wildfireapp_messenger.has_new_message_button?
  end
  @wildfire.wildfireapp_messenger.click_tab('Compose')
  @wildfire.wildfireapp_messenger.compose_a_valid_message(property_name)
end

Then /^I should see the alert "(.*?)" on the Your Properties page$/ do |msg|
  @wildfire.account_management.your_properties.should have_alert_notice
  @wildfire.account_management.your_properties.alert_message.should match msg
end