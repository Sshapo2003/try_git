class Model::Page::PageManager::TemplateBuilder < SitePrism::Page
  element :back_to_templates_button, 'div.go_back a'
  element :close_button, 'li.close_wpr a'
  element :title_text, 'div.top_content'
  elements :tabs, 'div#tabs > ul a'

  def click_tab tab_name
    tabs.select { |t| t.text.include? tab_name }.first.click
  end
end
