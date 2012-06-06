class Helpers::PageManagerHelper
  class << self
    def make_a_change_to_countdown_app
      updated_countdown_app_title = "Countdown #{String.random} #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}"

      wildfire = Model::Wildfire.new

      wildfire.wildfireapp_page_manager.wait_for_content_div
      wildfire.wildfireapp_page_manager.content_div.get_template_by_title('Countdown Timer').wait_for_and_click_edit_link

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

    def create_template
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_page_manager.content_div.templetes_drop_down_menu.click
      wildfire.wildfireapp_page_manager.content_div.click_templates_menu_create_blank_template_option

      name = %{TestTemplate#{String.random}}
      wildfire.wildfireapp_page_manager.new_template_dialog.wait_for_save_button
      wildfire.wildfireapp_page_manager.new_template_dialog.template_name.set name
      wildfire.wildfireapp_page_manager.new_template_dialog.save_button.click

      wildfire.template_builder.wait_for_and_click_back_to_templates_button
      wildfire.wildfireapp_page_manager.content_div.wait_for_templates
      return name
    end

    def clone_template(name='TestTemplate')
      wildfire = Model::Wildfire.new
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title name
      template.wait_for_drop_down_menu
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Clone Template" }.first[:href]
      content_div.page.execute_script %{ $('body > ol li a[href="#{link}"]').click() }
      msg = "Unable to clone template. Sticky Message = #{wildfire.wildfireapp_page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while wildfire.wildfireapp_page_manager.sticky_label.text != 'You have successfully cloned the template.' }
    end
  end
end
