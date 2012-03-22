class Model::Page::MessengerAdminDashboard < SitePrism::Page
  set_url "#{Helpers::Config['messenger_admin_root']}"

  section :messenger_admin_header_navigation_bar, Model::Section::MessengerAdminHeaderNavigationBar, 'header nav'
end