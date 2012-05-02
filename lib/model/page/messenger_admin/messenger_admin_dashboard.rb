class Model::Page::MessengerAdmin::MessengerAdminDashboard < SitePrism::Page
  set_url "#{Helpers::Config['messenger_admin_root']}"

  element :refresh_a_social_property_tab, "header a[href~='/admin/social_property_refreshes/new']"
  
  section :messenger_admin_header_navigation_bar, Model::Section::MessengerAdminHeaderNavigationBar, 'header nav'
end