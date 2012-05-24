class Model::Section::PageManager::WildfireappPageManagerEditModeSidebarPublishMenu < SitePrism::Section
  element :link, 'a'
  element :publish_to_facebook_link, 'a[title="Publish to Facebook"]'
  element :unpublish_all_link, 'a.unpublish_all'
end
