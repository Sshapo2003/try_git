class Model::Page::Dashboard < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/dashboard/contests/"
  
  element :messenger_link, 'a.app_nav.messenger'
  element :account_button, ''
  

  section :dashboard_header, Model::Section::Generic::Header, 'div.head'

  def logout

  end
end