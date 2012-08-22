class Model::Section::PageManager::ArchivedPage < Model::Section::PageManager::Page
  elements :cells, 'td'

  def name
    cells[0]
  end
end
