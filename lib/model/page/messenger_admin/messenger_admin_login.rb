class Model::Page::MessengerAdmin::MessengerAdminLogin < SitePrism::Page
  set_url "#{Helpers::Config['messenger_admin_root']}"
  set_url_matcher /ServiceLogin/

  element :username_field, 'input#Email'
  element :password_field, 'input#Passwd'
  element :login_button, 'input#signIn'
  element :info_text, 'td.smallfont div p'

  def login(username, password)
    username_field.set username
    password_field.set password
    login_button.click
  end
end