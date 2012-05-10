class Model::Page::WildfireappMessenger::WildfireappMessenger < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/

  element :messages_div_header, 'div.section.header h2'
  element :compose_message_div_header, 'div#messenger_form h2'
  element :sticky_header_text, 'span.flash_contents'

  section :compose_message_panel, Model::Section::Messenger::WildfireappMessengerComposeMessagePanel, 'div#messenger_form'
  section :messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :flagged_messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :assigned_messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :deleted_messages_panel, Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel, 'div#incoming_messages'
  section :sent_messages_panel, Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel, 'div#sent_messages'
  section :draft_messages_panel, Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel, 'div#draft_messages'
  section :sidebar, Model::Section::Messenger::WildfireappMessengerSidebar, 'div.sidebar'
  section :assign_dialog, Model::Section::Messenger::WildfireappMessengerUserAssignmentFormDialog, 'form#message_user_assignment_form'


  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end

  def attach_to_message(attachment_details)
    compose_message_panel.attach_to_message(attachment_details)
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

  def load_compose_message_panel
    sidebar.compose_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_compose_message_panel? }
  end

  def is_compose_message_panel?
    begin
      compose_message_div_header.text == 'Compose a Message'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def load_messages_panel
    sidebar.messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_messages_panel? }
  end

  def is_messages_panel?
    begin
      messages_div_header.text == 'Messages'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def load_flagged_messages_panel
    sidebar.flagged_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_flagged_messages_panel? }
  end

  def is_flagged_messages_panel?
    begin
      messages_div_header.text == 'Flagged Messages'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def load_assigned_messages_panel
    sidebar.assigned_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_assigned_messages_panel? }
  end

  def is_assigned_messages_panel?
    begin
      messages_div_header.text == 'Assigned Messages'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def load_deleted_messages_panel
    sidebar.deleted_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_deleted_messages_panel? }
  end

  def is_deleted_messages_panel?
    begin
      messages_div_header.text == 'Deleted Messages'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def load_sent_messages_panel
    sidebar.sent_messages_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_sent_messages_panel? }
  end

  def is_sent_messages_panel?
    begin
      messages_div_header.text == 'Sent Messages'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def load_drafts_panel
    sidebar.drafts_link.click
    Timeout.timeout(30) { sleep 0.1 while not is_drafts_panel? }
  end

  def is_drafts_panel?
    begin
      messages_div_header.text == 'Drafts'
    rescue Capybara::ElementNotFound
      return false
    end
  end

  def click_tab(tab)
    case tab
    when "Messages" 
      load_messages_panel
    when "Flagged Messages" 
      load_flagged_messages_panel
    when "Assigned Messages" 
      load_assigned_messages_panel
    when "Deleted Messages" 
      load_deleted_messages_panel
    when "Deleted Messages" 
      load_deleted_messages_panel
    when "Sent" 
      load_sent_messages_panel
    when "Drafts" 
      load_drafts_panel
    else raise "Unknown tab #{tab}"
    end
    sleep 2
  end

  def messages_in_folder(folder_name)
    click_tab folder_name
    if folder_name == "Sent"
      sent_messages_panel.messages_in_folder
    elsif folder_name == "Drafts"
      draft_messages_panel.messages_in_folder
    else
      messages_panel.messages.collect {|m| m.body.text }
    end
  end
end
