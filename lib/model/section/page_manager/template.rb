class Model::Section::PageManager::Template < SitePrism::Section
  element :title_div, 'div.title'
  element :edit_link, 'div.edit a span'
  element :create_page_link, 'div.edit a span'
  element :drop_down_menu, 'a.wf_menu_button'
  root_element :delete_menu_option, 'body > ol .delete_link'
  root_elements :template_menu_options, 'body > ol li a'

  def delete_template
    sleep 1
    drop_down_menu.click
    sleep 1
    delete_menu_option.click
    page.driver.browser.switch_to.alert.accept
    wait_for_ajax
  end
end
