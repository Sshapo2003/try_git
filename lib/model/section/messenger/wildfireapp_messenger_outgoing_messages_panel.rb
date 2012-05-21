class Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel < SitePrism::Section
  elements :pagination_totals, 'div.pagination strong'
  element :enabled_next_page_button, 'a.next'
  element :enabled_previous_page_button, 'a.prev'
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

  def go_to_scheduled_messages_last_page
    total_messages = pagination_totals[1].text
    total_pages = (Float(total_messages) / 25.0).ceil
    visit("#{Helpers::Config['wildfire_messenger_root']}/scheduled_messages?page=#{total_pages}")
  end
end
