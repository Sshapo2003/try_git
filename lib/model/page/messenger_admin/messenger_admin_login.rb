class Model::Page::MessengerAdmin::MessengerAdminLogin < SitePrism::Page
  set_url "#{Helpers::Config['messenger_admin_root']}"

  element :username_field, 'input#Email'
  element :password_field, 'input#Passwd'
  element :login_button, 'input#signIn'
  element :info_text, 'td.smallfont div p'

  def is_logged_in?
    return !is_login_page?
  end

  def is_login_page?
    begin
      return info_text.text == "Account.wildfireapp.com is asking for some information from your Wildfire Interactive, Inc. account. To see and approve the request, sign in."
    rescue
      # Probably not the login page
      return
    end
  end

  def login(username, password)
    username_field.set username
    password_field.set password
    login_button.click
  end
end