class Model::Page::Login < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/sso_sign_on/"
  section :login_user_credentials_form, Model::Section::Login::LoginUserCredentials, 'form#login_form'
  element :login_error_message, 'span.flash_contents'

  def is_loaded?
    page.current_url.include? 'sso_sign_on' and page.has_content? 'Don\'t have a login?' and page.has_content? 'Sign up for an account'
  end
  
  def login(email, password)
    page.fill_in('email', :with => email)
    page.fill_in('password', :with => password)
    page.click_on('Login')
  end
end
