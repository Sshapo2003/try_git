When /^I update and publish the Countdown App$/ do
  @updated_countdown_app_title = Helpers::PageManagerHelper.make_a_change_to_countdown_app
end

Then /^the Page Manager page should be displayed$/ do
  Timeout.timeout(30) { sleep 0.1 while @wildfire.wildfireapp_page_manager_edit_mode.displayed? == false }
  @wildfire.wildfireapp_page_manager_edit_mode.should be_displayed
end

Then /^the sticky note on the Page Manager page should display "(.*)"$/ do |message|
  @wildfire.wildfireapp_page_manager_edit_mode.header_sticky.text.should eql message
end

When /^I publish the template$/ do
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.open
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.publish_to_facebook_link.click

  @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.wait_for_update_button(30)

  @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.select_property(Helpers::Config['facebook_property_name'])

  if !@wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.overwrite_prior_content_checkbox.checked?
    @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.overwrite_prior_content_checkbox.click
  end

  @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.select_application(Helpers::Config['create_template_property_name'])
  @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.update_button.click
end
