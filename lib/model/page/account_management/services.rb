class Model::Page::AccountManagement::Services < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  def load
    sidebar.load_application(:company_settings) unless sidebar.active_panel == sidebar.company_settings_panel
    sidebar.company_settings_panel.services.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_sidebar?
  end
end