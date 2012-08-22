class Model::Section::PageManager::EditModeSidebar < SitePrism::Section

  element :inactive_publish_menu_div, '.accordion-group.publish:not(.active)'
  element :active_publish_menu_div,   '.accordion-group.publish.active'

  section :content_menu, Model::Section::PageManager::EditModeSidebarContentMenu, '.accordion-group.content'
  section :publish_menu, Model::Section::PageManager::EditModeSidebarPublishMenu, '.accordion-group.publish'
end
