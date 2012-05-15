class Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel < SitePrism::Section
  elements :pagination_totals, 'div.pagination strong'
  element :enabled_next_page_button, 'a[href="/scheduled_messages?page=2"]'
  element :enabled_previous_page_button, 'a[href="/scheduled_messages?page=1"]'
  sections :messages, Model::Section::Messenger::WildfireappMessengerOutgoingMessage, 'div.message'
  
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
