class Helpers::PageManagerHelper
  class << self
    def make_a_change_to_countdown_app
      updated_countdown_app_title = "Countdown #{String.random} #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}"

      wildfire = Model::Wildfire.new

      wildfire.wildfireapp_page_manager.wait_for_content_div
      wildfire.wildfireapp_page_manager.content_div.get_page_by_title('Countdown Timer').wait_for_and_click_edit_link

      wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.header_text_edit_link.click

      wildfire.wildfireapp_countdown_template_edit_header.body_text(updated_countdown_app_title)
      wildfire.wildfireapp_countdown_template_edit_header.save_button.click

      wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.wait_for_and_click_save_button
      return updated_countdown_app_title
    end

    def publish_completed_page
      wildfire = Model::Wildfire.new

      wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.wait_for_and_click_link
      wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.wait_for_and_click_publish_to_facebook_link

      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.wait_for_cancel_button(30)

      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.select_property(Helpers::Config['facebook_property_name'])
      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.select_application(Helpers::Config['create_template_property_name'])

      if !wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.overwrite_prior_content_checkbox.checked?
        wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.check_overwrite_previous_content_checkbox
      end

      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.update_button.click
      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.wait_for_publish_success_postit
    end

    def get_template_menu_options
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_page_manager.content_div.templates[0].wait_for_drop_down_menu
      wildfire.wildfireapp_page_manager.content_div.templates[0].drop_down_menu.click
      wildfire.wildfireapp_page_manager.content_div.template_menu_options.collect {|o| o.text}
    end
  end
end
