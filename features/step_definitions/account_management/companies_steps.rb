When /^I create a new Company under the current account$/ do
  @new_company_name = 'Some New Company'
  @wildfire.account_management.load
  @wildfire.account_management.create_company(@new_company_name)
end

When /^I create a new Company under a new Account$/ do
  @new_company_name = 'Some New Company'
  @wildfire.account_management.load
  @wildfire.account_management.create_company(@new_company_name, :new_account => true)
end

When /^I attempt to create a new company using the current company name$/ do
  @wildfire.account_management.load
  current_company_name = @wildfire.account_management.header.current_company_name
  @wildfire.account_management.create_company(current_company_name)
end

Then /^I should be using the new Company$/ do
  @wildfire.account_management.header.current_company_name.should == @new_company_name
end

Then /^I should see the message "([^"]*)" inside the create company modal$/ do |message|
  @wildfire.account_management.create_company_modal.form_errors.should include message
end

Then /^the new Account should be created$/ do
  @wildfire.account_management.header.company_select_button.click
  @wildfire.account_management.company_menu.account_names.should include @new_company_name
end