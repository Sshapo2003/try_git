When /^I update and publish the Countdown App$/ do
  @updated_countdown_app_title = Helpers::PageManagerHelper.make_a_change_to_countdown_app
end

Then /^the Page Manager page should be displayed$/ do
  msg = "Timed out waiting for Page Manager to be displayed"
  Timeout.timeout_and_raise(180, msg) { sleep 0.1 while @wildfire.wildfireapp_page_manager_edit_mode.displayed? == false }
end

Then /^the sticky note on the Page Manager page should display "(.*)"$/ do |message|
  @wildfire.wildfireapp_page_manager_edit_mode.header_sticky.text.should eql message
end

When /^I view "(.*?)" in the left hand nav bar of Page Manager$/ do |link|
  @wildfire.wildfireapp_page_manager.sidebar_links.select {|l| l.text.include? link }.first.click
end
