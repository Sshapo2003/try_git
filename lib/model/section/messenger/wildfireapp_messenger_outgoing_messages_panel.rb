class Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel < SitePrism::Section
  sections :messages, Model::Section::Messenger::WildfireappMessengerOutgoingMessage, 'div.message'

  def messages_in_folder
    messages.collect {|m| m.body.text }
  end
end
