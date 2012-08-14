class Model::Section::Messenger::WildfireappMessengerMessagesPanel < SitePrism::Section
  elements :pagination_totals, 'div.pagination strong'
  element :enabled_next_page_button, '.next'
  element :enabled_previous_page_button, '.prev'
  element :actions_menu, 'div.wf_prompt_button_wpr a'
  element :clear_deleted_messages_button, 'a.delete_all_messages'
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
end
