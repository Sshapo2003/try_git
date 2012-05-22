module Wildfire::Header
  def current_company
    company_select_button.text
  end
  
  def current_user
    show_account_menu
    first('a.manage_profile_link').text
  end
  
  def logout
    show_account_menu
    click_on('Logout')
  end
  
  def accounts
    show_company_select_menu
    all('ol.multiuser_company_selector li a.optgroup span').collect { |e| e.text }[0..-2]
  end
  
  def switch_company(company_name)
    show_company_select_menu
    has_link?(company_name) ? click_link(company_name) : raise("Company '#{company_name}' not found")
  end
  
  def companies
    show_company_select_menu
    all('li.nested.option a').collect { |e| e.text }[0..-2]
  end
  
  def notifications
    show_notifications
    all('#notifications a.notification').map do |notification|
      date = notification.first('span').text
      text = notification.text.sub(" #{date}", '')
      {:text => text, :date => date}
    end
  end
  
  def notifications_count
    first('#notifications_trigger').text
  end
  
  def show_edit_user_modal
    show_account_menu
    click_wf_link(current_user)
  end
  
  def show_manage_accounts_modal
    show_account_menu
    first("a:contains('Manage Accounts')") ? click_wf_link('Manage Accounts') : click_wf_link('Manage Account')
  end
  
  def show_create_company_modal
    show_company_select_menu
    click_wf_link('Create a Company')
  end
  
  private
  
  def within_wf_header
    page.within('div.page div.head') { yield }
  end
  
  def show_company_select_menu
    company_select_button.click unless company_select_menu
  end
  
  def hide_company_select_menu
    company_select_button.click if company_select_menu
  end
  
  def company_select_button
    within_wf_header { first('form.select_form_company_id a.select_button') }
  end
  
  def show_notifications
    within_wf_header { first('#notifications_trigger').click unless first('#notifications_trigger.open') }
  end
  
  def show_account_menu
    within_wf_header { first('a.wf_button', :text => 'Account').click unless first('a.wf_button.active', :text => 'Account') }
  end
  
  def company_select_menu
    first('ol', text: 'Create a Company', :visible => true)
  end
  
  # Workaround for links which can't currently be clicked in selenium firefox
  def click_wf_link(locator)
    link = find_link(locator)
    Capybara.current_driver == :selenium_firefox ? link.native.send_key(:return) : link.click
  end
end