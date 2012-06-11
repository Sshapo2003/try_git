class Model::Page::PageManager::WildfireappPageManagerEditMode < SitePrism::Page
  set_url_matcher /pages\/.*\/edit/

  element :header_sticky, 'span.flash_contents'

  section :sidebar, Model::Section::PageManager::WildfireappPageManagerEditModeSidebar, 'div.sidebar'
  section :publish_to_facebook_modal, Model::Section::PageManager::EditModePublishToFacebookModal, 'div.ui-dialog'

  def page_preview_content
    msg = "Timeout occurred waiting to page preview to have content."
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
