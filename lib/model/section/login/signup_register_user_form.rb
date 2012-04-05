class Model::Section::Login::SignupRegisterUserForm < SitePrism::Section
  element :firstname_field, "input#user_first_name"
  element :lastname_field, "input#user_last_name"
  element :companyname_field, "input#company_name"
  element :email_address_field, "input#user_email"
  element :password_field, "input#user_password"
  element :user_terms_checkbox, "input#user_terms"
  element :create_account_button, "button.wf_submit"
  element :terms_of_service_link, "label.terms a"

  element :terms_validation_error, "div.submission div.formError"
  elements :registration_validation_errors, "fieldset div.required:not(.hidden) div"

  def complete_form_with_valid_credentials
    firstname_field.set "firstname"
    lastname_field.set "lastname"
    companyname_field.set "companyname"
    email_address_field.set "#{String.random}my@email.com"
    password_field.set "pa55w0rd"
  end

  def set_email(email_address)
    email_address_field.set email_address
  end

  def accept_terms
    if !user_terms_checkbox.checked? then user_terms_checkbox.click end
  end

  def dont_accept_terms
    if user_terms_checkbox.checked? then user_terms_checkbox.click end
  end

  def submit_registration
    create_account_button.click
  end

  def validation_error_message_is_displayed?(message)
    registration_validation_errors.select {|a| a.text == message}.size > 0
  end
end
