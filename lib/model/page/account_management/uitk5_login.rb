class Model::Page::AccountManagement::Uitk5Login < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/sso_sign_on/"

  element :email_field,          '#email'
  element :password_field,       '#password'
  element :remember_me_checkbox, '#remember_me'
  element :forgot_password_link, "a:contains('Forgot your password?')"
  element :login_button,         '.btn-login'
  element :signup_link,          "a:contains('Sign up for an account!')"
  element :error_alert,          'div.alert-error'
  
  def load
    super
    unless is_loaded?
      visit "#{Helpers::Config['wildfire_site_root']}/logout"
      super
    end
  end

  def is_loaded?
    has_email_field? && has_login_button?
  end
  
  def login(email, password)
    email_field.set email
    password_field.set password
    login_button.click
  end
  
  def login_error_message
    error_alert.text
  end
end