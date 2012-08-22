class Model::Section::PageManager::PublishedTemplatesPanel < Model::Section::PageManager::PagesPanel
  element :header, 'h1'
  element :create_page_button, '.btn-primary'
  sections :pages,  Model::Section::PageManager::Page, 'tbody tr'

  def create_page
    create_page_button.click
  end
end
