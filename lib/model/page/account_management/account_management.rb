class Model::Page::AccountManagement::AccountManagement < SitePrism::Page
  include Helpers::ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  set_url_matcher /#{Regexp.escape(url)}/
  
  delegate :current_company, :companies, :accounts, :switch_company, :to => :sidebar
  
  def your_properties
    Model::Page::AccountManagement::YourProperties.new
  end
  
  def loaded?
    current_url.include?(url)
  end
  alias :active? :loaded?
  
  def load
    sidebar.load_application(:company_settings)
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
  
  def social_apps
    Model::Page::AccountManagement::SocialApps.new
  end
  alias :applications :social_apps
  
  def signup
    Model::Page::AccountManagement::Signup.new
  end
  
  def services
    Model::Page::AccountManagement::Services.new
  end
  
  #TODO: rename this method once UITK5 is live everywhere
  def show_create_company_modal
    Model::Page::AccountManagement::CreateCompany.new.load
  end
end