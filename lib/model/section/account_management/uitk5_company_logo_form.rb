class Model::Section::AccountManagement::Uitk5CompanyLogoForm < SitePrism::Section
  element :upload_button, 'input[value="Upload"]'
  element :remove_button, "a:contains('Remove')"
  
  def attach_file(filename)
    root_element.attach_file('company_logo', File.join(Dir.pwd, 'fixtures', filename))
  end
  
  def upload_logo(filename)
    attach_file(filename)
    upload_button.click
  end
  
  def remove_logo
    remove_button.click
    page.accept_alert
  end
end