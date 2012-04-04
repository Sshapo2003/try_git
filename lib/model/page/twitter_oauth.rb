class Model::Page::TwitterOauth < SitePrism::Page
  
  def login(user, password)
    within_window(find_window_handle) do
      fill_in('Username or email', :with => user)
      fill_in('Password', :with => password)
      click_on('Authorize app')
    end
  end
  
  private
  
  def find_window_handle
    begin
      timeout(5) do
        twitter_window_handle = nil
        page.driver.browser.window_handles.each do |handle|
          twitter_window_handle = handle if( within_window(handle) { first('form#oauth_form') })
        end
        return twitter_window_handle
      end
    rescue Capybara::TimeoutError
      raise "Failed to locate the Twitter auth window"
    end
  end
end