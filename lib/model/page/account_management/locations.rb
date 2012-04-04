class Model::Page::AccountManagement::Locations < SitePrism::Page
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :locations_form, Model::Section::AccountManagement::LocationsForm, "div.body_content div.form"
  section :new_address_modal, Model::Section::AccountManagement::NewAddressModal, "#btn_new_address-dialog"
  
  def load
    sidebar.navigate_to('Locations')
  end
  
  def add_new_location(address=default_address)
    locations_form.add_new_address_button.click
    new_address_modal.fill_address_form(address)
    new_address_modal.save_new_address
  end
  
  def addresses
    all('div.address div.address_line').collect {|a| a.text}
  end
  
  def include?(address)
    expected_address = address.values[0..2].join(', ')
    addresses.select {|a| a.include?(expected_address)} ? true : false
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
end