class Model::Section::Messenger::WildfireappMessengerComposeMessagePanel < SitePrism::Section
  element :message_textbox, 'textarea#message_body'
  element :send_button, "button.wf_submit[name='commit']"
  element :send_draft_message_link, 'div.wf_menu_button_wpr a.submit'
  element :save_draft_button, "button.wf_submit[name='commit_draft']"
  element :recepients_error, 'div#recipients p.inline_error'
  element :date_error, 'li#when_to_send p.inline_error'
  element :message_error, 'div#message_container p.inline_error'
  element :header, 'h2'
  element :recepient_input, 'li.search-field'
  element :later_button, 'span.later a'
  element :date_field, 'input#message_send_at_date'
  element :hours_select_value, 'div.hour a.select_button span'
  element :minutes_select_value, 'div.minute a.select_button span'
  element :link_shortner_field, 'div#shortener_container input'
  element :link_shortner_link, 'div#shortener_container a'
  element :invalid_token_for_property_message_div, 'div#invalid_property_warning'
  root_element :reconnect_property_link, 'a.am_link'
  elements :recepients, 'ul.chzn-results li'
  elements :remove_recipient_links, 'a.search-choice-close'

  section :attachments_section, Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSection, 'ol.attach'
  sections :recipients, Model::Section::Messenger::WildfireappMessengerRecipient, 'div.recipient'

  def select_recipient_by_name(recipient_name=Helpers::Config['facebook_property_name'])
    recepient_input.click
    recepients.select {|r| r.text == recipient_name }.first.click
  end

  def remove_all_recipients
    remove_recipient_links.each {|l| l.click }
  end

  def compose_and_send_a_valid_message(recipient_name=Helpers::Config['facebook_property_name'])
    message_text = compose_a_valid_message recipient_name
    send_message
    return message_text
  end

  def compose_a_valid_message(recipient_name=Helpers::Config['facebook_property_name'])
    t = Time.now
    message_text = "Today is #{t.strftime("%A")} #{t.strftime("%d")} #{t.strftime("%b")} #{t.strftime("%Y")} and the time is #{t.strftime("%r")}. What great foods have you discovered recently?"
    select_recipient_by_name recipient_name

    if invalid_token_for_property_message_displayed?
      reconnect_property recipient_name
      select_recipient_by_name recipient_name
    end

    message_textbox.set message_text
    message_text
  end

  def attach_to_message(attachment_details)
    attachments_section.attach_to_message(attachment_details)
  end

  def schedule_message(scheduled_time)
    later_button.click
    date_field.set scheduled_time
  end

  def send_message
    send_button.click
  end

  def send_draft_message
    send_draft_message_link.click
  end

  def save_as_draft
    save_draft_button.click
  end

  def invalid_token_for_property_message_displayed?
    invalid_token_for_property_message_div[:style].include? 'display: block;'
  end

  def reconnect_property property_name
    Helpers::MessengerHelper.reconnect_property property_name
  end
end
