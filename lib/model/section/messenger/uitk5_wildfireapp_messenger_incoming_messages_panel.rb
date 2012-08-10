class Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessagesPanel < Model::Section::Messenger::WildfireappMessengerIncomingMessagesPanel 
  sections :messages, Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessage, 'table.messages tr'

  def assigned_messages
    messages.select {|m| m.is_assigned?}
  end

  def unassigned_messages
    messages.reject {|m| m.is_assigned?}
  end

  def flagged_messages
    messages.select {|m| m.is_flagged?}
  end

  def messages_in_folder
    messages.collect {|m| m.body.text }
  end
end
