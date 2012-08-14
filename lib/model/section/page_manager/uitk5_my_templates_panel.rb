class Model::Section::PageManager::Uitk5MyTemplatesPanel < SitePrism::Section
  element :templetes_drop_down_menu, '.btn-primary.dropdown-toggle'
  element :create_blank_template_option, 'a[href="/page_templates/blank"]'
  element :more_templates_link, 'a.more_templates'
  element :upload_new_template_link, "a[href='/page_templates/new']"
  root_elements :template_menu_options, 'body > ol li'
  sections :templates, Model::Section::PageManager::Uitk5Template, '.thumbnail'

  def get_template_by_title(title)
    templates = get_templates_by_title(title)
    while templates.count == 0 && has_more_templates_link?
      get_more_templates
      templates = get_templates_by_title(title)
    end
        
    unless templates.count > 0 then raise "Couldnt find page #{title}. Pages = #{templates}" end
    templates.first 
  end

  def show_all_templates
    while has_more_templates_link?
      get_more_templates
    end
  end

  private

  def get_templates_by_title(title)
    found_templates = templates.select {|page| page.title_div.text == title}
    template_names = templates.collect {|p| p.title_div.text}
    found_templates
  end

  def get_more_templates
    num_templates_before = templates.count
    more_templates_link.click
    msg = 'Timeout occured while waiting for more templates to be displayed.'
    Timeout.timeout_and_raise(30, msg) { sleep 0.1 while num_templates_before == templates.count }
  end
end
