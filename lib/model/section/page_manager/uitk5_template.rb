class Model::Section::PageManager::Uitk5Template < SitePrism::Section
  element :title_div, '.title'
  element :edit_link, 'div.edit a span'
  element :create_page_link, 'div.edit a span'
  element :drop_down_menu, '.dropdown-toggle'
  elements :drop_down_menu_options, '.dropdown-menu li a'

  root_element :archive_menu_option, 'body > ol[data-visible="true"] .archive_link'

  def edit_template_design_menu_option
    drop_down_menu_options[0]
  end

  def edit_default_content_menu_option
    drop_down_menu_options[1]
  end
  
  def download_template_menu_option
    drop_down_menu_options[2]
  end
  
  def upload_new_version_menu_option
    drop_down_menu_options[3]
  end
  
  def clone_template_menu_option
    drop_down_menu_options[4]
  end
  
  def delete_template_menu_option
    drop_down_menu_options[5]
  end

  def name
    title_div.text
  end

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

  def delete_menu_option
    drop_down_menu_options.select {|o| o[:delete] == 'delete'}.first.click
  end
end
