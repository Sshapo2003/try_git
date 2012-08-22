class Model::Section::PageManager::DraftTemplatesPanel < SitePrism::Section
  element :header, 'h2'
  elements :create_page_buttons, 'h2 > a'
  root_elements :create_page_buttons, '.btn-primary'

  def create_page
    # There are 2 create page buttons in the DOM. It's not possible to select only one of them with CSS. We need the first one.
    create_page_buttons.select {|b| b.visible? }.first.click
  end
end
