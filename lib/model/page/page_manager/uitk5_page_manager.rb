class Model::Page::PageManager::Uitk5PageManager < Model::Page::PageManager::PageManager
  set_url "#{Helpers::Config['wildfire_page_manager_root']}/"
  set_url_matcher /pages\/states\/published/

  element :sticky_label, '.flashes'
  elements :sidebar_links, '#sidebar #panel-main a'

  section :my_templates_panel, Model::Section::PageManager::Uitk5MyTemplatesPanel,      '.outer .container'
  section :published_pages_panel, Model::Section::PageManager::Uitk5PublishedTemplatesPanel, '.outer .container'
  section :draft_pages_panel, Model::Section::PageManager::Uitk5DraftPagesPanel,        '.outer .container'
  section :archived_pages_panel, Model::Section::PageManager::Uitk5ArchivedPagesPanel,  '.outer .container'
  section :upload_a_template_panel, Model::Section::PageManager::PagesPanel,            '.outer .container'
  section :new_template_dialog, Model::Section::PageManager::Uitk5NewTemplateDialog,    '#new_page_template'

  def active?
    has_sidebar_links?
  end

  def templates
    my_templates_panel.templates
  end

  def wait_for_templates(num_seconds=30)
    content_div.wait_for_templates num_seconds
  end
end
