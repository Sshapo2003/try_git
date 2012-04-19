When /^I update and publish the Countdown App$/ do
  @updated_countdown_app_title = "Countdown #{String.random} #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}"

  @wildfire.wildfireapp_page_manager.content_div.get_page_by_title('Countdown').edit_link.click
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.header_text_edit_link.click
  @wildfire.wildfireapp_countdown_template_edit_header.body_text(@updated_countdown_app_title)
  @wildfire.wildfireapp_countdown_template_edit_header.save_button.click
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.save_button.click
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.open
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.publish_to_facebook_link.click

  if !@wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.overwrite_prior_content_checkbox.checked?
    @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.overwrite_prior_content_checkbox.click
  end

  @wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.update_button.click
end
