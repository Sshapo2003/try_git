DELINQUENT_FLASH_MESSAGE = "Access to your account has been suspended due to non payment. Please contact us at 650-352-3248 or billing@wildfireapp.com"
REQUEST_PAYMENT_MESSAGE = "Access to your account has been suspended due to non payment. Please contact us at 650-352-3248 or billing@wildfireapp.com"

Given /^I am logged in to Wildfire as a user with a delinquent account$/ do
  Helpers::AccountManagementHelper.login_account(Helpers::AccountManagementHelper::ACCOUNTS[:delinquent])
end

When /^I switch to a non\-delinquent account$/ do
  @wildfire.account_management.switch_company('Enabled Company')
end

When /^I switch to a delinquent account$/ do
  @wildfire.account_management.switch_company('Delinquent Company')
end

Then /^I should see the delinquent account flash message$/ do
  page.should(have_content(DELINQUENT_FLASH_MESSAGE), "The delinquent account flash message was not present on the page")
end

Then /^I should see the request for payment page$/ do
  page.should(have_content(REQUEST_PAYMENT_MESSAGE), "The message '#{REQUEST_PAYMENT_MESSAGE}' was not present on the page")
end

Then /^I should be redirected to Account Management$/ do
  @wildfire.account_management.should(be_loaded, "Currently on '#{current_url}', not Account Management")
end