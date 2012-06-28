class Model::Page::PageManager::PageManager < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_page_manager_root']}/"
  set_url_matcher /pages\/states\/published/

  element :sticky_label, 'span.flash_contents'
  elements :sidebar_links, 'div.sidebar_nav li a'
  
  section :content_div, Model::Section::PageManager::WildfireappPageManagerContentDiv, 'div.body_content'
  section :new_template_dialog, Model::Section::PageManager::NewTemplateDialog, 'body > div.ui-dialog'
  section :published_pages_panel, Model::Section::PageManager::PublishedTemplatesPanel, '.body_content_wpr .inner_liner'
  section :draft_pages_panel, Model::Section::PageManager::DraftTemplatesPanel, '.body_content_wpr .inner_liner'
  section :archived_pages_panel, Model::Section::PageManager::ArchivedTemplatesPanel, '.body_content_wpr .inner_liner'
  section :upload_a_template_panel, Model::Section::PageManager::PagesPanel, '.body_content_wpr .inner_liner'
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
