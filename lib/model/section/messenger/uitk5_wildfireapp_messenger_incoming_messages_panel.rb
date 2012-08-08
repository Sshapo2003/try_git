class Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel < Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel 
  sections :messages, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessage, 'table.messages tr'

  def unassigned_messages
    messages.reject {|m| m.is_assigned?}
  end
end
