Given /^I have created a second Company in my account$/ do
  @first_company = @wildfire.account_management.current_company
  @wildfire.account_management.show_create_company_modal
  @second_company = 'My Second Company'
  @wildfire.account_management.create_company.create_company(@second_company)
end

Given /^I am using the default company for the account$/ do
  # Switch back to the @first_company if defined, otherwise just assume the current company is default
  @wildfire.account_management.switch_company(@first_company) if @first_company
  @default_company = @wildfire.account_management.current_company
end

When /^I create a new Company under the current account$/ do
  @new_company_name = 'Some New Company'
  @wildfire.account_management.show_create_company_modal
  @wildfire.account_management.create_company.create_company(@new_company_name)
end

When /^I create a new Company under a new Account$/ do
  @new_company_name = 'Some New Company'
  @wildfire.account_management.show_create_company_modal
  @wildfire.account_management.create_company.create_company(@new_company_name, :new_account => true)
end

When /^I attempt to create a new company using the current company name$/ do
  @wildfire.account_management.show_create_company_modal
  current_company_name = @wildfire.account_management.current_company
  @wildfire.account_management.create_company.create_company(current_company_name)
end

When /^I switch to the first Company$/ do
  @wildfire.account_management.switch_company(@first_company)
end

When /^I delete the second Company$/ do
  @wildfire.account_management.switch_company(@second_company) if @wildfire.account_management.current_company != @second_company
  step "I delete the current company"
end

When /^I delete the current company$/ do
  @wildfire.account_management.basic_info.load
  @wildfire.account_management.basic_info.delete_company
end

Then /^I should be using the new Company$/ do
  @wildfire.account_management.current_company.should == @new_company_name
end

Then /^I should see the message "([^"]*)" inside the create company modal$/ do |message|
  @wildfire.account_management.create_company.form_errors.should include message
end

Then /^the new Account should be created$/ do
  @wildfire.account_management.accounts.should include @new_company_name
end

Then /^I should be using the first Company$/ do
  @wildfire.account_management.current_company.should == @first_company
end

Then /^the second company should not appear in the Company selector menu$/ do
  @wildfire.account_management.companies.should_not include @second_company
end

Then /^my Companies should include "(.*?)"$/ do |company_name|
  @wildfire.account_management.companies.should include company_name
end

Then /^I should see Company "(.*?)" under Account "(.*?)"$/ do |company_name, account_name|
  @wildfire.account_management.accounts_companies[account_name].should include company_name
end