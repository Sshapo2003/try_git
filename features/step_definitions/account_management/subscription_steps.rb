DEFAULT_SUBSCRIPTION = { 'Salesforce ID' =>          '',
                         'Promotions' =>             true,
                         'Page Manager' =>           false,
                         'Messenger' =>              false,
                         'Dashboard' =>              false,
                         'Monitor' =>                true,
                         'Company Limit' =>          1,
                         'Member Limit' =>           2,
                         'Facebook App Limit' =>     0,
                         'Facebook Page Limit' =>    1,
                         'Twitter Property Limit' => 1,
                         'Unlimited Campaigns' =>    false,
                         'Advanced Permissions' =>   false,
                         'Notes' =>                  '' }
                         
TWITTER_LIMIT_EXCEEDED = "You're trying to add more Twitter properties than your account's limit. Call us at 1-888-274-0929 to upgrade today."

Given /^my subscription has a (\d+) Company limit$/ do |limit|
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.set_company_limit(limit)
end

Given /^my subscription allows me to add Facebook applications$/ do
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.set_facebook_app_limit(10)
end

Given /^I have the default subscription$/ do
  step "I should have the default subscription"
end  
  
When /^I am granted access to (Page Manager|Messenger|Dashboard)$/ do |application|
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.enable_application(application)
end

When /^I am given the following additional subscription:$/ do |table|
  @wildfire.account_management.demo_page.show_new_subscription_modal
  @wildfire.account_management.edit_subscription.update_subscription(table.rows_hash)
end

Then /^I should have the default subscription$/ do
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.subscription_details.should == DEFAULT_SUBSCRIPTION
end

Then /^I should not be able to add more than (\d+) Twitter Properties$/ do |count|
  (1..count.to_i).each do |i|
    property_name = "alistairwf#{i.to_s}"
    @wildfire.account_management.your_properties.add_twitter_property(property_name)
    @wildfire.account_management.your_properties.should have_twitter_property(property_name.capitalize)
  end
  @wildfire.account_management.your_properties.add_twitter_property("alistairwf#{count.to_i + 1}")
  @wildfire.account_management.your_properties.social_properties.count.should == count.to_i
end

Then /^I should see the Twitter Properties limit exceeded message$/ do
  @wildfire.account_management.your_properties.flash_message.should == TWITTER_LIMIT_EXCEEDED
end