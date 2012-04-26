class Model::Section::AccountManagement::YourProperties < SitePrism::Section
  
  element :social_properties_form, 'form#social_properties'
  element :add_facebook_property_link, "a:contains('Facebook')"
  element :add_twitter_link, "a:contains('Twitter')"
  element :add_property_button, "a:contains('Add')"
  
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
    within_facebook_properties_modal do
      find("div:contains('#{fb_page_name}') input").check
    end
  end
  
  private
  def within_facebook_properties_modal(&block)
    begin
      # This currently raises Permission denied for <https://s-static.ak.facebook.com> to get property Window.frameElement (Selenium::WebDriver::Error::UnknownError)
      # See http://code.google.com/p/selenium/issues/detail?id=2863 for details
      within_frame(find("iframe[src*='fb/properties/new']")[:id]) { yield }
    end
  end
end