class Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessage < Model::Section::Messenger::WildfireappMessengerOutgoingMessage
  element :body, '.body'
  element :edit_draft_link, '.edit'

  def edit_draft
    message_body = body.text
    visit edit_draft_link[:href]
    message_body
  end
end
