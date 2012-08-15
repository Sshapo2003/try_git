class Model::Page::AccountManagement::Uitk5ManageAccounts < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  def load
    sidebar.manage_account
  end
  
  def has_advanced_permissions?
    members.invite_page.has_advanced_permissions?
  end
  
  def members
    sidebar.account_settings_panel.members.click
    Model::Page::AccountManagement::Uitk5Members.new
  end
end