class Model::Section::PageManager::DraftTemplatesPanel < SitePrism::Section
  element :header, 'h2'
  root_elements :create_page_buttons, '.btn-primary'

  def create_page
    # There are 2 create page buttons in the DOM - only 1 is visible.
    create_page_buttons.select {|b| b.visible? }.first.click
  end
end
