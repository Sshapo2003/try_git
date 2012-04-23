class Model::Page::AccountManagement::TrackedProperties < SitePrism::Page
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :tracked_properties_form, Model::Section::AccountManagement::TrackedPropertiesForm, 'form#tracked_properties'
  
  element :add_facebook_page_link, "a#add_fan_page_link"
  element :add_twitter_account_link, "a#add_twitter_account_link"
  
  def load
    sidebar.navigate_to('Tracked Properties')
  end
  
  def add_facebook_page(page_url)
    add_facebook_page_link.click
    within_facebook_page_modal do
      fill_in('URL', :with => page_url)
      click_on('Save')
    end
    wait_until(5) { tracked_properties_form.has_properties? }
  end
  
  def add_twitter_account(account_name)
    add_twitter_account_link.click
    within_twitter_modal do
      fill_in('Username', :with => account_name)
      click_on('Save')
    end
    wait_until(5) { tracked_properties_form.has_properties? }
  end
  
  def remove_property(index=0)
    all('div.integration div.actions a')[index].click
    page.accept_alert
  end
  
  def tracked_properties
    tracked_properties_form.tracked_properties
  end
  
  def has_properties?
    tracked_properties_form.has_properties?
  end
  
  private
  def within_facebook_page_modal(&block)
    within_frame(first("iframe[src*='fan_pages/new']")[:id]) { yield }
  end
  
  def within_twitter_modal(&block)
    within_frame(first("iframe[src*='twitter/accounts']")[:id]) { yield }
  end
end