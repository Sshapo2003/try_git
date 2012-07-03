class Model::Page::GoogleAppsLogin < SitePrism::Page
  set_url Helpers::Config['google_apps_login_url']
  
  element :email_field, '#Email'
  element :password_field, '#Passwd'
  element :signin_button, '#signIn'
  
  def login
    email_field.set(Helpers::Config.admin_login)
    password_field.set(Helpers::Config.admin_password)
    signin_button.click
  end
end