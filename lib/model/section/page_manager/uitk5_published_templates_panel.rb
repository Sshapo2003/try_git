class Model::Section::PageManager::Uitk5PublishedTemplatesPanel < Model::Section::PageManager::Uitk5PagesPanel
  element :header, 'h1'
  element :create_page_button, '.btn-primary'
  sections :pages,  Model::Section::PageManager::Uitk5Page, 'tbody tr'

  def create_page
    create_page_button.click
  end
end
