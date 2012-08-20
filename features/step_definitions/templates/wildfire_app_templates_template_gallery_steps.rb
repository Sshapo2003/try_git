Then /^the Template Gallery page should be displayed$/ do
  @wildfire.wildfireapp_templates.wait_for_ajax
  @wildfire.wildfireapp_templates.should be_displayed
end

Given /^(\d+) templates are displayed$/ do |number_of_templates|
  @templates_visible = @wildfire.wildfireapp_templates.templates.count
  @templates_visible.should eql number_of_templates.to_i
end

When /^I scroll to the bottom of the page$/ do
  @templete_count_before_scrolling = @wildfire.wildfireapp_templates.templates.count
  @wildfire.wildfireapp_templates.scroll_to_bottom_of_page
end

When /^I wait a little while for more templates to be loaded$/ do
  Timeout.timeout(30) { sleep 0.1 while @templete_count_before_scrolling == @wildfire.wildfireapp_templates.templates.count }
end

Then /^(\d+) templates should be displayed$/ do |number_of_templates|
  @templates_visible = @wildfire.wildfireapp_templates.templates.count
  @templates_visible.should eql number_of_templates.to_i
end

When /^I keep scrolling to the bottom of the page until no more templates load$/ do
  max_retries = 100
  retries = 0
  while @wildfire.wildfireapp_templates.templates.count < @wildfire.wildfireapp_templates.template_results_count
    @wildfire.wildfireapp_templates.scroll_to_bottom_of_page
    retries = retries + 1
    if retries > max_retries then raise "Tried to keep scrolling until all templates were visible but exceeded max retries." end
  end
end

Then /^all available templates are visible$/ do
  @wildfire.wildfireapp_templates.templates.count.should eql @wildfire.wildfireapp_templates.template_results_count
end

When /^I search for "(.*)" in the template search$/ do |search_term|
  @wildfire.wildfireapp_templates.search_for search_term
end

Then /^the "(.*)" template should be displayed in the tile gallery$/ do |template_name|
  @wildfire.wildfireapp_templates.all_template_titles.should include template_name
end

When /^I filter by "(.*)" in the template search$/ do |filter_name|
  @wildfire.wildfireapp_templates.set_filter filter_name
  @wildfire.wildfireapp_templates.search_button.click
end

When /^I click the Start Now button on any template$/ do
  @wildfire.wildfireapp_templates.templates.first.start_button.click
end

When /^I create a page from the "(.*)" template$/ do |template_name|
  @template_name = template_name

  until @wildfire.wildfireapp_templates.all_template_titles.include? template_name
    @wildfire.wildfireapp_templates.scroll_to_bottom_of_page
    unless @wildfire.wildfireapp_templates.templates.count < @wildfire.wildfireapp_templates.template_results_count then
      template_names = @wildfire.wildfireapp_templates.templates.collect {|t| t.title_div.text}.join(", ")
      raise "Could not find #{template_name} in the template gallery. Templates => #{template_names}"
    end
  end
  @wildfire.wildfireapp_templates.select_by_name(template_name).start_button.click
  step "the Page Manager page should be displayed"
end
