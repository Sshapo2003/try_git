class Model::Page::WildfireappTemplates < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_templates_root']}/"
  set_url_matcher /#{Regexp.escape(Helpers::Config['wildfire_templates_root'])}/

  section :filter, Model::Section::WildfireappTemplatesFilterDiv, 'div.filters > ul.first'

  sections :templates, Model::Section::WildfireappTemplatesTemplate, 'ul.page_templates li'
  sections :filter_options, Model::Section::WildfireappTemplatesFilterOption, 'div.filters > ul li:not(.heading)'

  element :results_count, 'div.results'
  element :search_field, 'input#search'
  element :search_button, 'a.search'
  element :filter_bar_div, 'div.filter-bar'
  element :filter_count_text, 'span.filters-count-text'

  elements :template_titles, 'ul.page_templates li h2'

  def scroll_to_bottom_of_page
    page.execute_script "window.scrollBy(0,10000)"
    sleep 0.1 #required to allow rendering of additional templates
  end

  def template_results_count
    result = results_count.text.scan(/(\d*) Results/).last.first.to_i
  end

  def search_for(search_term) 
    search_field.set search_term
    search_button.click
  end

  def all_template_titles
    page.evaluate_script "$('ul.page_templates li h2').text()"
  end

  def set_filter(filter_name)
    expand_filter
    elements = filter_options.select {|o| o.label.text.include? filter_name}
    element = elements.first
    unless element.input.checked? then element.input.click end
  end

  # This select_by_name method is needed because the WildfireappTemplatesTemplate elements always return blank
  # therefore cannot be used to identify a section based on its contents
  def select_by_name(template_name)
    index = 0
    while index < templates.count
      queried_template_name = page.evaluate_script "$('ul.page_templates li h2').get(#{index}).textContent"
      break if queried_template_name == template_name
      index += 1
      raise "Couldn't find template #{template_name} in #{all_template_titles}" unless index < templates.count
    end
    templates[index]
  end

  private

  def filter_expanded?
    filter_bar_div['class'].include? 'expanded'
  end

  def expand_filter
    unless filter_expanded? then filter_count_text.click end
  end
end
