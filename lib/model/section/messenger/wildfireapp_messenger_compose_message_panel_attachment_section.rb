class Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSection < SitePrism::Section
  element :attach_link_link, 'div.attachment_navigation a.link'
  element :attach_link_dialog, 'div#attach_link input#attached_link'
  element :attach_link_button, 'div#attach_link a.attach_button'
  element :attachment_title, 'div#attach_link div.title'

  def attach_to_message(attachment)
    case attachment[:type]
    when :link
      attach_link_link.click
      attach_link_dialog.set attachment[:url]
      attach_link_button.click
      Timeout.timeout(30) { sleep 0.1 until attachment_title.text.include? attachment[:link_title] }
    else raise "Unkniwn attachment type #{attachment_type}"
    end
  end
end
