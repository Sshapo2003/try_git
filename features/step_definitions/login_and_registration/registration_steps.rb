When /^I complete the registration form$/ do
  @wildfire.signup.complete_form_with_valid_credentials
  @wildfire.signup.accept_terms
end

When /^I leave the (.*) value blank$/ do |field|
  case field
  when "firstname" then @wildfire.signup.firstname_field.set ""
  when "lastname" then @wildfire.signup.lastname_field.set ""
  when "companyname" then @wildfire.signup.companyname_field.set ""
  when "email" then @wildfire.signup.email_address_field.set ""
  when "password" then @wildfire.signup.password_field.set ""
  end
end

When /^the email address has already been reqistered$/ do
  @wildfire.signup.email_address_field.set 'my@email.com'
end

When /^I dont accept the terms$/ do
  @wildfire.signup.dont_accept_terms
end

When /^I submit the signup form$/ do
  @wildfire.account_management.signup.submit
end

Then /^the registration page should display the signup error message "(.*)"$/ do |message|
  @wildfire.signup.signup_error_message.text.should eql message
end

Then /^the registration page should not display the signup error message "(.*)"$/ do |message|
  Timeout.timeout(30) { sleep 0.1 while @wildfire.signup.signup_error_message.text == message }
  @wildfire.signup.signup_error_message.text.should_not eql message
end

When /^the registration page should display the validation error message "(.*)"$/ do |message|
  error_messages = @wildfire.signup.validation_errors
  error_messages.should include message
end

When /^the registration page should display the terms validation error message "(.*)"$/ do |message|
  @wildfire.signup.terms_validation_error.strip.should eql message
end

When /^I click the "Use your existing login" link$/ do
  @wildfire.signup.use_existing_login_link
end

Then /^the registration page should have a link to the terms of service page$/ do
  @wildfire.signup.terms_of_service_link[:href].should eql 'http://www.wildfireapp.com/buzz/terms_and_conditions'
end

When /^I dismiss the error message on the registration page$/ do
  @wildfire.signup.dismiss_error_message
end
