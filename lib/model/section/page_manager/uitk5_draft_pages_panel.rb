class Model::Section::PageManager::Uitk5DraftPagesPanel < Model::Section::PageManager::Uitk5PagesPanel
  element :header, 'h1'
  sections :pages,  Model::Section::PageManager::Uitk5Page, 'tbody tr'
end
