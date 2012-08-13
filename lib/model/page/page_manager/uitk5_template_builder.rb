class Model::Page::PageManager::Uitk5TemplateBuilder < SitePrism::Page
  element :back_to_templates_button, '.page-header a[href="/page_templates"]'
  element :edit_liquid_dialog_save_button, '.btn-primary'
  element :close_button, 'li.close_wpr a'
  element :title_text, 'div.top_content'
  element :edit_default_liquid_link, "a[title='Edit default.liquid']"
  element :sticky_label, '.flashes'
  element :publish_template_changes_button, '.publish_template'
  element :publish_changes_model_publish_template_changes_button, '.modal-form .btn-primary'
  element :publish_button, 'button[value="Publish"]'
  elements :tabs, 'div#tabs > ul a'


  def click_tab tab_name
    tabs.select { |t| t.text.include? tab_name }.first.click
  end

  def update_default_liquid liquid_content
    edit_default_liquid_link.click
    Timeout.timeout(30) { sleep 0.1 while not page.evaluate_script("editor.isFocused()") }
    page.execute_script("editor.removeLines()")
    page.execute_script(%{$(".ace_line_group .ace_line")[0].click()})
    page.execute_script("editor.insert('#{liquid_content}')")
    sleep 1
    edit_liquid_dialog_save_button.click
  end
end
