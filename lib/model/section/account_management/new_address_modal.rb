class Model::Section::AccountManagement::NewAddressModal < SitePrism::Section
  
  def fill_address_form(details)
    within_new_address_iframe do
      fill_in('Address 1', :with => details[:address_1])
      fill_in('Address 2', :with => details[:address_2])
      fill_in('City', :with => details[:city])
      select(details[:state_or_province], :from => 'State or Province')
      fill_in('Postal Code', :with => details[:postal_code])
      select(details[:country], :from => 'Country')
    end
  end
  
  def save_new_address
    within_new_address_iframe { click_on('Save') }
  end
  
  def cancel_new_address
    within_new_address_iframe { click_on('Cancel') }
  end
  
  private
  
  def within_new_address_iframe(&block)
    within_frame(root_element.first('iframe')[:id]) { yield }
  end
end