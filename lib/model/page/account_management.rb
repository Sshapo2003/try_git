class Model::Page::AccountManagement < SitePrism::Page
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :your_properties, Model::Section::AccountManagement::YourProperties, 'div.body_content'
  section :header, Model::Section::Generic::Header, 'div.head'
  
  def load_section(name)
    load
    sidebar.navigate_to(name)
  end
  
  def locations
    Model::Page::AccountManagement::Locations.new
  end
  
  def basic_info
    Model::Page::AccountManagement::BasicInfo.new
  end
end