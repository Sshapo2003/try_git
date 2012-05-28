class Model::Section::Login::LoginUserCredentials < SitePrism::Section
  element :email_field, "input#email"
  element :password_field, "input#password"
  element :login_button, "button.login"

  def login_with_credentials(email, password)
    wait_for_and_set_email_field email
    wait_for_and_set_password_field password
    wait_for_and_click_login_button
  end
end
