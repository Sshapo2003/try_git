class Model::Section::AccountManagement::CompanyLogoForm < SitePrism::Section
  element :upload_button, "button[value='Upload']"
  element :remove_button, "a:contains('Remove')"
  
  def attach_file(filename)
    root_element.attach_file('company_logo', File.join(Dir.pwd, 'fixtures', filename))
  end
end