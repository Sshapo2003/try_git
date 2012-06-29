class Model::Section::PageManager::ArchivedTemplatesPanel < SitePrism::Section
  element :header, 'h2'
  elements :create_page_buttons, 'h2 > a'
  sections :templates, Model::Section::PageManager::ArchivedTemplate, 'li.screenshot'

  def create_page
    # There are 2 create page buttons in the DOM. It's not possible to select only one of them with CSS. We need the first one.
    create_page_buttons.first.click
  end

  def get_template_by_title(title)
    templates = get_templates_by_title(title)
    while templates.count == 0 && has_more_templates_link?
      get_more_templates
      templates = get_templates_by_title(title)
    end
        
    unless templates.count > 0 then raise "Couldnt find page #{title}. Pages = #{templates}" end
    templates.first 
  end

  def get_templates_by_title(title)
    found_templates = templates.select {|page| page.title_div.text == title}
    template_names = templates.collect {|p| p.title_div.text}
    found_templates
  end
end
