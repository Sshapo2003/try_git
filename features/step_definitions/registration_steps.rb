When /^I complete the registration form$/ do
  @wildfire.signup.signup_register_user_form.complete_form_with_valid_credentials
  @wildfire.signup.signup_register_user_form.accept_terms
end

When /^I leave the (.*) value blank$/ do |field|
  case field
  when "firstname" then @wildfire.signup.signup_register_user_form.firstname_field.set ""
  when "lastname" then @wildfire.signup.signup_register_user_form.lastname_field.set ""
  when "companyname" then @wildfire.signup.signup_register_user_form.companyname_field.set ""
  when "email" then @wildfire.signup.signup_register_user_form.email_address_field.set ""
  when "password" then @wildfire.signup.signup_register_user_form.password_field.set ""
  end
end

When /^I dont accept the terms$/ do
  @wildfire.signup.signup_register_user_form.dont_accept_terms
end

When /^I Create Account$/ do
  @wildfire.signup.signup_register_user_form.submit_registration
end

Then /^the registration page should display the signup error message "(.*)"$/ do |message|
  @wildfire.signup.signup_error_message.text.should eql message
end

When /^the registration page should display the validation error message "(.*)"$/ do |message|
  error_messages = @wildfire.signup.signup_register_user_form.registration_validation_errors.map {|m| m.text }
  error_messages.should include message
end

When /^the registration page should display the terms validation error message "(.*)"$/ do |message|
  @wildfire.signup.signup_register_user_form.terms_validation_error.text.should eql message
end

When /^I click the "Use your existing login" link$/ do
  @wildfire.signup.signup_register_user_form.use_existing_login_link
end

