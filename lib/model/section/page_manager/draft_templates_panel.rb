class Model::Section::PageManager::DraftTemplatesPanel < SitePrism::Section
  element :header, 'h2'
  elements :create_page_buttons, 'h2 > a'

  def create_page
    # There are 2 create page buttons in the DOM. It's not possible to select only one of them with CSS. We need the first one.
    create_page_buttons.first.click
  end
end
