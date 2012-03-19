class Model::Section::LoginUserCredentials < SitePrism::Section
  element :email_field, "input#email"
  element :password_field, "input#password"
  element :login_button, "button.login"

  def login_with_credentials(email, password)
    email_field.set email
    password_field.set password
    login_button.click
  end
end