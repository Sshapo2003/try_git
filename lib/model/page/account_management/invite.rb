class Model::Page::AccountManagement::Invite < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :account_admin_checkbox, '#account_admin'
  
  def has_advanced_permissions?
    !account_admin_checkbox['disabled']
  end
end