class Model::Section::PageManager::WildfireappPageManagerContentDiv < SitePrism::Section
  element :templetes_drop_down_menu, 'h2 div.wf_menu_button_wpr a.wf_menu_button'
  sections :pages, Model::Section::PageManager::WildfireappPageManagerContentDivPages, 'li.screenshot'

  def get_page_by_title(title)
    found_pages = pages.select {|page| page.title_div.text == title}
    unless found_pages.count > 0 then raise "Couldnt find page #{title}" end
    return found_pages.first
  end

  def click_templates_menu_create_blank_template_option
    page.execute_script '$(\'body > ol.wf_menu a[title="New Template"]\').click()'
  end
end
