class Model::Section::Messenger::WildfireappMessengerScheduledMessagesPanel < Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel
  elements :message_bodies, 'tr .message_body'
  
  def go_to_scheduled_messages_last_page
    while has_disabled_next_page_button? == false
      first_message = message_bodies[0].text
      next_page_button.click

      msg = "New page of messages did not load."
      Timeout.timeout_and_raise(30, msg) { sleep 0.1 while message_bodies[0].text == first_message }
    end
  end

  def has_message? message
    message_bodies.select {|m| m.text.include? message}.count > 0
  end
end
