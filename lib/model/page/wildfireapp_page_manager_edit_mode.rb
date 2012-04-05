class Model::Page::WildfireappPageManagerEditMode < SitePrism::Page
  section :sidebar, Model::Section::PageManager::WildfireappPageManagerEditModeSidebar, 'div.sidebar'
  section :publish_to_facebook_modal, Model::Section::PageManager::WildfireappPageManagerEditModePublishToFacebookModal, 'div.ui-dialog'

  def is_loaded?
    page.current_url.include? '/edit?'
  end
end
