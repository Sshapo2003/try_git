class Model::Section::PageManager::DraftPagesPanel < Model::Section::PageManager::PagesPanel
  element :header, 'h1'
  sections :pages,  Model::Section::PageManager::Page, 'tbody tr'
end
