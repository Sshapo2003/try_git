class Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel < SitePrism::Section
  elements :message_bodies, 'tr .body'
  element :next_page_button, '.next_page a'
  element :disabled_next_page_button, '.next_page.disabled'
  sections :messages, Model::Section::Messenger::WildfireappMessengerOutgoingMessage, 'tbody tr'
  
  def messages_in_folder
    message_bodies.collect {|m| m.text }
  end

  def go_to_scheduled_messages_last_page
    total_messages = pagination_totals[1].text
    total_pages = (Float(total_messages) / 25.0).ceil
    visit("#{Helpers::Config['wildfire_messenger_root']}/scheduled_messages?page=#{total_pages}")
  end

  def has_message? message
    messages.select {|m| m.body.text.include? message }.count > 0
  end
end
