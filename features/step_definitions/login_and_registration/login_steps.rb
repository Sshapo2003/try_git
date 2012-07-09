Given /^I am logged in to Wildfire as ((?:!a new user).*)$/ do |user|
  credentials = Helpers::WildfireAccountsHelper.get_credentials_for(user)
  raise "No credentials found for #{user} on environment #{ENV['CONFIG']}. Please add them to config/wildfire_users.yml." if credentials.blank?
  @wildfire.login.load
  @wildfire.login.login_user_credentials_form.login_with_credentials(credentials['email'], credentials['password'])
end

Given /^I am logged in to Wildfire as a new user$/ do
  Helpers::AccountManagementHelper.register_and_login_new_user
end

When /^I login to Wildfire as (.*)$/ do |user|
  step "I am logged in to Wildfire as #{user}"
end

When /^I login with email "(.*)" and password "(.*)"$/ do |email, password|
  @wildfire.login.login_user_credentials_form.login_with_credentials(email, password)
end

Then /^the login page should display the message "(.*)"$/ do |message|
  @wildfire.login.login_error_message.text.should eql message
end

Then /^the login page should be loaded$/ do
  @wildfire.login.wait_for_login_user_credentials_form
  @wildfire.login.is_loaded?.should be_true
end
