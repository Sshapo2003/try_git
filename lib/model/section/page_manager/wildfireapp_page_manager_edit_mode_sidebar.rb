class Model::Section::PageManager::WildfireappPageManagerEditModeSidebar < SitePrism::Section
  section :content_menu, Model::Section::PageManager::WildfireappPageManagerEditModeSidebarContentMenu, 'li.content'
  section :publish_menu, Model::Section::PageManager::WildfireappPageManagerEditModeSidebarPublishMenu, 'li.publish'
end
