class Model::Page::WildfireappMessenger::Uitk5WildfireappMessenger < Model::Page::WildfireappMessenger::WildfireappMessenger
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/
  
  element :messages_div_header, '.span8'
  element :new_message_button, '.btn-primary'
  element :sticky_header_text, '.flashes .flash'

  section :sidebar, Model::Section::Messenger::Uitk5WildfireappMessengerSidebar, '.the-hero > #sidebar #messenger-nav'
  section :messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :compose_message_panel, Model::Section::Messenger::Uitk5WildfireappMessengerComposeMessagePanel, 'div#messenger_form'
  section :draft_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessagesPanel, 'div#draft_messages'
  section :scheduled_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerScheduledMessagesPanel, '.main_container'
  section :sent_messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerSentMessagesPanel, '.main_container'
  section :filters_panel, Model::Section::Messenger::Uitk5WildfireappMessengerFiltersPanel, '.main_container'
  section :create_filter_dialog, Model::Section::Messenger::Uitk5WildfireappMessengerCreateFilterFormDialog, '#new_message_filter'

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
end
