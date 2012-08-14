class Model::Page::AccountManagement::Uitk5EditSubscription < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  def enable_application(application)
    within_modal do
      check application
      click_on 'Save'
    end
    wait_until() { !has_modal? }
  end
  
  def enable_advanced_permissions
    within_modal do
      check 'Advanced Permissions'
      click_on 'Save'
    end
    wait_until() { !has_modal? }
  end
  
  def set_company_limit(limit)
    within_modal do
      fill_in('Company Limit', :with => limit)
      click_on 'Save'
    end
    wait_until() { !has_modal? }
  end
  
  def set_facebook_app_limit(limit)
    within_modal do
      fill_in('Facebook App Limit', :with => limit)
      click_on 'Save'
    end
    wait_until() { !has_modal? }
  end
  
  def subscription_details
    within_modal { extract_subscription_details }
  end
  
  def update_subscription(values)
    within_modal do
      values.each_pair { |field, value| fill_in(field, :with => value) }
      click_on('Save')
    end
    wait_until() { !has_modal? }
  end
  
  private
  
  def extract_subscription_details
    { 'Salesforce ID' =>          find_field('Salesforce ID').value,
      'Promotions' =>             find_field('Promotions').checked?,
      'Page Manager' =>           find_field('Page Manager').checked?,
      'Messenger' =>              find_field('Messenger').checked?,
      'Dashboard' =>              find_field('Dashboard').checked?,
      'Monitor' =>                find_field('Monitor').checked?,
      'Company Limit' =>          find_field('Company Limit').value.to_i,
      'Member Limit' =>           find_field('Member Limit').value.to_i,
      'Facebook App Limit' =>     find_field('Facebook App Limit').value.to_i,
      'Facebook Page Limit' =>    find_field('Facebook Page Limit').value.to_i,
      'Twitter Property Limit' => find_field('Twitter Property Limit').value.to_i,
      'Unlimited Campaigns' =>    find_field('Unlimited Campaigns').checked?,
      'Advanced Permissions' =>   find_field('Advanced Permissions').checked?,
      'Notes' =>                  find_field('Notes').value }
  end
end