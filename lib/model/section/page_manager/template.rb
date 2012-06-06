class Model::Section::PageManager::Template < SitePrism::Section
  element :title_div, 'div.title'
  element :edit_link, 'div.edit a span'
  element :create_page_link, 'div.edit a span'
  element :drop_down_menu, 'a.wf_menu_button'
  root_elements :template_menu_options, 'body > ol li a'
end
