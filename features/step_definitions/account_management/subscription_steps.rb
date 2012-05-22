Given /^my subscription has a (\d+) Company limit$/ do |limit|
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.set_company_limit(limit)
end

When /^I am granted access to (Page Manager|Messenger|Dashboard)$/ do |application|
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.enable_application(application)
end