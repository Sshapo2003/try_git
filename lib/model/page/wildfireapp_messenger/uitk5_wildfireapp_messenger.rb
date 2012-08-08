class Model::Page::WildfireappMessenger::Uitk5WildfireappMessenger < Model::Page::WildfireappMessenger::WildfireappMessenger
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/

  element :new_message_button, '#new_message_button'
  element :sticky_header_text, '.flashes .flash'

  section :sidebar, Model::Section::Messenger::Uitk5WildfireappMessengerSidebar, '.the-hero > #sidebar #messenger-nav'
  section :messages_panel, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :compose_message_panel, Model::Section::Messenger::Uitk5WildfireappMessengerComposeMessagePanel, 'div#messenger_form'

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

  def compose_message
    new_message_button.click
  end
end
