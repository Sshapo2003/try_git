class Model::Page::AccountManagement < SitePrism::Page
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :your_properties, Model::Section::AccountManagement::YourProperties, 'div.body_content'
end