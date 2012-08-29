class Model::Section::AccountManagement::CompanyForm < SitePrism::Section
  element :save_button, "input[value='Save']"
  
  def update_company_name(name)
    within_form { fill_in('Company Name', :with => name) }
    save
  end
  
  def update_company_industry(industry)
    within_form { select(industry, :from => 'Industry') }
    save
  end
  
  def update_timezone(timezone)
    within_form { select(timezone, :from => 'Timezone') }
    save
  end
  
  def update_website_url(url)
    within_form { fill_in('Website URL', :with => url) }
    save
  end
  
  def update_description(description)
    within_form { fill_in('Description', :with => description) }
    save
  end
  
  def update_company_email(email)
    within_form { fill_in('Company Email', :with => email) }
    save
  end
  
  def update_reply_email(email)
    within_form { fill_in('Reply Email', :with => email) }
    save
  end
  
  def save
    within_form { click_on('Save') }
  end
  
  private
  
  def within_form(&block)
    within(root_element) { yield }
  end
end