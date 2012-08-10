class Model::Section::Messenger::Uitk5WildfireappMessengerSentMessagesPanel < Model::Section::Messenger::WildfireappMessengerOutgoingMessagesPanel
  element :next_page_button, '.next_page a'
  element :disabled_next_page_button, '.next_page.disabled'
  sections :messages, Model::Section::Messenger::Uitk5WildfireappMessengerSentMessage, 'tbody tr'

  def messages_in_folder
    messages.collect {|m| m.body.text }
  end
end
