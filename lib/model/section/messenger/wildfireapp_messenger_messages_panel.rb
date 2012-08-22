class Model::Section::Messenger::WildfireappMessengerMessagesPanel < SitePrism::Section
  element :assign_button,                 'a[href="Assign"]'
  element :delete_button,                 'a[href="Delete"]'
  element :unflag_button,                 'a[href="Unflag"]'
  element :clear_deleted_messages_button, '.delete_all_messages'
  element :enabled_next_page_button,      '.next a'
  element :disabled_previous_page_button, 'li.previous_page.disabled'
  element :disabled_next_page_button,     'li.next_page.disabled'
  elements :pagination_links,             '.pagination li a'
  elements :pagination_totals, 'div.pagination strong'
  element :enabled_previous_page_button, '.prev'
  element :actions_menu, 'div.wf_prompt_button_wpr a'
  root_element :actions_menu_options, 'ol#message_action'
  
  def pagination_current_page_indicator_text
    pagination_totals[0].text
  end

  def pagination_message_total_text
    pagination_totals[1].text
  end

  def messages_in_folder
    messages.collect {|m| m.body.text }
  end

  def go_to_scheduled_messages_last_page
    total_messages = pagination_totals[1].text
    total_pages = (Float(total_messages) / 25.0).ceil
    visit("#{Helpers::Config['wildfire_messenger_root']}/scheduled_messages?page=#{total_pages}")
  end

  def click_enabled_next_page_button
    enabled_next_page_button.click
  end

  def go_to_last_page
    pagination_links[(pagination_links.size - 2)].click
    wait_for_disabled_next_page_button
  end
end
