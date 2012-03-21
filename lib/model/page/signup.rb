class Model::Page::Signup < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/signup/"

  section :signup_register_user_form, Model::Section::SignupRegisterUserForm, 'form'

  element :signup_error_message, 'span.flash_contents'
  element :signup_error_message_close_button, 'div.flash_liner a.flash_close'
  element :existing_login_link, 'div.login a'

  def use_existing_login_link
    existing_login_link.click
  end

  def dismiss_error_message
    signup_error_message_close_button.click
  end
end
