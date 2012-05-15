class Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel < SitePrism::Section
  elements :pagination_totals, 'div.pagination strong'
  element :actions_menu, 'div.wf_prompt_button_wpr a'
  element :actions_menu_assign_option, "ol#message_action a[href='Assign']"
  element :enabled_next_page_button, 'a.next'
  element :enabled_previous_page_button, 'a.prev'

  sections :messages, Model::Section::Messenger::WildfireappMessengerIncomingMessage, 'div.incoming_message'

  def assigned_messages
    messages.select {|m| m.is_assigned?}
  end

  def unassigned_messages
    messages.reject {|m| m.is_assigned?}
  end

  def flagged_messages
    messages.select {|m| m.is_flagged?}
  end

  def pagination_current_page_indicator_text
    pagination_totals[0].text
  end

  def pagination_message_total_text
    pagination_totals[1].text
  end

  def messages_in_folder
    messages.collect {|m| m.body.text }
  end
end
