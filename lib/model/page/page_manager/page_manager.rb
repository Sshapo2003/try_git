class Model::Page::PageManager::PageManager < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_page_manager_root']}/"
  set_url_matcher /pages\/states\/published/

  element :unlock_button,  '#unlock'
  element :sticky_label,   '.flashes'
  elements :sidebar_links, '#sidebar #panel-main a'

  section :content_div, Model::Section::PageManager::WildfireappPageManagerContentDiv,       'div.body_content'
  section :my_templates_panel, Model::Section::PageManager::MyTemplatesPanel,                '.outer .container'
  section :published_pages_panel, Model::Section::PageManager::PublishedTemplatesPanel,      '.outer .container'
  section :draft_pages_panel, Model::Section::PageManager::DraftPagesPanel,                  '.outer .container'
  section :archived_pages_panel, Model::Section::PageManager::ArchivedPagesPanel,            '.outer .container'
  section :upload_a_template_panel, Model::Section::PageManager::PagesPanel,                 '.outer .container'
  section :new_template_dialog, Model::Section::PageManager::NewTemplateDialog,              '#new_page_template'

  def active?
    has_sidebar_links?
  end

  def locked?
    has_unlock_button?
  end

  def templates
    my_templates_panel.templates
  end

  def wait_for_templates(num_seconds=30)
    content_div.wait_for_templates num_seconds
  end
end
