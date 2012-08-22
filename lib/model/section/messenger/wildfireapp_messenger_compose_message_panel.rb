class Model::Section::Messenger::WildfireappMessengerComposeMessagePanel < SitePrism::Section

  element :message_textbox, 'textarea#outgoing_message_body'
  element :send_button, "input[name='commit']"
  element :send_draft_message_link, "input[name='commit']"
  element :save_draft_button, "input[name='commit_draft']"
  element :recepients_error, '#recipients .help-inline'
  element :date_error, '#when_to_send .help-inline'
  element :message_error, '#message_container .help-inline'
  element :later_button, '#outgoing_message_when_1'
  element :date_field, '#outgoing_message_send_at_date'
  element :hours_select_value, '#outgoing_message_send_at_hour'
  element :minutes_select_value, '#outgoing_message_send_at_minute'
  element :link_shortner_field, '#url'
  element :link_shortner_link, '#shorten_link'
  elements :recepients, 'ul.chzn-results li'
  elements :remove_recipient_links, '.search-choice-close'
  element :recepient_input, 'li.search-field'
  element :invalid_token_for_property_message_div, 'div#invalid_property_warning'
  root_element :reconnect_property_link, 'a.am_link'
  root_element :header_message, '.page-header'

  section :attachments_section, Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSection, '#attachment'
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
