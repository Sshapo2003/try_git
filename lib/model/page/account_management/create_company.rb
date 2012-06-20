class Model::Page::AccountManagement::CreateCompany < SitePrism::Page
  include Helpers::ModalHelper
  
  def create_company(company_name, options={})
    fill_company_name_field(company_name)
    select_account('Create New') if options[:new_account] == true
    click_save_button
    wait_until { !has_modal? || !form_errors.empty? }
  end
  
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
    using_wait_time(0.5) do
      within_modal { all('.formError').collect {|e| e.text} } rescue []
    end
  end
  
  def flash_message
    within_modal { first('span.flash_contents').try(:text) }
  end
end