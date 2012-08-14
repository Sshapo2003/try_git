class Model::Section::Messenger::Uitk5WildfireappMessengerOutgoingMessage < Model::Section::Messenger::WildfireappMessengerOutgoingMessage
  element :body, '.body'
  element :edit_draft_link, '.edit'
  element :delete_draft_button, '.delete'

  def edit_draft
    message_body = body.text
    visit edit_draft_link[:href]
    message_body
  end

  def delete_first_draft
    delete_draft_button.click
    sleep 2 # Wait for 'Are you sure?' dialog to become visible
    page.driver.browser.switch_to.alert.accept
  end
end
