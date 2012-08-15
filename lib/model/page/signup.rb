class Model::Page::Signup < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/signup/"

  section :signup_register_user_form, Model::Section::Login::SignupRegisterUserForm, 'form'

  element :signup_error_message, 'span.flash_contents'
  element :signup_error_message_close_button, 'div.flash_liner a.flash_close'
  element :existing_login_link, 'div.login a'
  
  delegate :accept_terms, :complete_form_with_valid_credentials, :dont_accept_terms, :to => :signup_register_user_form
  delegate :firstname_field, :lastname_field, :companyname_field, :email_address_field, :password_field, :terms_of_service_link, :to => :signup_register_user_form

  def use_existing_login_link
    existing_login_link.click
  end

  def dismiss_error_message
    signup_error_message_close_button.click
  end
  
  def register_user_with_valid_credentials
    signup_register_user_form.complete_form_with_valid_credentials
    signup_register_user_form.accept_terms
    signup_register_user_form.create_account_button.click
  end
  
  def submit
    signup_register_user_form.submit_registration
  end
  
  def validation_errors
    signup_register_user_form.registration_validation_errors.map {|m| m.text }
  end
  
  def terms_validation_error
    signup_register_user_form.terms_validation_error.text
  end
end
