class Model::Section::PageManager::Uitk5PublishedTemplatesPanel < SitePrism::Section
  element :header, 'h2'
  element :create_page_button, '.btn-primary'

  def create_page
    create_page_button.click
  end
end
