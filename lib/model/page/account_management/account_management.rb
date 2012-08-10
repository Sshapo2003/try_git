class Model::Page::AccountManagement::AccountManagement < SitePrism::Page
  include ::Wildfire::Header
  include Helpers::ModalHelper
  
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  set_url_matcher /#{Regexp.escape(url)}/
  
  def your_properties
    uitk5? ? Model::Page::AccountManagement::Uitk5YourProperties.new : Model::Page::AccountManagement::YourProperties.new
  end
  
  def load_section(name)
    load unless displayed?
    click_on name
  end
  
  def loaded?
    current_url.include?(url)
  end
  
  def locations
    uitk5? ? Model::Page::AccountManagement::Uitk5Locations.new : Model::Page::AccountManagement::Locations.new
  end
  
  def basic_info
    uitk5? ? Model::Page::AccountManagement::Uitk5BasicInfo.new : Model::Page::AccountManagement::BasicInfo.new
  end
  
  def tracked_properties
    Model::Page::AccountManagement::TrackedProperties.new
  end
  
  def demo_page
    Model::Page::AccountManagement::Demo.new
  end
  
  def manage_accounts
    uitk5? ? Model::Page::AccountManagement::Uitk5ManageAccounts.new : Model::Page::AccountManagement::ManageAccounts.new
  end
  
  def edit_subscription
    uitk5? ? Model::Page::AccountManagement::Uitk5EditSubscription.new : Model::Page::AccountManagement::EditSubscription.new
  end
  
  def create_company
    Model::Page::AccountManagement::CreateCompany.new
  end
  
  def social_apps
    Model::Page::AccountManagement::SocialApps.new
  end
  
  def signup
    uitk5? ? Model::Page::AccountManagement::Uitk5Signup.new : Model::Page::Signup.new
  end
  
  def flash_message
    first('span.flash_contents').try(:text)
  end
end