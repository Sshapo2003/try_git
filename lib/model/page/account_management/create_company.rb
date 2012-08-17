class Model::Page::AccountManagement::CreateCompany < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  def load
    sidebar.show_switchboard
    sidebar.switchboard_panel.create_new_company
  end
  
  def create_company(company_name, options={})
    fill_in 'Company name', :with => company_name
    select('Create New', :from => 'Account') if options[:new_account] == true
    click_on 'Save'
  end
end