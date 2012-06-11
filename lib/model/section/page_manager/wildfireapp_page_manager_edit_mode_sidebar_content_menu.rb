class Model::Section::PageManager::WildfireappPageManagerEditModeSidebarContentMenu < SitePrism::Section
  element :title_text_box, 'input#page_title'
  element :header_text_edit_link, 'li.edit_link a.header_text'
  element :save_button, 'button#page_submit'
end
