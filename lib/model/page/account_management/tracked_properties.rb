class Model::Page::AccountManagement::TrackedProperties < SitePrism::Page
  include Helpers::ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  element :add_facebook_link, '#add_fan_page_link'
  element :add_twitter_link, '#add_twitter_account_link'
  element :no_properties_message, 'p.unavailable'
  elements :tracked_properties, '#tracked_properties table tbody tr'
  
  def load
    return if loaded?
    sidebar.load_application(:company_settings)
    sidebar.company_settings_panel.tracked_properties.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_no_properties_message? || has_tracked_properties? && has_sidebar? 
  end
  
  def add_facebook_page(page_url)
    add_facebook_link.click
    within_modal do
      fill_in('URL', :with => page_url)
      click_on('Save')
    end
    wait_until(5) { has_properties? }
  end
  
  def add_twitter_account(account_name)
    add_twitter_link.click
    within_modal do
      fill_in('Username', :with => account_name)
      click_on('Save')
    end
    wait_until(5) { has_properties? }
  end
  
  def remove_property(index=0)
    all("tbody tr a:contains('Remove')")[index].click
    page.accept_alert
  end
  
  def has_properties?
    !has_no_properties_message?
  end
  
  def tracked_properties
    return [] unless has_properties?
    all('tbody tr').collect do |row|
      {:name => row.first('td a').text, :property_type => row.first("img[alt='Facebook']") ? 'Facebook Account' : 'Twitter Account' }
    end
  end
end