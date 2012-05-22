class Model::Page::WildfireappMessenger::WildfireappMessenger < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/

  element :messages_div_header, 'div.section.header h2'
  element :compose_message_div_header, 'div#messenger_form h2'
  element :sticky_header_text, 'span.flash_contents'
  element :notifications_trigger, 'a#notifications_trigger'

  section :compose_message_panel, Model::Section::Messenger::WildfireappMessengerComposeMessagePanel, 'div#messenger_form'
  section :messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :flagged_messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :assigned_messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :deleted_messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :sent_messages_panel, Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel, 'div#sent_messages'
  section :draft_messages_panel, Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel, 'div#draft_messages'
  section :scheduled_messages_panel, Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel, 'div#scheduled_messages'
  section :filters_panel, Model::Section::Messenger::WildfireappMessengerFiltersPanel, 'div#message_filters'
  section :sidebar, Model::Section::Messenger::WildfireappMessengerSidebar, 'div.sidebar'
  section :assign_dialog, Model::Section::Messenger::WildfireappMessengerUserAssignmentFormDialog, 'form#message_user_assignment_form'
  section :create_filter_dialog, Model::Section::Messenger::WildfireappMessengerCreateFilterFormDialog, 'div.ui-dialog'
  section :edit_filter_dialog, Model::Section::Messenger::WildfireappMessengerCreateFilterFormDialog, 'div.ui-dialog'
  sections :notifications, Model::Section::Generic::WildfireappNotification, 'div#notifications a div'

  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end

  def create_a_filter
    filter_name = "test filter #{String.random} #{Time.hours_mins_seconds}"
    filters_panel.create_new_filter_button.click
    create_filter_dialog.name.set filter_name
    create_filter_dialog.keywords.set "hawtdog, #{String.random}, #{String.random} "
    return filter_name
  end

  def create_and_save_a_valid_filter
    filter_name = "test filter #{String.random} #{Time.hours_mins_seconds}"
    filters_panel.create_new_filter_button.click
    create_filter_dialog.name.set filter_name
    create_filter_dialog.keywords.set "hawtdog, #{String.random}, #{String.random} "
    create_filter_dialog.save_button.click
    Timeout.timeout_and_raise(180, 'Filter not found') do
      found = false
      while !found
        begin
          while filters_panel.filters.select {|f| f.name.text.include? filter_name }.count < 1
            sleep 0.1
          end
          found = true
        rescue Selenium::WebDriver::Error::StaleElementReferenceError
          # Wait for panel to refresh
        end
      end
    end
    return filter_name
  end

  def delete_filter filter_name
    filters_panel.filter_by_name(filter_name).delete
  end

  def assign_filter_to_my_company filter_name
    filters_panel.filter_by_name(filter_name).edit
    edit_filter_dialog.wait_for_save_button 30
    edit_filter_dialog.add_property Helpers::Config['facebook_property_name']
  end

  def unassign_filter_from_my_company filter_name
    filters_panel.filter_by_name(filter_name).edit
    edit_filter_dialog.wait_for_save_button 30
    edit_filter_dialog.remove_property Helpers::Config['facebook_property_name']
  end

  def update_filters_keywords filter_name, keywords
    filter = filters_panel.filters.select {|f| f.name.text.include? filter_name }.first
    filter.edit
    edit_filter_dialog.wait_for_save_button 30
    edit_filter_dialog.keywords.set keywords
    create_filter_dialog.save_button.click
    sleep 5
    updated_filter = filters_panel.filter_by_name(filter_name)
    Timeout.timeout_and_raise(30, 'Filter not found') { sleep 0.1 unless updated_filter.keyword_count.text.include? '2 keywords' }
  end

  def attach_to_message(attachment_details)
    compose_message_panel.attach_to_message(attachment_details)
  end

  def schedule_message(scheduled_time)
    compose_message_panel.schedule_message scheduled_time
  end

  def send_message
    compose_message_panel.send_message
  end

  def send_draft_message
    compose_message_panel.send_draft_message
  end

  def save_as_draft
    compose_message_panel.save_as_draft
  end

  def compose_a_valid_message
    compose_message_panel.compose_a_valid_message
  end

  def compose_and_send_a_valid_message
    compose_message_panel.compose_and_send_a_valid_message
  end

  def compose_and_send_a_valid_message_to_twitter
    compose_message_panel.compose_and_send_a_valid_message 'paloaltofoodie'
  end

  def assign_message_to_me(message)
    message.select
    page.execute_script("$('ol#message_action a[href=\"Assign\"]').click();")
    Timeout.timeout(30) { sleep 0.1 while page.has_no_selector? 'form#message_user_assignment_form' }
    assign_dialog.select_me
    assign_dialog.save_button.click
  end

  def unflag_message(message)
    message.select
    page.execute_script("$('ol#message_action a[href=\"Unflag\"]').click();")
    Timeout.timeout(30) { sleep 0.1 while not sticky_header_text.text.include? "Flagged Message has been cleared." }
  end

  def click_tab(tab)
    case tab
    when "Compose" 
      load_panel(sidebar.compose_link, Proc.new { compose_message_div_header.text == 'Compose a Message' })
    when "Messages" 
      load_panel(sidebar.messages_link, Proc.new { messages_div_header.text == 'Messages' })
    when "Flagged Messages" 
      load_panel(sidebar.flagged_messages_link, Proc.new { messages_div_header.text == 'Flagged Messages' })
    when "Assigned Messages" 
      load_panel(sidebar.assigned_messages_link, Proc.new { messages_div_header.text == 'Assigned Messages' })
    when "Deleted Messages" 
      load_panel(sidebar.deleted_messages_link, Proc.new { messages_div_header.text == 'Deleted Messages' })
    when "Sent" 
      load_panel(sidebar.sent_messages_link, Proc.new { messages_div_header.text == 'Sent Messages' })
    when "Drafts" 
      load_panel(sidebar.drafts_link, Proc.new { messages_div_header.text == 'Drafts' })
    when "Scheduled" 
      load_panel(sidebar.scheduled_link, Proc.new { messages_div_header.text == 'Scheduled Messages' })
    when "Filters" 
      load_panel(sidebar.filters_link, Proc.new { messages_div_header.text == 'Keyword Filters' })
    else raise "Unknown tab #{tab}"
    end
  end

  def messages_in_folder(folder_name)
    click_tab folder_name
    if folder_name == "Sent"
      sent_messages_panel.messages_in_folder
    elsif folder_name == "Drafts"
      draft_messages_panel.messages_in_folder
    elsif folder_name == "Scheduled"
      scheduled_messages_panel.messages_in_folder
    else
      messages_panel.messages.collect {|m| m.body.text }
    end
  end

  private

  def load_panel (panel_link, is_panel_expression)
    panel_link.click
    begin
      Timeout.timeout(30) { sleep 0.1 while not is_expected_panel?(is_panel_expression) }
    rescue Timeout::Error
      raise "Panel header '#{panel_header_text}' failed to appear after waiting 30 seconds."
    end
  end

  def is_expected_panel?(is_panel_expression)
    begin
      is_panel_expression.call
    rescue Capybara::ElementNotFound
      return false
    end
  end
end
