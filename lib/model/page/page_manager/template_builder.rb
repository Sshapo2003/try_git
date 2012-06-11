class Model::Page::PageManager::TemplateBuilder < SitePrism::Page
  element :back_to_templates_button, 'div.go_back a'
  element :close_button, 'li.close_wpr a'
  element :title_text, 'div.top_content'
  element :edit_default_liquid_link, "a[title='Edit default.liquid']"
  element :sticky_label, 'span.flash_contents'
  element :publish_template_changes_button, 'a.publish_template'
  element :publish_button, 'button[value="Publish"]'
  elements :tabs, 'div#tabs > ul a'

  root_element :edit_liquid_dialog_save_button, 'button[value="Save"]'

  def click_tab tab_name
    tabs.select { |t| t.text.include? tab_name }.first.click
  end
end
