class Model::Section::PageManager::WildfireappPageManagerEditModeSidebarPublishMenu < SitePrism::Section
  element :link, 'a'
  element :publish_to_facebook_link, 'a#install_to_facebook_tab'

  def open
    link.click
  end
end
