class Model::Page::AccountManagement::Locations < SitePrism::Page
  include Helpers::ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  element :add_new_location_button, '#btn_new_address'
  elements :addresses, 'td.address'
  element :no_locations_alert, "div:contains('No locations have been added for this company')"
  
  def load
    sidebar.load_application(:company_settings) unless sidebar.active_panel == sidebar.company_settings_panel
    sidebar.company_settings_panel.locations.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_addresses? || has_no_locations_alert?
  end
  
  def add_new_location(address=default_address)
    add_new_location_button.click
    within_modal do
      new_address_page.fill_address_form(address)
      new_address_page.save
    end
  end
  
  def default_address
    {
      :address_1 => '25 Floral Street',
      :address_2 => 'Another Line',
      :city => 'London',
      :state_or_province => 'Illinois',
      :postal_code => '12345',
      :country => 'United States'
    }
  end
  
  def include?(address)
    expected_address = address.values[0..2].join(', ')
    # Don't match on the full address because we can't easily convert state abbreviations to the full text
    addresses.detect { |a| a.text.strip.include? expected_address } ? true : false
  end
  
  private
  
  def new_address_page
    Model::Page::AccountManagement::NewCompanyLocation.new
  end
end