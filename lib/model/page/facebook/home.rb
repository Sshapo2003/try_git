class Model::Page::Facebook::Home < SitePrism::Page
  set_url 'http://www.facebook.com'
  
  element :header_username, "span.headerTinymanName"
  element :nav_dropdown_menu, "a#navAccountLink"
  
  def login(email, password)
    load_as_logged_out
    fill_in('email', :with => email)
    fill_in('pass', :with => password)
    click_on('Log in')
  end
  
  def logout
    nav_dropdown_menu.click
    click_on 'Log out'
  end
  
  def logged_in_user
    has_header_username? ? header_username.text : nil
  end
  
  def load_as_logged_out
    load
    logout if logged_in_user
  end
end
