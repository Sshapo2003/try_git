class Model::Page::TwitterOauth < SitePrism::Page
  
  def authorise(user, password)
    log_out if logged_in? && logged_in_user != user
    fill_login(user, password) if !logged_in?
    within_window(window_handle) { click_on('Authorize app') }
  end
  
  private
  
  def window_handle
    @window_handle ||= find_window_handle
  end
  
  def find_window_handle
    wait_until(10) do
      page.driver.browser.window_handles.find do |handle|
        within_window(handle) { first('form#oauth_form') }
      end
    end
  end
  
  def logged_in?
    within_window(window_handle) do
      first('span.name') ? true : false
    end
  end
  
  def logged_in_user
    return unless logged_in?
    within_window(window_handle) { first('span.name').text }
  end
  
  def log_out
    return unless logged_in?
    within_window(window_handle) do
      first('span.name').click
      click_on('Sign out')
    end
  end
  
  def fill_login(user, password)
    within_window(window_handle) do
      fill_in('Username or email', :with => user)
      fill_in('Password', :with => password)
    end
  end
end