class Model::Section::PageManager::Uitk5EditModeSidebarPublishMenu < SitePrism::Section
  element :publish_to_facebook, '.publish_fb_page'
  element :publish_to_microsite, '.publish_microsite_page'
  element :unpublish_all_link, 'input.unpublish_all'
end
