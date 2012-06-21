class Model::Section::PageManager::DraftTemplatesPanel < SitePrism::Section
  element :header, 'h2'
  elements :create_page_buttons, 'h2 > a'

  def create_page
    # There are 2 create page buttons in the DOM - only 1 is visible.
    create_page_buttons.select {|b| b.visible? }.first.click
  end
end
