When /^I add the Facebook application "(.*?)" to Wildfire$/ do |app_name|
  app_credentials = Helpers::FacebookAppsHelper.get_credentials_for(app_name)
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.add_application(app_credentials['remote id'], app_credentials['secret'])
end

Then /^"(.*?)" should appear in my custom applications$/ do |app_name|
  @wildfire.account_management.load_section('Applications')
  @wildfire.account_management.social_apps.facebook_apps.should include app_name
end