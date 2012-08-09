class Model::Section::Messenger::Uitk5WildfireappMessengerComposeMessagePanel < Model::Section::Messenger::WildfireappMessengerComposeMessagePanel
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
  root_element :header_message, '.page-header'

  section :attachments_section, Model::Section::Messenger::Uitk5WildfireappMessengerComposeMessagePanelAttachmentSection, '#attachment'

end
