class Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel < Model::Section::Messenger::WildfireappMessengerMessagesPanel
  sections :messages, Model::Section::Messenger::WildfireappMessengerOutgoingMessage, 'div.message'
  
  def messages_in_folder
    messages.collect {|m| m.body.text }
  end

  def go_to_scheduled_messages_last_page
    total_messages = pagination_totals[1].text
    total_pages = (Float(total_messages) / 25.0).ceil
    visit("#{Helpers::Config['wildfire_messenger_root']}/scheduled_messages?page=#{total_pages}")
  end
end
