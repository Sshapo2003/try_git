class Model::Page::WildfireappMessenger::Uitk5WildfireappMessenger < Model::Page::WildfireappMessenger::WildfireappMessenger
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/
  
  element :messages_div_header, '.span8'
  element :new_message_button, "a:contains('New Message')"
  element :sticky_header_text, '.flashes .flash'
  element :notifications_trigger, '#notifications_trigger'
  element :unflag_message_button, 'a[href="Unflag"]'

  section :sidebar, Model::Section::Messenger::Uitk5WildfireappMessengerSidebar, '.the-hero > #sidebar #messenger-nav'
  section :flagged_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :assigned_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :deleted_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :compose_message_panel, Model::Section::Messenger::Uitk5WildfireappMessengerComposeMessagePanel, 'div#messenger_form'
  section :draft_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessagesPanel, 'div#draft_messages'
  section :scheduled_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerScheduledMessagesPanel, '.main_container'
  section :sent_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerSentMessagesPanel, '.main_container'
  section :assigned_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, '.main_container'
  section :filters_panel, Model::Section::Messenger::Uitk5WildfireappMessengerFiltersPanel, '.main_container'
  section :create_filter_dialog, Model::Section::Messenger::Uitk5WildfireappMessengerCreateFilterFormDialog, '#message_filter_form'
  section :assign_dialog, Model::Section::Messenger::Uitk5WildfireappMessengerUserAssignmentFormDialog, '#message_assignment_dialog #message_assignment_dialog'
  sections :notifications, Model::Section::Generic::Uitk5WildfireappNotification, '.notification'
  section :edit_filter_dialog, Model::Section::Messenger::Uitk5WildfireappMessengerCreateFilterFormDialog, '#message_filter_form'

  def click_tab(tab)
    case tab
    when "Compose" 
      compose_message
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

  def load_panel (panel_link, is_panel_expression)
    panel_link.click
    msg = "Panel header failed to appear after waiting 30 seconds."
    Timeout.timeout_and_raise(30, msg) { sleep 0.1 while not is_expected_panel?(is_panel_expression) }
  end

  def compose_message
    new_message_button.click
    wait_until { has_compose_message_panel? }
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

  def create_a_filter
    filter_name = "test filter #{String.random} #{Time.hours_mins_seconds}"
    filters_panel.create_new_filter_button.click
    create_filter_dialog.name.set filter_name
    create_filter_dialog.keywords.set "hawtdog, #{String.random}, #{String.random} "
    return filter_name
  end

  def unflag_message(message)
    message.select
    unflag_message_button.click
    Timeout.timeout(30) { sleep 0.1 while not sticky_header_text.text.include? "Flagged Message has been cleared." }
  end

  def assign_message_to_me(message)
    message.select
    messages_panel.assign_button.click
    wait_for_assign_dialog(30)
    assign_dialog.select_me
    assign_dialog.save_button.click
  end

  def assign_filter_to_my_company filter_name
    filters_panel.filter_by_name(filter_name).edit
    edit_filter_dialog.wait_for_save_button 30
    edit_filter_dialog.add_property Helpers::Config['facebook_property_name']
  end
end
