class Model::Page::AccountManagement::BasicInfo < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  section :company_form, Model::Section::AccountManagement::CompanyForm, '#company_form'
  section :company_logo_form, Model::Section::AccountManagement::Uitk5CompanyLogoForm, '#upload_form'
  
  element :delete_company_button, '#delete_company'
  element :permission_denied_alert, ".alert:contains('You do not have access to use this feature')"
  
  company_form_methods = [:update_company_name, :update_company_industry, :update_timezone, :update_website_url, :update_description, :update_company_email, :update_reply_email]
  delegate *company_form_methods, :to => :company_form
  delegate :upload_logo, :remove_logo, :to => :company_logo_form
  
  def load
    return if loaded?
    sidebar.load_application(:company_settings)
    sidebar.company_settings_panel.basic_info.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_company_form? && has_company_logo_form? && has_sidebar? 
  end
  
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
  
  def has_no_logo?
    first("img[alt='Nologo']") || has_content?("You haven't uploaded a logo.") ? true : false
  end
  
  def delete_company
    delete_company_button.click
    page.accept_alert
  end
  
  def disabled?
    has_permission_denied_alert? && !company_form.has_save_button? && !company_logo_form.has_upload_button?
  end
end