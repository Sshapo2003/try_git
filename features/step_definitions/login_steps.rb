Given /^I am logged in as "(.*)"$/ do |username|
  step("I navigate to the login page")
  case username
  when "default" then step("I login with email \"#{Helpers::Config['default_user_facebook_address']}\" and password \"#{Helpers::Config['default_user_facebook_password']}\"")
  else raise "Unknown user '#{username}' - please add a case to login_steps.rb"
  end
end

When /^I login with email "(.*)" and password "(.*)"$/ do |email, password|
  @wildfire.login.login_user_credentials_form.login_with_credentials(email, password)
end

Then /^the login page should display the message "(.*)"$/ do |message|
  @wildfire.login.login_error_message.text.should eql message
end

Then /^the login page should be loaded$/ do
  @wildfire.login.is_loaded?.should be_true
end
