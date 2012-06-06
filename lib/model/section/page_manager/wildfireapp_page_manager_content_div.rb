class Model::Section::PageManager::WildfireappPageManagerContentDiv < SitePrism::Section
  element :templetes_drop_down_menu, 'h2 div.wf_menu_button_wpr a.wf_menu_button'
  root_elements :template_menu_options, 'body > ol li'
  sections :templates, Model::Section::PageManager::Template, 'li.screenshot'

  def get_template_by_title(title)
    found_templates = templates.select {|page| page.title_div.text == title}
    template_names = templates.collect {|p| p.title_div.text}
    unless found_templates.count > 0 then raise "Couldnt find page #{title}. Pages = #{template_names}" end
    return found_templates.first
  end

  def click_templates_menu_create_blank_template_option
    page.execute_script '$(\'body > ol.wf_menu a[title="New Template"]\').click()'
  end
end
