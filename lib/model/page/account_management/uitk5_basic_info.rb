class Model::Page::AccountManagement::Uitk5BasicInfo < SitePrism::Page
  section :company_form, Model::Section::AccountManagement::CompanyForm, 'form#company_form'
  
  company_form_methods = [:update_company_name, :update_company_industry, :update_timezone, :update_website_url, :update_description, :update_company_email, :update_reply_email]
  delegate *company_form_methods, :to => :company_form
  
  def company_name
    find_field('Company Name').value
  end
  
  def timezone
    find_field('Timezone').find('option[selected]').text
  end
  
  def industry
    find_field('Industry').find('option[selected]').text
  end
  
  def website_url
    find_field('Website URL').value
  end
  
  def description
    find_field('Description').value
  end
  
  def company_email
    find_field('Company Email').value
  end
  
  def reply_email
    find_field('Reply Email').value
  end
end