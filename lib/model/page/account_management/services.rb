class Model::Page::AccountManagement::Services < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  element :permission_denied_alert, ".alert:contains('You do not have access to use this feature')"
  
  def load
    sidebar.load_application(:company_settings)
    sidebar.company_settings_panel.services.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_sidebar?
  end
end