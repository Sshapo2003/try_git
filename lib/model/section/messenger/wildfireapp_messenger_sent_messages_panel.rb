class Model::Section::Messenger::WildfireappMessengerSentMessagesPanel < Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel
  element :next_page_button, '.next_page a'
  element :disabled_next_page_button, '.next_page.disabled'
  sections :messages, Model::Section::Messenger::WildfireappMessengerSentMessage, 'tbody tr'

  def messages_in_folder
    messages.collect {|m| m.body.text }
  end
end
