class Model::Page::Signup < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/signup/"

  section :signup_register_user_form, Model::Section::SignupRegisterUserForm, 'form'

  element :signup_error_message, "span.flash_contents"
end
