class Model::Section::PageManager::ArchivedTemplate < SitePrism::Section
  element :title_div, 'div.title'
  element :edit_link, 'div.edit a span'
  element :create_page_link, 'div.edit a span'
  element :drop_down_menu, 'a.wf_menu_button'
  element :unarchive_template_button, '.unarchive_link'
  root_element :delete_menu_option, 'body > ol[data-visible="true"] .delete_link'

  def delete_template
    drop_down_menu.click
    page.execute_script %{$('body > ol[data-visible="true"] .delete_link').click()}
    page.driver.browser.switch_to.alert.accept
    wait_for_ajax
  end

  def unarchive_template
    unarchive_template_button.click
    wait_for_ajax
  end
end
