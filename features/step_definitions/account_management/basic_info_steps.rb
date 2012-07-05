Given /^I have uploaded a company logo$/ do
  @wildfire.account_management.basic_info.upload_logo("images/logo-wildfire-lrg.jpg")
  @wildfire.account_management.basic_info.should_not(have_no_logo, "Company logo failed to upload successfully")
end

When /^I update my Company Name to "([^"]*)"$/ do |new_name|
  @wildfire.account_management.basic_info.update_company_name(new_name)
end

When /^I update my Company Industry to "([^"]*)"$/ do |new_industry|
  @wildfire.account_management.basic_info.update_company_industry(new_industry)
end

When /^I update my Company Timezone to "([^"]*)"$/ do |timezone|
  @wildfire.account_management.basic_info.update_timezone(timezone)
end

When /^I update my Company website URL to "([^"]*)"$/ do |url|
  @wildfire.account_management.basic_info.update_website_url(url)
end

When /^I update my Company Description to$/ do |description|
  @wildfire.account_management.basic_info.update_description(description)
end

When /^I update my Company Email to "([^"]*)"$/ do |email|
  @wildfire.account_management.basic_info.update_company_email(email)
end

When /^I update my Reply Email to "([^"]*)"$/ do |email|
  @wildfire.account_management.basic_info.update_reply_email(email)
end

When /^I attempt to delete the company$/ do
  @wildfire.account_management.basic_info.delete_company
end

When /^I upload a valid image as my company logo$/ do
  @wildfire.account_management.basic_info.upload_logo("images/logo-wildfire-lrg.jpg")
end

When /^I upload a valid ([a-z]+) file as my company logo$/ do |format|
  @wildfire.account_management.basic_info.upload_logo("images/logo-wildfire-lrg.#{format}")
end

When /^I remove the company logo$/ do
  @wildfire.account_management.basic_info.remove_logo
end

Then /^the Company Name should be "([^"]*)"$/ do |name|
  @wildfire.account_management.basic_info.company_name.should == name
end

Then /^the Company Industry should be "([^"]*)"$/ do |industry|
  @wildfire.account_management.basic_info.industry.should == industry
end

Then /^the Company Timezone should be "([^"]*)"$/ do |timezone|
  @wildfire.account_management.basic_info.timezone.should == timezone
end

Then /^the Company Website URL should be "([^"]*)"$/ do |url|
  @wildfire.account_management.basic_info.website_url.should == url
end

Then /^the Company Description should be$/ do |description|
  @wildfire.account_management.basic_info.description.should == description
end

Then /^the Company Email should be "([^"]*)"$/ do |email|
  @wildfire.account_management.basic_info.company_email.should == email
end

Then /^the Reply Email should be "([^"]*)"$/ do |email|
  @wildfire.account_management.basic_info.reply_email.should == email
end

Then /^I should no longer see the default logo image$/ do
  @wildfire.account_management.basic_info.should_not(have_no_logo, "Expected not to find the default 'No logo' image, but it was present")
end

Then /^I should see the default logo image$/ do
   @wildfire.account_management.basic_info.should(have_no_logo, "Expected to find the default 'No logo' image, but it was not present")
end

Then /^the Company Name field should contain the name of the current company$/ do
  @wildfire.account_management.basic_info.company_name.should == @wildfire.account_management.current_company
end