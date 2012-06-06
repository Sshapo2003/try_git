When /^I have at least one template$/ do
  @wildfire.wildfireapp_page_manager.content_div.templates.count.should > 0
end

Then /^the templates menu options should be$/ do |table|
  expected_options = table.raw.flatten
  actual_options = Helpers::PageManagerHelper.get_template_menu_options
  expected_options.should eql actual_options
end

When /^I create a Blank Template$/ do
  @num_templates_before = @wildfire.wildfireapp_page_manager.content_div.templates.count
  @template_name = Helpers::PageManagerHelper.create_template
end

When /^I clone a template$/ do
  @num_templates_before_clone = @wildfire.wildfireapp_page_manager.content_div.templates.count
  Helpers::PageManagerHelper.clone_template
end

Then /^the template should be listed in My Templates$/ do
  div = @wildfire.wildfireapp_page_manager.content_div
  div.templates.count.should == (@num_templates_before += 1)
  div.get_template_by_title(@template_name).title_div.text.should include @template_name
end