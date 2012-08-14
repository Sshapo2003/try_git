class Model::Section::PageManager::Uitk5ArchivedPagesPanel < Model::Section::PageManager::Uitk5PagesPanel
  element :header, 'h1'
  sections :pages,  Model::Section::PageManager::Uitk5ArchivedPage, 'tbody tr'
end
