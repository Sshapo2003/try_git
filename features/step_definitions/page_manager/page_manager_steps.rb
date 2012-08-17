When /^I view the wildfire app messenger page as the default user$/ do
  step 'I am logged in to Wildfire as the default user'
  @messengeradmin.refresh_a_social_property.load
  @messengeradmin.refresh_a_social_property.refresh_property Helpers::Config['twitter_property_name']
  step 'I navigate to the wildfire app messenger page'
end

When /^I update and publish the Countdown App$/ do
  @updated_countdown_app_title = Helpers::PageManagerHelper.make_a_change_to_countdown_app
end

Then /^the Page Manager page should be displayed$/ do
  msg = "Timed out waiting for Page Manager to be displayed"
  Timeout.timeout_and_raise(180, msg) { sleep 0.1 while @wildfire.page_manager_edit_mode.displayed? == false }
end

Then /^the sticky note on the Page Manager page should display "(.*)"$/ do |message|
  @wildfire.page_manager_edit_mode.header_sticky.text.should include message
end

When /^I view "(.*?)" in the left hand nav bar of Page Manager$/ do |link|
  @wildfire.page_manager.wait_for_sidebar_links(30)
  link = @wildfire.page_manager.sidebar_links.select {|l| l.text.include? link }.first
  unless link == nil then link.click end
end

When /^I view the Page Managers "(.*?)" tab$/ do |tab_name|
  link = @wildfire.page_manager.sidebar_links.select {|l| l.text.include? tab_name}.first
  unless link == nil then link.click end
end
