class Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessagesPanel < Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel
  elements :message_bodies, 'tr .body'
  element :next_page_button, '.next_page a'
  element :disabled_next_page_button, '.next_page.disabled'
  sections :messages, Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessage, 'tbody tr'

  def messages_in_folder
    message_bodies.collect {|m| m.text }
  end
end
