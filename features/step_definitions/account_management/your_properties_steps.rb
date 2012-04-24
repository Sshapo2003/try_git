Given /^I am logged in to Wildfire as a user with existing properties$/ do
  pending "Currently only implemented for staging" unless ENV['CONFIG'] == 'staging'
  @wildfire.login.load
  @wildfire.login.login('alistair.hutchison+staging@wildfireapp.com', 'password1')
end

When /^I add the Facebook page "([^"]*)" to Wildfire$/ do |fb_page_name|
  @wildfire.account_management.load_section('Your Properties')
  @wildfire.account_management.your_properties.add_facebook_property(fb_page_name)
end

When /^I add the twitter account "([^"]*)" to Wildfire$/ do |twitter_name|
  @wildfire.account_management.load_section('Your Properties')
  @wildfire.account_management.your_properties.add_twitter_property(twitter_name)
end

Then /^I should see the following social properties:$/ do |table|
  table.hashes.each do |property|
    @wildfire.account_management.your_properties.should have_property(property['Name'], property['Type'])
  end
end

Then /^I should see Twitter account "([^"]*)" in Your Properties$/ do |twitter_name|
  @wildfire.account_management.your_properties.should have_property(twitter_name.capitalize, 'twitter account')
end

Then /^I should see Facebook page "([^"]*)" in Your Properties$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end