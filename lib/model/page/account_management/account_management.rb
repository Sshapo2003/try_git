class Model::Page::AccountManagement::AccountManagement < SitePrism::Page
  include ::Wildfire::Header
  
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  set_url_matcher /#{Regexp.escape(url)}/
  
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :create_company_modal, Model::Section::AccountManagement::Modal::CreateCompany, '#new_company_modal'
  
  def create_company(company_name, options={})
    show_create_company_modal
    wait_for_create_company_modal
    create_company_modal.fill_company_name_field(company_name)
    create_company_modal.select_account('Create New') if options[:new_account] == true
    create_company_modal.click_save_button
    begin
      wait_until { !create_company_modal.visible? || !create_company_modal.form_errors.empty? }
    rescue Capybara::TimeoutError
      raise "Failed to create company\n#{create_company_modal.flash_message}"
    end
  end
  
  def your_properties
    Model::Page::AccountManagement::YourProperties.new
  end
  
  def load_section(name)
    load unless displayed?
    sidebar.navigate_to(name)
  end
  
  def loaded?
    current_url.include?(url)
  end
  
  def locations
    Model::Page::AccountManagement::Locations.new
  end
  
  def basic_info
    Model::Page::AccountManagement::BasicInfo.new
  end
  
  def tracked_properties
    Model::Page::AccountManagement::TrackedProperties.new
  end
  
  def demo_page
    Model::Page::AccountManagement::Demo.new
  end
  
  def manage_accounts
    Model::Page::AccountManagement::ManageAccounts.new
  end
  
  def edit_subscription
    Model::Page::AccountManagement::EditSubscription.new
  end
  
  def flash_message
    first('span.flash_contents').try(:text)
  end
end