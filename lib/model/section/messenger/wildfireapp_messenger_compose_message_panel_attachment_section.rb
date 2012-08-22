class Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSection < SitePrism::Section
  elements :attach_links, '.attachment_navigation a'
  element :attach_link_dialog, '#attached_link'
  element :attach_link_button, '#attach_link .attach_button'
  element :attachment_preview_div, '#attach_link .preview'
  element :attach_link_link, 'div.attachment_navigation a.link'
  element :link_attachment_title, 'div#attach_link div.title'
  section :attachment_preview, Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSectionPreview, "div#attach_link.attachment_details"

  def attach_link_link
    attach_links[0]
  end

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
