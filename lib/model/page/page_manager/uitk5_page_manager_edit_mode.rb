class Model::Page::PageManager::Uitk5PageManagerEditMode < SitePrism::Page
  set_url_matcher /pages\/.*\/edit/

  element :header_sticky, '.flashes'

  section :sidebar, Model::Section::PageManager::Uitk5EditModeSidebar, '#accordion.pages'
  section :publish_to_facebook_modal, Model::Section::PageManager::Uitk5EditModePublishToFacebookModal, '#publishing'

  def page_preview_content
    msg = "Timeout occurred waiting for page preview to have content."
    Timeout.timeout_and_raise(30, msg) { sleep 0.1 while page_preview_body.chomp == "" }
    page_preview_body
  end

  private
  def within_facebook_page_modal(&block)
    within_frame(first("iframe[src*='/pages/']")[:id]) { yield }
  end

  def page_preview_body
    within_facebook_page_modal do
      find(:css, 'body').text
    end
  end
end
