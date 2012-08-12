class Model::Section::PageManager::Uitk5ArchivedPage < Model::Section::PageManager::Uitk5Page
  elements :cells, 'td'

  def name
    cells[0]
  end
end
