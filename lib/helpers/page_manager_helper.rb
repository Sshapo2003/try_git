class Helpers::PageManagerHelper
  class << self
    def update_template_with_valid_liquid_content template
      wildfire = Model::Wildfire.new
      edit_template_design(template.title_div.text)
      liquid_content = "Hello World #{String.random}"
      wildfire.template_builder.update_default_liquid liquid_content
      sleep 2
      wildfire.template_builder.publish_template_changes_button.click
      sleep 2
      wildfire.template_builder.wait_for_and_click_publish_changes_model_publish_template_changes_button

      msg = "Time out occured while waiting for template to be published."
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 until wildfire.template_builder.sticky_label.text.include? "You've successfully created a new Template version!" }

      liquid_content
    end

    def update_template_title(template, title)
      wildfire = Model::Wildfire.new
      edit_default_content(template.title_div.text)
      wildfire.template_content_editor.set_template_name title
      wildfire.template_content_editor.go_back_button.click
    end

    def make_a_change_to_countdown_app
      updated_countdown_app_title = "Countdown #{String.random} #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}"
      wildfire = Model::Wildfire.new
      wildfire.page_manager.wait_for_published_pages_panel(30)
      page = wildfire.page_manager.published_pages_panel.get_page_by_title('Countdown Timer').edit_link.click
      wildfire.page_manager_edit_mode.sidebar.content_menu.wait_for_and_click_header_text_edit_link
      wildfire.wildfireapp_countdown_template_edit_header.body_text(updated_countdown_app_title)
      wildfire.wildfireapp_countdown_template_edit_header.save_button.click

      updated_countdown_app_title
    end

    def publish_completed_page
      wildfire = Model::Wildfire.new

      Timeout.timeout(30) do
        while wildfire.page_manager_edit_mode.sidebar.has_inactive_publish_menu_div? do
          wildfire.page_manager_edit_mode.sidebar.publish_menu.publish_accordian_link.click
          sleep 1
        end
      end
      
      wildfire.page_manager_edit_mode.sidebar.publish_menu.click_publish_to_facebook

      publish_modal = wildfire.page_manager_edit_mode.publish_to_facebook_modal
      publish_modal.select_property(Helpers::Config['facebook_property_name'])
      publish_modal.select_application(Helpers::Config['create_template_property_name'])
      publish_modal.overwrite_content

      publish_modal.update_button.click
      publish_modal.wait_for_publish_success_postit(30)
    end

    def get_template_menu_options
      wildfire = Model::Wildfire.new
      wildfire.page_manager.my_templates_panel.templates[0].wait_for_drop_down_menu(30)
      wildfire.page_manager.my_templates_panel.templates[0].drop_down_menu.click
      wildfire.page_manager.my_templates_panel.drop_down_menu_options.collect {|o| o.text}
    end

    def create_template
      wildfire = Model::Wildfire.new
      wildfire.page_manager.my_templates_panel.templetes_drop_down_menu.click
      wildfire.page_manager.my_templates_panel.create_blank_template_option.click

      name = %{TestTemplate#{String.random}}
      wildfire.page_manager.new_template_dialog.wait_for_save_button(30)
      wildfire.page_manager.new_template_dialog.template_name.set name
      wildfire.page_manager.new_template_dialog.save_button.click

      wildfire.template_builder.wait_for_and_click_back_to_templates_button(30)
      wildfire.page_manager.my_templates_panel.wait_for_templates(30)
      return name
    end

    def clone_template(name='TestTemplate')
      wildfire = Model::Wildfire.new
      my_templates_panel = wildfire.page_manager.my_templates_panel
      template = my_templates_panel.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      template.clone_template_menu_option.click
      wildfire.page_manager.wait_for_sticky_label(30)
      msg = "Time out occurred waiting for alert message 'You have successfully cloned the template.' to appear."
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 until wildfire.page_manager.sticky_label.text.include? 'You have successfully cloned the template.' }
    end

    def edit_template_design(name='TestTemplate')
      wildfire = Model::Wildfire.new
      my_templates_panel = wildfire.page_manager.my_templates_panel
      template = my_templates_panel.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.drop_down_menu_options.select {|o| o.text == "Edit Template Design" }.first[:href]
      template.visit link

      wildfire.template_builder.wait_for_back_to_templates_button(30)
    end

    def edit_default_content(name='TestTemplate')
      wildfire = Model::Wildfire.new
      wildfire.page_manager.wait_for_my_templates_panel(30)
      template = wildfire.page_manager.my_templates_panel.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      template.wait_for_drop_down_menu_options(30)
      template.edit_default_content_menu_option.click
      wildfire.template_content_editor.wait_for_go_back_button(30)
    end
    
    def delete_template(name='TestTemplate')
      wildfire = Model::Wildfire.new
      my_templates_panel = wildfire.page_manager.my_templates_panel
      template = my_templates_panel.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      template.delete_template_menu_option.click
      my_templates_panel.page.driver.browser.switch_to.alert.accept

      msg = "Unable to delete template. Sticky Message = #{wildfire.page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 until wildfire.page_manager.sticky_label.text.include? 'You have successfully deleted the template.' }
    end

    def upload_new_template
      wildfire = Model::Wildfire.new
      wildfire.page_manager.my_templates_panel.upload_new_template_link.click
      wildfire.upload_template.wait_for_template_name_textbox(30)

      template_name = "Uploaded Template #{String.random}"
      wildfire.upload_template.template_name_textbox.set template_name
      wildfire.upload_template.upload_a_template
      wildfire.upload_template.accept_terms_checkbox.click
      wildfire.upload_template.submit_button.click

      msg = "Unable to upload template. Sticky Message = #{wildfire.page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 until wildfire.page_manager.sticky_label.text.include?  "You've successfully uploaded a Template!" }

      template_name
    end

    def upload_new_version_of_template template_name
      wildfire = Model::Wildfire.new
      my_templates_panel = wildfire.page_manager.my_templates_panel
      template = my_templates_panel.get_template_by_title template_name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.drop_down_menu_options.select {|o| o.text == "Upload New Version" }.first[:href]
      template.visit link

      wildfire.upload_template.upload_a_template 'templates/updated_test_template_for_upload.zip'
      wildfire.upload_template.submit_button.click
      wildfire.page_manager.wait_for_sticky_label(30)

      msg = "Unable to upload template. Sticky Message = #{wildfire.page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 until wildfire.page_manager.sticky_label.text.include? "You have successfully added another version." }
    end

    def template_download_link template_name
      wildfire = Model::Wildfire.new
      my_templates_panel = wildfire.page_manager.my_templates_panel
      template = my_templates_panel.get_template_by_title template_name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.drop_down_menu_options.select {|o| o.text == "Download Template" }.first[:href]
    end
  end
end
