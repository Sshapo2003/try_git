class Model::Page::Login < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/sso_sign_on/"

  section :login_user_credentials_form, Model::Section::LoginUserCredentials, 'form#login_form'

  element :login_error_message, "span.flash_contents"
end
