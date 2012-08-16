class Model::Page::AccountManagement::Signup < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/signup/"
  
  element :firstname_field,       '#user_first_name'
  element :lastname_field,        '#user_last_name'
  element :companyname_field,     '#company_name'
  element :email_address_field,   '#user_email'
  element :password_field,        '#user_password'
  element :terms_checkbox,        '#user_terms'
  element :create_account_button, '.btn-signup'
  element :existing_login_link,   "a:contains('Use your existing login')"
  element :terms_of_service_link, "a:contains('terms of service.')"
  element :signup_error_message,  'div.flashes div.alert-error'
  
  def register_user(credentials)
    fill_in_form(credentials)
    submit
  end
  
  def fill_in_form(credentials)
    firstname_field.set credentials[:first_name]
    lastname_field.set credentials[:last_name]
    companyname_field.set credentials[:company_name]
    email_address_field.set credentials[:email]
    password_field.set credentials[:password]
    accept_terms
  end
  
  def complete_form_with_valid_credentials
    fill_in_form(Helpers::AccountManagementHelper.valid_user_credentials)
  end
  
  def register_user_with_valid_credentials
    register_user(Helpers::AccountManagementHelper.valid_user_credentials)
  end
  
  def use_existing_login_link
    existing_login_link.click
  end
  
  def submit
    create_account_button.click
  end
  
  def accept_terms
    terms_checkbox.set(true)
  end
  
  def dont_accept_terms
    terms_checkbox.set(false)
  end
  
  def terms_validation_error
    first("div.controls:contains('terms of service') span.help-inline").text
  end
  
  def validation_errors
    all('div.controls').map do |field|
      "#{field.first('input')['placeholder']} #{field.first('span.help-inline').text}" if field.first('span.help-inline')
    end.compact
  end
end