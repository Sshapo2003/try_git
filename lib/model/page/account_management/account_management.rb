class Model::Page::AccountManagement::AccountManagement < SitePrism::Page
  include ::Wildfire::Header
  include Helpers::ModalHelper
  
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  set_url_matcher /#{Regexp.escape(url)}/
  
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  
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
  
  def create_company
    Model::Page::AccountManagement::CreateCompany.new
  end
  
  def flash_message
    first('span.flash_contents').try(:text)
  end
end