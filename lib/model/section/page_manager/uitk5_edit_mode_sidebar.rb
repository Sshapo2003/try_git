class Model::Section::PageManager::Uitk5EditModeSidebar < SitePrism::Section

  element :inactive_publish_menu_div, '.accordion-group.publish:not(.active)'
  element :active_publish_menu_div,   '.accordion-group.publish.active'

  section :content_menu, Model::Section::PageManager::Uitk5EditModeSidebarContentMenu, '.accordion-group.content'
  section :publish_menu, Model::Section::PageManager::Uitk5EditModeSidebarPublishMenu, '.accordion-group.publish'
end
