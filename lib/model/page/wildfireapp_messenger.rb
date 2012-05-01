class Model::Page::WildfireappMessenger < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"
  set_url_matcher /messenger/

  element :messages_div_header, 'div#incoming_messages div.section.header h2'

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

  def assign_message_to_me message
    message.select
    page.execute_script("$('ol#message_action a[href=\"Assign\"]').click();")
    sleep 2
    assign_dialog.select_me
    assign_dialog.save_button.click
  end

  def is_messages_panel?
    messages_div_header.text == 'Messages'
  end

  def is_flagged_messages_panel?
    messages_div_header.text == 'Flagged Messages'
  end

  def is_assigned_messages_panel?
    messages_div_header.text == 'Assigned Messages'
  end

  def is_deleted_messages_panel?
    messages_div_header.text == 'Deleted Messages'
  end
end
