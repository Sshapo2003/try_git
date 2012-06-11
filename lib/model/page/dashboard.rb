class Model::Page::Dashboard < SitePrism::Page
  include ::Wildfire::Header
  
  set_url "#{Helpers::Config['wildfire_site_root']}/dashboard/contests/"
  
  element :messenger_link, 'a.app_nav.messenger'
  element :account_button, ''
end
