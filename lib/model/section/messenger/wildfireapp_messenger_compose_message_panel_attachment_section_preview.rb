class Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSectionPreview < SitePrism::Section
  element :image, '.thumbnail img'
  element :title, 'div.title'
  element :body, 'div.description'
  element :previous_button, 'a[href="#previous"]'
  element :next_button, 'a[href="#next"]'
  element :close_button, 'a.cancel'

  def image_url
    Timeout.timeout(10) { sleep 0.1 while image[:src] == nil }
    image[:src]
  end
end
