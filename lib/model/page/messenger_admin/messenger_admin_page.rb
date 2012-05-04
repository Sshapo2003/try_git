class Model::Page::MessengerAdmin::MessengerAdminPage < SitePrism::Page
  element :info_text, 'td.smallfont div p'

  def load
    super
    @messengeradmin = Model::Messengeradmin.new
    if is_login_page? then @messengeradmin.login.login(Helpers::Config.admin_login, Helpers::Config.admin_password) end
  end

  def is_login_page?
    begin
      return info_text.text == "Account.wildfireapp.com is asking for some information from your Wildfire Interactive, Inc. account. To see and approve the request, sign in."
    rescue
      # Probably not the login page
      return
    end
  end
end
