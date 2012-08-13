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
end
