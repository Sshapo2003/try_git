class Model::Page::PageManager::WildfireappPageManagerEditMode < SitePrism::Page
  set_url_matcher /pages\/.*\/edit/

  element :header_sticky, 'span.flash_contents'

  section :sidebar, Model::Section::PageManager::WildfireappPageManagerEditModeSidebar, 'div.sidebar'
  section :publish_to_facebook_modal, Model::Section::PageManager::EditModePublishToFacebookModal, 'div.ui-dialog'
end
