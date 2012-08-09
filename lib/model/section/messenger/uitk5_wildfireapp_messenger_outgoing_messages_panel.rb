class Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessagesPanel < Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel
  elements :message_bodies, 'tr .body'
  sections :messages, Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessage, 'tr'

  def messages_in_folder
    message_bodies.collect {|m| m.text }
  end

end
