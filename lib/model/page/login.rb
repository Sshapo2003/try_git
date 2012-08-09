class Model::Page::Login < SitePrism::Page
  include ::Wildfire::Header
  
  set_url "#{Helpers::Config['wildfire_site_root']}/sso_sign_on/"
  section :login_user_credentials_form, Model::Section::Login::LoginUserCredentials, 'form#login_form'
  element :login_error_message_flash, 'span.flash_contents'
  element :signup_link, "a:contains('Sign up for an account')"
  
  def load
    super
    unless is_loaded?
      visit "#{Helpers::Config['wildfire_site_root']}/logout"
      super
    end
  end

  def is_loaded?
    has_login_user_credentials_form? && has_signup_link?
  end
  
  def login(email, password)
    page.fill_in('email', :with => email)
    page.fill_in('password', :with => password)
    page.click_on('Login')
  end
  
  def login_error_message
    login_error_message_flash.text
  end
end
