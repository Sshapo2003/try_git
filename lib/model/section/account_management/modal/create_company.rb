class Model::Section::AccountManagement::Modal::CreateCompany < SitePrism::Section
  # We can't use site_prism's element method here because the fields are inside an iframe
  
  def fill_company_name_field(value)
    within_modal { fill_in('Company name', :with => value) }
  end
  
  def click_save_button
    within_modal { click_on('Save') }
  end
  
  def select_account(account_name)
    within_modal { select(account_name, :from => 'Account') }
  end
  
  def form_errors
    return [] unless visible?
    within_modal { all('.formError').collect {|e| e.text} }
  end
  
  private 
  
  def within_modal
    within_frame(find("iframe[src*='companies/new']")[:id]) { yield }
  end
end