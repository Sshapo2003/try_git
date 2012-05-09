class Model::Section::Messenger::WildfireappMessengerComposeMessagePanel < SitePrism::Section
  element :message_textbox, 'textarea#message_body'
  element :send_button, "button.wf_submit[name='commit']"
  element :recepients_error, 'div#recipients p.inline_error'
  element :message_error, 'div#message_container p.inline_error'

  section :attachments_section, Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSection, 'ol.attach'
  sections :recipients, Model::Section::Messenger::WildfireappMessengerRecipient, 'div.recipient'

  def select_recipient_by_name(recipient_name='Palo Alto Foodies')
    i = 0
    while i < recipients.size do
      if recipients[i].name.text == recipient_name 
        page.execute_script("$('div#messenger_form div.recipient div input')[#{i}].click();")
      end
      i = i + 1
    end
  end

  def compose_a_valid_message(recipient_name='Palo Alto Foodies')
    t = Time.now
    message_text = "Today is #{t.strftime("%A")} #{t.strftime("%d")} #{t.strftime("%b")} #{t.strftime("%Y")} and the time is #{t.strftime("%R")}. What great foods have you discovered recently?"
    select_recipient_by_name recipient_name
    message_textbox.set message_text
    message_text
  end

  def attach_to_message(attachment_details)
    attachments_section.attach_to_message(attachment_details)
  end

  def send_message
    send_button.click
  end

  def compose_and_send_a_valid_message(recipient_name='Palo Alto Foodies')
    message_text = compose_a_valid_message recipient_name
    send_message
    return message_text
  end
end
