class Model::Section::Messenger::WildfireappMessengerSentMessage < Model::Section::Messenger::WildfireappMessengerOutgoingMessage
  element :body, '.message_body'
  element :edit_draft_link, '.edit'

  def edit_draft
    message_body = body.text
    visit edit_draft_link[:href]
    message_body
  end
end
