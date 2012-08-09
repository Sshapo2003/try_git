class Model::Page::AccountManagement::NewCompanyLocation < SitePrism::Page
  def fill_address_form(details)
    fill_in('Address 1', :with => details[:address_1])
    fill_in('Address 2', :with => details[:address_2])
    fill_in('City', :with => details[:city])
    select(details[:state_or_province], :from => 'State or Province')
    fill_in('Postal Code', :with => details[:postal_code])
    select(details[:country], :from => 'Country')
  end
  
  def save
    click_on('Save')
  end
  
  def cancel
    click_on('Cancel')
  end
end