class Model::Section::Messenger::Uitk5WildfireappMessengerMessagesPanel < Model::Section::Messenger::WildfireappMessengerMessagesPanel
  element :assign_button,                 'a[href="Assign"]'
  element :delete_button,                 'a[href="Delete"]'
  element :unflag_button,                 'a[href="Unflag"]'
  element :clear_deleted_messages_button, '.delete_all_messages'
  element :enabled_next_page_button,      '.next a'
end
