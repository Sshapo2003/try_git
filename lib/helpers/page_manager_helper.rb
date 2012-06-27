class Helpers::PageManagerHelper
  class << self
    def update_template_with_valid_liquid_content template
      wildfire = Model::Wildfire.new
      edit_template_design(template.title_div.text)
      wildfire.template_builder.edit_default_liquid_link.click
      liquid_content = "Hello World #{String.random}"


      Timeout.timeout(30 ) { sleep 0.1 while not wildfire.template_builder.page.evaluate_script("editor.isFocused()") }

      wildfire.template_builder.page.execute_script("editor.removeLines()")
      wildfire.template_builder.page.execute_script("editor.insert('#{liquid_content}')")
      wildfire.template_builder.edit_liquid_dialog_save_button.click
     
      sleep 1.0
      wildfire.template_builder.wait_for_publish_template_changes_button(30)
      wildfire.template_builder.page.execute_script("$('a.publish_template').click()")

      sleep 1.0
      wildfire.template_builder.page.execute_script(%{$('button[value="Publish"]').click()})

      msg = "Time out occured while waiting for template to be published."
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while not wildfire.template_builder.sticky_label.text.include?("You've successfully created a new Template version!") }

      liquid_content
    end

    def update_template_title(template, title)
      wildfire = Model::Wildfire.new
      edit_default_content(template.title_div.text)
      wildfire.template_editor.set_template_name title
      wildfire.template_editor.go_back_button.click
    end

    def make_a_change_to_countdown_app
      updated_countdown_app_title = "Countdown #{String.random} #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}"

      wildfire = Model::Wildfire.new

      wildfire.wildfireapp_page_manager.wait_for_content_div(30)
      wildfire.wildfireapp_page_manager.content_div.get_template_by_title('Countdown Timer').wait_for_and_click_edit_link
      wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.wait_for_and_click_header_text_edit_link
      wildfire.wildfireapp_countdown_template_edit_header.body_text(updated_countdown_app_title)
      wildfire.wildfireapp_countdown_template_edit_header.save_button.click

      updated_countdown_app_title
    end

    def publish_completed_page
      wildfire = Model::Wildfire.new

      wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.wait_for_and_click_link(30)
      wildfire.wildfireapp_page_manager_edit_mode.sidebar.publish_menu.wait_for_and_click_publish_to_facebook_link(30)

      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.wait_for_cancel_button(30)

      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.select_property(Helpers::Config['facebook_property_name'])
      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.select_application(Helpers::Config['create_template_property_name'])

      if !wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.overwrite_prior_content_checkbox.checked?
        wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.check_overwrite_previous_content_checkbox
      end

      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.update_button.click
      wildfire.wildfireapp_page_manager_edit_mode.publish_to_facebook_modal.wait_for_publish_success_postit(30)
    end

    def get_template_menu_options
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_page_manager.content_div.templates[0].wait_for_drop_down_menu(30)
      wildfire.wildfireapp_page_manager.content_div.templates[0].drop_down_menu.click
      wildfire.wildfireapp_page_manager.content_div.template_menu_options.collect {|o| o.text}
    end

    def create_template
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_page_manager.content_div.templetes_drop_down_menu.click
      wildfire.wildfireapp_page_manager.content_div.click_templates_menu_create_blank_template_option

      name = %{TestTemplate#{String.random}}
      wildfire.wildfireapp_page_manager.new_template_dialog.wait_for_save_button(30)
      wildfire.wildfireapp_page_manager.new_template_dialog.template_name.set name
      wildfire.wildfireapp_page_manager.new_template_dialog.save_button.click

      wildfire.template_builder.wait_for_and_click_back_to_templates_button(30)
      wildfire.wildfireapp_page_manager.content_div.wait_for_templates(30)
      return name
    end

    def clone_template(name='TestTemplate')
      wildfire = Model::Wildfire.new
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Clone Template" }.first[:href]
      content_div.page.execute_script %{ $('body > ol li a[href="#{link}"]').click() }
      wildfire.wildfireapp_page_manager.wait_for_sticky_label(30)
      msg = "Unable to clone template. Sticky Message = #{wildfire.wildfireapp_page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while wildfire.wildfireapp_page_manager.sticky_label.text != 'You have successfully cloned the template.' }
    end

    def edit_template_design(name='TestTemplate')
      wildfire = Model::Wildfire.new
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Edit Template Design" }.first[:href]
      template.visit link

      wildfire.template_builder.wait_for_back_to_templates_button(30)
    end

    def edit_default_content(name='TestTemplate')
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_page_manager.wait_for_content_div(30)
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Edit Default Content" }.first[:href]
      template.visit link

      wildfire.template_editor.wait_for_go_back_button(30)
    end
    
    def delete_template(name='TestTemplate')
      wildfire = Model::Wildfire.new
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Delete Template" }.first[:href]
      content_div.page.execute_script %{ $('body > ol li a[href="#{link}"]').click() }

      content_div.page.driver.browser.switch_to.alert.accept

      msg = "Unable to delete template. Sticky Message = #{wildfire.wildfireapp_page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while wildfire.wildfireapp_page_manager.sticky_label.text != 'You have successfully deleted the template.' }
    end

    def upload_new_template
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_page_manager.content_div.upload_new_template_link.click
      wildfire.upload_template.wait_for_template_name_textbox(30)

      template_name = "Uploaded Template #{String.random}"
      wildfire.upload_template.template_name_textbox.set template_name
      wildfire.upload_template.upload_a_template
      wildfire.upload_template.accept_terms_checkbox.click
      wildfire.upload_template.submit_button.click

      msg = "Unable to upload template. Sticky Message = #{wildfire.wildfireapp_page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while wildfire.wildfireapp_page_manager.sticky_label.text != "You've successfully uploaded a Template!" }

      template_name
    end

    def upload_new_version_of_template template_name
      wildfire = Model::Wildfire.new
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title template_name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Upload New Version" }.first[:href]
      template.visit link

      wildfire.upload_template.upload_a_template 'templates/updated_test_template_for_upload.zip'
      wildfire.upload_template.submit_button.click

      msg = "Unable to upload template. Sticky Message = #{wildfire.wildfireapp_page_manager.sticky_label.text}"
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while wildfire.wildfireapp_page_manager.sticky_label.text != "You have successfully added another version." }
    end

    def template_download_link template_name
      wildfire = Model::Wildfire.new
      content_div = wildfire.wildfireapp_page_manager.content_div
      template = content_div.get_template_by_title template_name
      template.wait_for_drop_down_menu(30)
      template.drop_down_menu.click
      link = template.template_menu_options.select {|o| o.text == "Download Template" }.first[:href]
    end
  end
end
