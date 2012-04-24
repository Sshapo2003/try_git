class Model::Section::AccountManagement::YourProperties < SitePrism::Section
  
  element :social_properties_form, 'form#social_properties'
  element :add_facebook_property_link, "a:contains('Facebook')"
  element :add_twitter_link, "a:contains('Twitter')"
  
  def has_property?(name, type)
    social_properties.include?({:name => name, :type => type.downcase})
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
    #TODO: Login to FB with valid credentials and add a facebook page
  end
  
  def add_twitter_property(twitter_name)
    add_twitter_link.click
    within_window(page.driver.browser.window_handles.last){ Model::Page::TwitterOauth.new.login(twitter_name, 'w1ldf1r3')}
    wait_until() { has_property?(twitter_name.capitalize, 'twitter account') }
  end
end