When /^I am granted access to (Page Manager|Messenger|Dashboard)$/ do |application|
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.enable_application(application)
end