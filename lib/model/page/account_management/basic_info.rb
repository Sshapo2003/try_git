class Model::Page::AccountManagement::BasicInfo < SitePrism::Page
  section :sidebar, Model::Section::AccountManagement::Sidebar, 'div.sidebar'
  section :company_form, Model::Section::AccountManagement::CompanyForm, 'form#company_form'
  section :company_logo_form, Model::Section::AccountManagement::CompanyLogoForm, 'form#upload_form'
  
  def update_company_name(name)
    company_form.update_company_name(name)
  end
  
  def update_company_industry(industry)
    company_form.update_company_industry(industry)
  end
  
  def update_timezone(timezone)
    company_form.update_timezone(timezone)
  end
  
  def update_website_url(url)
    company_form.update_website_url(url)
  end
  
  def update_description(description)
    company_form.update_description(description)
  end
  
  def update_company_email(email)
    company_form.update_company_email(email)
  end
  
  def update_reply_email(email)
    company_form.update_reply_email(email)
  end
  
  def delete_company
    click_on('Delete Company')
    page.accept_alert
  end
  
  def upload_logo(filename)
    company_logo_form.attach_file(filename)
    company_logo_form.upload_button.click
  end
  
  def remove_logo
    company_logo_form.remove_button.click
    page.accept_alert
  end
  
  def company_name
    find_field('Company Name').value
  end
  
  def industry
    find_field('Industry').find('option[selected]').text
  end
  
  def timezone
    find_field('Timezone').find('option[selected]').text
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
  
  def has_no_logo?
    first("img[alt='Nologo']") ? true : false
  end
end