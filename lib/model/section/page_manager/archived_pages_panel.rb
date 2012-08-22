class Model::Section::PageManager::ArchivedPagesPanel < Model::Section::PageManager::PagesPanel
  element :header, 'h1'
  sections :pages,  Model::Section::PageManager::ArchivedPage, 'tbody tr'
end
