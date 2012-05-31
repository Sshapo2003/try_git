class Model::Page::Facebook::Home < SitePrism::Page
  set_url 'http://www.facebook.com'
  
  def login(email, password)
    load_as_logged_out
    fill_in('email', :with => email)
    fill_in('pass', :with => password)
    click_on('Log in')
  end
  
  def load_as_logged_out
    load
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    load
  end
end
