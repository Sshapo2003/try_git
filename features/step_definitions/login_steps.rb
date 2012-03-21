When /^I login with email "(.*)" and password "(.*)"$/ do |email, password|
  @wildfire.login.login_user_credentials_form.login_with_credentials(email, password)
end

Then /^the login page should display the message "(.*)"$/ do |message|
  @wildfire.login.login_error_message.text.should eql message
end

Then /^the login page should be loaded$/ do
  @wildfire.login.is_loaded?.should be_true
end
