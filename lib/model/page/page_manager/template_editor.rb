class Model::Page::PageManager::TemplateEditor < SitePrism::Page
  element :go_back_button, 'a.go_back'
  element :template_name, 'input#page_template_title'
  element :content_save_and_continue_button, 'div.submit_wpr button'
  elements :tabs, 'ol.page_templates > li > a'

  def click_tab tab_name
    tabs.select { |t| t.text.include? tab_name }.first.click
  end
end
