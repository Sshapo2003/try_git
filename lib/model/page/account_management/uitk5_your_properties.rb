class Model::Page::AccountManagement::Uitk5YourProperties < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  set_url_matcher /social_networks$/
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :add_property_button, "a:contains('Add')"
  element :fb_oauth_link, '#button_fb_oauth_add'
  element :add_twitter_link, '.btn_twitter_oauth'
  elements :fb_properties, 'td.property'
  element :no_properties_message, 'p.unavailable'
  elements :twitter_properties, "tr[id^='twitter_token']"
  
  def load
    return if loaded?
    sidebar.load_application(:company_settings)
    sidebar.company_settings_panel.your_properties.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_no_properties_message? || has_fb_properties? || has_twitter_properties? && has_sidebar?
  end
  
  def add_facebook_property(fb_page_name)
    show_facebook_properties_modal
    begin
      within_modal do
        find("tr:contains('#{fb_page_name}') input").set(true)
        click_on('Add to Wildfire')
      end
    # Capybara is too slow when dealing with a user with hundreds of fb properties so fall back to using some javascript to add properties
    rescue Timeout::Error => e
      add_fb_property_with_javascript(fb_page_name)
    rescue Capybara::TimeoutError => e
      add_fb_property_with_javascript(fb_page_name)
    end
    wait_until(60) { !has_modal? }
  end
  
  def add_twitter_property(twitter_name)
    show_add_twitter_property_window
    within_window(page.driver.browser.window_handles.last){ Model::Page::TwitterOauth.new.authorise(twitter_name, 'w1ldf1r3')}
    begin
      wait_until() { has_twitter_property?(twitter_name) || !flash_message.blank? }
    rescue Capybara::TimeoutError => e
      raise "The expected property did not appear in Your Properties and no error was displayed"
    end
  end
  
  def remove_property(name)
    property_field = first("tr:contains('#{name}')")
    raise "Could not find property with name #{name} to remove" unless property_field
    property_field.click_on('Remove')
    page.accept_alert
  end
  
  def has_facebook_property?(name)
    social_properties.include?(name)
  end
  
  def has_twitter_property?(name)
    social_properties.include?(name)
  end
  
  def social_properties
    fb_properties.map { |p| p.text } + twitter_properties.map { |p| p.first('a.page_token').text }
  end
  
  def show_facebook_properties_modal
    add_property_button.click if has_add_property_button?
    fb_oauth_link.click
  end
  
  def show_add_twitter_property_window
    add_property_button.click if has_add_property_button?
    add_twitter_link.click
  end
  
  def flash_message
    first('div.alert-error').try(:text)
  end
  
  def has_property?(name, type)
    social_properties.include?(name)
  end
  
  private
  
  def add_fb_property_with_javascript(fb_page_name)
    page.execute_script(%{$('.modal iframe').contents().find("tr:contains('#{fb_page_name}') input")[0].checked = true; $('.modal iframe').contents().find('.btn-primary').click();})
  end
end