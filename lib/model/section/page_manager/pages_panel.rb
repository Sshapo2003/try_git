class Model::Section::PageManager::PagesPanel < SitePrism::Section
  element :header, 'h1'
  element :create_page_button, '.btn-primary'

  def create_page
    create_page_button.click
  end

  def get_page_by_title page_name
    pages.select {|p| p.name.text == page_name}.first
  end
end
