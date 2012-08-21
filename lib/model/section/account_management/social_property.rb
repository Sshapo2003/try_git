class Model::Section::AccountManagement::SocialProperty < SitePrism::Section
  element :name_link,           'a.page_token'
  element :remove_button,       "a:contains('Remove')"
  element :dropdown_toggle,     '.dropdown-toggle'
  element :reconnect_button,    "a:contains('Reconnect')"
  element :platform_icon_image, 'td>img'
  
  def name
    name_link.text.strip
  end
  
  def remove
    dropdown_toggle.click if has_dropdown_toggle?
    remove_button.click
    page.accept_alert
  end
  
  def reconnect
    raise "Property '#{name}' is not disconnected" unless has_reconnect_button?
    reconnect_button.click
  end
  
  def platform
    platform_icon_image[:alt]
  end
end