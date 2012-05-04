class Model::Page::AccountManagement < SitePrism::Page
  set_url(Helpers::Config['wildfire_site_root']) #TODO - The site root should really be www and we should have a spearate site for account
  
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :your_properties, Model::Section::AccountManagement::YourProperties, 'div.body_content'
  section :header, Model::Section::Generic::Header, 'div.head'
  section :create_company_modal, Model::Section::AccountManagement::Modal::CreateCompany, '#new_company_modal'
  section :company_menu, Model::Section::Generic::CompanyMenu, 'ol.multiuser_company_selector'
  
  def create_company(company_name, options={})
    show_create_company_modal
    wait_for_create_company_modal
    create_company_modal.fill_company_name_field(company_name)
    create_company_modal.select_account('Create New') if options[:new_account] == true
    create_company_modal.click_save_button
    wait_until { !create_company_modal.visible? || !create_company_modal.form_errors.empty? }
  end
  
  def add_twitter_property(twitter_name)
    show_add_twitter_property_window
    within_window(page.driver.browser.window_handles.last){ Model::Page::TwitterOauth.new.authorise(twitter_name, 'w1ldf1r3')}
    wait_until() { your_properties.has_property?(twitter_name.capitalize, 'twitter account') }
  end
  
  def load_section(name)
    load
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
  
  private
  
  def show_create_company_modal
    header.company_select_button.click
    page.execute_script %{$("a:contains('Create a Company')").click()} if ENV['BROWSER'] == 'firefox' # Following the link does not work in firefox
    click_on('Create a Company')
  end
  
  def show_add_twitter_property_window
    if your_properties.has_properties?
      your_properties.add_property_button.click
      page.execute_script %{$("a:contains('a Twitter property')").click()} if ENV['BROWSER'] == 'firefox' # Following the link does not work in firefox
      find_link('a Twitter property').click
    else
      your_properties.add_twitter_link.click
    end
  end
end