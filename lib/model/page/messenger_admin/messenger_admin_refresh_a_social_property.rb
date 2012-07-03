class Model::Page::MessengerAdmin::MessengerAdminRefreshASocialProperty < Model::Page::MessengerAdmin::MessengerAdminPage
  set_url "#{Helpers::Config['messenger_admin_root']}/social_property_refreshes/new"

  element :property_select, 'select#social_property_id'
  elements :property_select_options, 'select#social_property_id option'
  element :refresh_button, 'input[name=commit]'

  def refresh_property(property_name)
    wait_for_property_select_options(30)
    property_select_options.select {|o| o.text == property_name}.first.click
    refresh_button.click
  end
end