class Model::Section::PageManager::Template < SitePrism::Section
  element :title_div, '.title'
  element :edit_link, 'div.edit a span'
  element :create_page_link, 'div.edit a span'
  element :drop_down_menu, 'dropdown-toggle'
  root_element :delete_menu_option, 'body > ol[data-visible="true"] .delete_link'
  root_element :archive_menu_option, 'body > ol[data-visible="true"] .archive_link'
  root_elements :template_menu_options, 'body > ol[data-visible="true"] li a'

  def delete_template
    drop_down_menu.click
    sleep 1
    delete_menu_option.click
    page.driver.browser.switch_to.alert.accept
    wait_for_ajax
  end

  def archive_template
    drop_down_menu.click
    sleep 1
    page.execute_script %{$('body > ol[data-visible="true"] .archive_link').click()}
  end
end
