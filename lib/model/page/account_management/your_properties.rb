class Model::Page::AccountManagement::YourProperties < SitePrism::Page
  set_url_matcher /social_properties$/
  
  element :social_properties_form, 'div.page_content form#social_properties'
  element :add_facebook_property_link, "div.page_content a:contains('Facebook')"
  element :add_twitter_link, "div.page_content a:contains('Twitter')"
  element :add_property_button, "div.page_content a:contains('Add')"
  
  def load
    am = Model::Page::AccountManagement::AccountManagement.new
    am.load_section('Your Properties') unless displayed?
  end
  
  def has_property?(name, type)
    social_properties.include?({:name => name, :type => type.downcase})
  end
  
  def has_twitter_property?(name)
    has_property?(name, 'twitter account')
  end
  
  def has_properties?
    using_wait_time(0.5) { has_content?("You haven't added any properties yet") ? false : true }
  end
  
  def social_properties
    return [] unless has_properties?
    social_properties_form.all('div.field').collect do |property|
      {:name => property.first('div.name a').text, :type => property.first('div.details').text.downcase}
    end
  end
  
  def add_facebook_property(fb_page_name)
    add_facebook_property_link.click
    within_facebook_properties_modal do
      find("div:contains('#{fb_page_name}') input").check
    end
  end
  
  def add_twitter_property(twitter_name)
    show_add_twitter_property_window
    within_window(page.driver.browser.window_handles.last){ Model::Page::TwitterOauth.new.authorise(twitter_name, 'w1ldf1r3')}
    begin
      wait_until() { has_twitter_property?(twitter_name.capitalize) || !flash_message.blank? }
    rescue 
      raise "Failed to add twitter property '#{twitter_name}\n#{flash_message}"
    end
  end
  
  def flash_message
    first('span.flash_contents').try(:text)
  end
  
  private
  def within_facebook_properties_modal(&block)
    begin
      # This currently raises Permission denied for <https://s-static.ak.facebook.com> to get property Window.frameElement (Selenium::WebDriver::Error::UnknownError)
      # See http://code.google.com/p/selenium/issues/detail?id=2863 for details
      within_frame(find("iframe[src*='fb/properties/new']")[:id]) { yield }
    end
  end
  
  def show_add_twitter_property_window
    load if !displayed?
    if has_properties?
      add_property_button.click
      page.execute_script %{$("a:contains('a Twitter property')").click()} if ENV['BROWSER'] == 'firefox' # Following the link does not work in firefox
      find_link('a Twitter property').click
    else
      add_twitter_link.click
    end
  end
end