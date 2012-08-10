class Model::Page::PageManager::Uitk5PageManager < Model::Page::PageManager::PageManager
  set_url "#{Helpers::Config['wildfire_page_manager_root']}/"
  set_url_matcher /pages\/states\/published/

  element :unlock_button, '#unlock'
  elements :sidebar_links, '.span3 .nav-list li a'

  section :content_div, Model::Section::PageManager::WildfireappPageManagerContentDiv, '.screenshots'

  section :published_pages_panel, Model::Section::PageManager::PublishedTemplatesPanel, '.span9'
  section :draft_pages_panel, Model::Section::PageManager::DraftTemplatesPanel, '.span9'
  section :archived_pages_panel, Model::Section::PageManager::ArchivedTemplatesPanel, '.span9'
  section :upload_a_template_panel, Model::Section::PageManager::PagesPanel, '.span9'
  
  def active?
    has_sidebar_links?
  end
  
  def locked?
    has_unlock_button?
  end
end
