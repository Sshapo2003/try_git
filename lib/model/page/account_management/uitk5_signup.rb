class Model::Page::AccountManagement::Uitk5Signup < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/signup/"
  
  element :first_name_field,      '#user_first_name'
  element :last_name_field,       '#user_last_name'
  element :company_name_field,    '#company_name'
  element :email_field,           '#user_email'
  element :password_field,        '#user_password'
  element :terms_checkbox,        '#user_terms'
  element :create_account_button, '.btn-signup'
  element :existing_login_link,   "a:contains('Use your existing login')"
  element :terms_link,            "a:contains('terms of service.)"
  
  def register_user(credentials)
    first_name_field.set credentials[:first_name]
    last_name_field.set credentials[:last_name]
    company_name_field.set credentials[:company_name]
    email_field.set credentials[:email]
    password_field.set credentials[:password]
    terms_checkbox.set(true)
    create_account_button.click
  end
  
  def register_user_with_valid_credentials
    register_user(Helpers::AccountManagementHelper.valid_user_credentials)
  end
  
  def use_existing_login_link
    existing_login_link.click
  end
end