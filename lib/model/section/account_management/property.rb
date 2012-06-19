class Model::Section::AccountManagement::Property < SitePrism::Section
  element :name, 'div.name'
  element :reconnect_button, '.wf_menu_button_wpr a.wf_button'
  element :remove_facebook_property_button, '.delete_facebook_page_token_link'
end
