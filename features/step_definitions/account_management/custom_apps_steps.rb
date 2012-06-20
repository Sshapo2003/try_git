When /^I (?:add|have added) the Facebook application "(.*?)" to (?:Wildfire|my custom applications)$/ do |app_name|
  app_credentials = Helpers::FacebookAppsHelper.get_credentials_for(app_name)
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.add_application(app_credentials['remote id'], app_credentials['secret'])
end

When /^I add try to add an invalid application to my custom applications$/ do
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.show_add_application_modal
  @wildfire.account_management.social_apps.new_social_app.add_application('12345678', 's3r10uslyth1sw0ntw0rk')
end

When /^I (?:add|have added) the page "(.*?)" to the application "(.*?)"$/ do |page_name, app_name|
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.add_fb_page_to_app(page_name, app_name)
end

When /^I remove the "(.*?)" page from the app "(.*?)"$/ do |page_name, app_name|
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.remove_fb_page_from_app(page_name, app_name)
end

When /^I remove "(.*?)" from my custom applications$/ do |app_name|
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.remove_app(app_name)
end

Then /^"(.*?)" (should|should not) appear in my custom applications$/ do |expectation, app_name|
  @wildfire.account_management.load_section('Applications')
  if expectation == 'should'
    @wildfire.account_management.social_apps.facebook_apps.should include app_name
  else
    @wildfire.account_management.social_apps.facebook_apps.should_not include app_name
  end
end

Then /^the Add Application modal should display the error message$/ do |message|
  wait_until() { @wildfire.account_management.social_apps.new_social_app.has_errors? }
  @wildfire.account_management.social_apps.new_social_app.errors.should include message
end

Then /^"(.*?)" (should|should not) be listed under "(.*?)" in applications$/ do |page_name, expectation, app_name|
  @wildfire.account_management.load_section('Applications')
  if expectation == 'should'
    @wildfire.account_management.social_apps.pages_for_fb_app(app_name).should include page_name
  else
    @wildfire.account_management.social_apps.pages_for_fb_app(app_name).should_not include page_name
  end
end