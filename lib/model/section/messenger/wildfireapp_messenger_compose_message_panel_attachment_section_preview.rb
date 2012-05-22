class Model::Section::Messenger::WildfireappMessengerComposeMessagePanelAttachmentSectionPreview < SitePrism::Section
  element :image, 'img'
  element :title, 'div.title'
  element :body, 'div.description'
  element :previous_button, 'a[href="#previous"]'
  element :next_button, 'a[href="#next"]'
  element :close_button, 'a.cancel'

  def image_url
    image[:src]
  end
end
