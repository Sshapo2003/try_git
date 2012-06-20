class Model::Page::MessengerAdmin::MessengerAdminPage < SitePrism::Page
  set_url Helpers::Config['messenger_admin_root']
  element :info_text, 'td.smallfont div p'
  element :login_box, 'div.loginBox'

  def load
    super
    @messengeradmin = Model::Messengeradmin.new
    if @messengeradmin.login.displayed? then @messengeradmin.login.login(Helpers::Config.admin_login, Helpers::Config.admin_password) end
  end

  def is_login_page?
    begin
      return login_box.text include? "Sign in to your account"
    rescue
      # Probably not the login page
      return
    end
  end
end
