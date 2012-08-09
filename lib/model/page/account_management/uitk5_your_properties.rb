class Model::Page::AccountManagement::Uitk5YourProperties < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  set_url_matcher /social_networks$/
  
  element :add_property_button, "a:contains('Add')"
  element :fb_oauth_link, '#button_fb_oauth_add'
  elements :properties, 'td.property'
  
  def add_facebook_property(fb_page_name)
    show_facebook_properties_modal
    within_modal do
      using_wait_time(60) do #Capybara seems slow at parsing long list of properties
        find("tr:contains('#{fb_page_name}') input").set(true)
        click_on('Add to Wildfire')
      end
    end
    wait_until() { !has_modal? }
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
  
  def social_properties
    properties.map { |p| p.text }
  end
  
  def show_facebook_properties_modal
    add_property_button.click if has_add_property_button?
    fb_oauth_link.click
  end
end