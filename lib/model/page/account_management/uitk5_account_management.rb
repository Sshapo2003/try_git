class Model::Page::AccountManagement::Uitk5AccountManagement < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  set_url_matcher /#{Regexp.escape(url)}/
  
  delegate :current_company, :companies, :accounts, :switch_company, :to => :sidebar
  
  def your_properties
    Model::Page::AccountManagement::Uitk5YourProperties.new
  end
  
  def loaded?
    current_url.include?(url)
  end
  
  def load
    sidebar.load_application(:company_settings)
  end
  
  # TODO: Deprecate this method in favour of calling #load on actual page models
  def load_section(name)
    load
    sidebar.company_settings_panel.send(name.downcase.parameterize('_').to_sym).click
  end
  
  def locations
    Model::Page::AccountManagement::Uitk5Locations.new
  end
  
  def basic_info
    Model::Page::AccountManagement::Uitk5BasicInfo.new
  end
  
  def tracked_properties
    Model::Page::AccountManagement::Uitk5TrackedProperties.new
  end
  
  def demo_page
    Model::Page::AccountManagement::Demo.new
  end
  
  def manage_accounts
    Model::Page::AccountManagement::Uitk5ManageAccounts.new
  end
  
  def edit_subscription
    Model::Page::AccountManagement::Uitk5EditSubscription.new
  end
  
  def create_company
    Model::Page::AccountManagement::Uitk5CreateCompany.new
  end
  
  def social_apps
    Model::Page::AccountManagement::Uitk5SocialApps.new
  end
  
  def signup
    Model::Page::AccountManagement::Uitk5Signup.new
  end
  
  #TODO: rename this method once UITK5 is live everywhere
  def show_create_company_modal
    Model::Page::AccountManagement::Uitk5CreateCompany.new.load
  end
end