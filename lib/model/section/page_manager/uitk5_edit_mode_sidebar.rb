class Model::Section::PageManager::Uitk5EditModeSidebar < SitePrism::Section
  section :content_menu, Model::Section::PageManager::Uitk5EditModeSidebarContentMenu, '.accordion-group.content'
  section :publish_menu, Model::Section::PageManager::Uitk5EditModeSidebarPublishMenu, '.accordion-group.publish'
end
