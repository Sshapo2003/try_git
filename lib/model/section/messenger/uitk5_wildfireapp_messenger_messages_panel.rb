class Model::Section::Messenger::Uitk5WildfireappMessengerMessagesPanel < Model::Section::Messenger::WildfireappMessengerMessagesPanel
  element :assign_button,                 'a[href="Assign"]'
  element :delete_button,                 'a[href="Delete"]'
  element :unflag_button,                 'a[href="Unflag"]'
  element :clear_deleted_messages_button, '.delete_all_messages'
  element :enabled_next_page_button,      '.next a'
  element :disabled_previous_page_button, 'li.previous_page.disabled'
  element :disabled_next_page_button,     'li.next_page.disabled'
  elements :pagination_links,             '.pagination li a'

  def go_to_last_page
    pagination_links[(pagination_links.size - 2)].click
    wait_for_disabled_next_page_button
  end
end
