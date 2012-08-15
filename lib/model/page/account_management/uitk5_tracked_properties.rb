class Model::Page::AccountManagement::Uitk5TrackedProperties < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  element :add_facebook_link, '#add_fan_page_link'
  element :add_twitter_link, '#add_twitter_account_link'
  
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
    using_wait_time(0.5) { has_content?("You haven't added any properties yet") ? false : true }
  end
  
  def tracked_properties
    return [] unless has_properties?
    all('tbody tr').collect do |row|
      {:name => row.first('td a').text, :property_type => row.first("img[alt='Facebook']") ? 'Facebook Account' : 'Twitter Account' }
    end
  end
end