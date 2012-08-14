Given /^I have added the twitter account "([^"]*)" to Wildfire$/ do |twitter_name|
  @wildfire.account_management.your_properties.add_twitter_property(twitter_name)
end

When /^I (?:add|have added) the Facebook page "([^"]*)" to (?:Wildfire|Your Properties)$/ do |fb_page_name|
  @wildfire.account_management.load_section('Your Properties')
  @wildfire.account_management.your_properties.add_facebook_property(fb_page_name)
end

When /^I add the twitter account "([^"]*)" to Wildfire$/ do |twitter_name|
  @wildfire.account_management.your_properties.add_twitter_property(twitter_name)
end

When /^I remove the Facebook page "(.*?)" from Your Properties$/ do |page_name|
  @wildfire.account_management.your_properties.remove_property(page_name)
end

Then /^I should see the following social properties:$/ do |table|
  table.hashes.each do |property|
    @wildfire.account_management.your_properties.should have_property(property['Name'], property['Type'])
  end
end

Then /^I should see Twitter account "([^"]*)" in Your Properties$/ do |twitter_name|
  @wildfire.account_management.your_properties.should have_property(twitter_name.capitalize, 'twitter account')
end

Then /^I should see Facebook page "([^"]*)" in Your Properties$/ do |page_name|
  @wildfire.account_management.load_section('Your Properties')
  @wildfire.account_management.your_properties.should have_facebook_property(page_name)
end

Then /^I should have (\d+) social properties$/ do |count|
  @wildfire.account_management.your_properties.social_properties.count.should == count.to_i
end