class Model::Page::AccountManagement::Uitk5BasicInfo < Model::Page::AccountManagement::BasicInfo
  element :company_name_field, '#company_name'
  
  def company_name
    company_name_field.value
  end
end