class Model::Page::WildfireappMessenger::WildfireappMessenger < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/

  element :messages_div_header, 'div#incoming_messages div.section.header h2'
  element :compose_message_div_header, 'div#messenger_form h2'
  element :flash_content, 'span.flash_contents'

  section :compose_message_panel, Model::Section::Messenger::WildfireappMessengerComposeMessagePanel, 'div#messenger_form'
  section :messages_panel, Model::Section::Messenger::WildfireappMessengerMessagesPanel, 'div#incoming_messages'
  section :flagged_messages_panel, Model::Section::Messenger::WildfireappMessengerMessagesPanel, 'div#incoming_messages'
  section :assigned_messages_panel, Model::Section::Messenger::WildfireappMessengerMessagesPanel, 'div#incoming_messages'
  section :deleted_messages_panel, Model::Section::Messenger::WildfireappMessengerMessagesPanel, 'div#incoming_messages'
  section :sidebar, Model::Section::Messenger::WildfireappMessengerSidebar, 'div.sidebar'
  section :assign_dialog, Model::Section::Messenger::WildfireappMessengerUserAssignmentForm, 'form#message_user_assignment_form'

  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end

  def compose_a_valid_message
    compose_message_panel.compose_a_valid_message
  end

  def compose_and_send_a_valid_message
    compose_message_panel.compose_and_send_a_valid_message
  end

  def assign_message_to_me message
    message.select
    page.execute_script("$('ol#message_action a[href=\"Assign\"]').click();")
    sleep 2
    assign_dialog.select_me
    assign_dialog.save_button.click
  end

  def unflag_message message
    message.select
    page.execute_script("$('ol#message_action a[href=\"Unflag\"]').click();")
    Timeout.timeout(30) { sleep 0.1 while not flash_content.text.include? "Flagged Message has been cleared." }
  end

  def load_compose_message_panel
    sidebar.compose_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_compose_message_panel? }
  end

  def is_compose_message_panel?
    compose_message_div_header.text == 'Compose a Message'
  end

  def load_messages_panel
    sidebar.messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_messages_panel? }
  end

  def is_messages_panel?
    messages_div_header.text == 'Messages'
  end

  def load_flagged_messages_panel
    sidebar.flagged_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_flagged_messages_panel? }
  end

  def is_flagged_messages_panel?
    messages_div_header.text == 'Flagged Messages'
  end

  def load_assigned_messages_panel
    sidebar.assigned_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_assigned_messages_panel? }
  end

  def is_assigned_messages_panel?
    messages_div_header.text == 'Assigned Messages'
  end

  def load_deleted_messages_panel
    sidebar.deleted_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_deleted_messages_panel? }
  end

  def is_deleted_messages_panel?
    messages_div_header.text == 'Deleted Messages'
  end
end
