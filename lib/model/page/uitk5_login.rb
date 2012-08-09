class Model::Page::Uitk5Login < Model::Page::Login
  set_url "#{Helpers::Config['wildfire_site_root']}/sso_sign_on/"
  section :login_user_credentials_form, Model::Section::Login::Uitk5LoginUserCredentials, 'form#login_form'
end
