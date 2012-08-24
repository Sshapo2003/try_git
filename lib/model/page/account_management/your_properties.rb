class Model::Page::AccountManagement::YourProperties < SitePrism::Page
  include Helpers::ModalHelper
  
  set_url_matcher /social_networks$/
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  sections :properties, Model::Section::AccountManagement::SocialProperty, '#social_properties tbody tr'
  
  element :add_property_button, "a:contains('Add')"
  element :fb_oauth_link, '#button_fb_oauth_add'
  element :add_twitter_link, '.btn_twitter_oauth'
  element :no_properties_message, 'p.unavailable'
  element :alert_notice, '.alert-notice'
  #element :permission_denied_alert, ".alert:contains('You do not have access to use this feature')"
  
  def load
    return if loaded?
    sidebar.load_application(:company_settings)
    sidebar.company_settings_panel.your_properties.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_no_properties_message? || has_properties? && has_sidebar?
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
      wait_until() { has_twitter_property?(twitter_name) || has_alert_notice? }
    rescue Capybara::TimeoutError => e
      raise "The expected property did not appear in Your Properties and no error was displayed"
    end
  end
  
  def remove_facebook_property(name)
    find_facebook_property(name).remove
  end
  
  def remove_twitter_property(name)
    find_twitter_property(name).remove
  end
  
  def has_facebook_property?(name)
    facebook_properties.include?(name)
  end
  
  def has_twitter_property?(name)
    twitter_properties.include?(name)
  end
  
  def social_properties
    properties.map { |p| p.name }
  end
  
  def facebook_properties
    fb_properties.map { |p| p.name }
  end
  
  def twitter_properties
    tw_properties.map { |p| p.name }
  end
  
  def show_facebook_properties_modal
    add_property_button.click if has_add_property_button?
    fb_oauth_link.click
  end
  
  def show_add_twitter_property_window
    add_property_button.click if has_add_property_button?
    add_twitter_link.click
  end
  
  def has_property?(name)
    social_properties.include?(name)
  end
  
  def alert_message
    alert_notice.text.strip
  end
  alias :flash_message :alert_message
  
  def disabled?
    !has_fb_oauth_link? && !has_add_twitter_link? &&!has_add_property_button?
  end
  
  private
  
  def add_fb_property_with_javascript(fb_page_name)
    page.execute_script(%{$('.modal iframe').contents().find("tr:contains('#{fb_page_name}') input")[0].checked = true; $('.modal iframe').contents().find('.btn-primary').click();})
  end
  
  def fb_properties
    properties.select { |p| p.platform == 'Facebook' }
  end
  
  def tw_properties
    properties.select { |p| p.platform == 'Twitter' }
  end
  
  def find_facebook_property(name)
    fb_properties.detect { |p| p.name == name }
  end
  
  def find_twitter_property(name)
    tw_properties.detect { |p| p.name == name }
  end
end