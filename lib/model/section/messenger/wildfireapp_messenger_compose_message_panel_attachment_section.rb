class Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSection < SitePrism::Section
  element :attach_link_link, 'div.attachment_navigation a.link'
  element :attach_link_dialog, 'div#attach_link input#attached_link'
  element :attach_link_button, 'div#attach_link a.attach_button'
  element :link_attachment_title, 'div#attach_link div.title'
  element :attachment_preview_div, 'div#attach_link div.preview'
  section :attachment_preview, Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSectionPreview, "div#attach_link.attachment_details"

  def attach_to_message(attachment)
    case attachment[:type]
    when :link
      attach_link_link.click
      attach_link_dialog.set attachment[:url]
      attach_link_button.click
      Timeout.timeout(10) { sleep 0.1 while attachment_preview.image_url == nil }
    else raise "Unknown attachment type #{attachment_type}"
    end
  end
end
