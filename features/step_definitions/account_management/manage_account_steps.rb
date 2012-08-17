Then /^I should not be able to set advanced permissions$/ do
  @wildfire.account_management.manage_accounts.load
  @wildfire.account_management.manage_accounts.should_not have_advanced_permissions
end

Given /^I have the advanced permissions feature enabled$/ do
  @wildfire.account_management.demo_page.show_edit_subscription_modal
  @wildfire.account_management.edit_subscription.enable_advanced_permissions
end

Then /^I should be able to set advanced permissions$/ do
  @wildfire.account_management.manage_accounts.load
  @wildfire.account_management.manage_accounts.should have_advanced_permissions
end