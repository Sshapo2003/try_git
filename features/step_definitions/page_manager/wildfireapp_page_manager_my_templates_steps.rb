When /^I have (a valid|at least one) template$/ do |unused|
  @wildfire.wildfireapp_page_manager.content_div.templates.count.should > 0
  @template = @wildfire.wildfireapp_page_manager.content_div.templates.first
end

When /^I create a page with the template$/ do
  @template_name = @template.title_div.text
  @template.create_page_link.click
end

Given /^I edit the templates design with some liquid content$/ do
  @template_content = Helpers::PageManagerHelper.update_template_with_valid_liquid_content @template
end

When /^I edit the templates default content$/ do
  @template_title = "TestTemplate#{String.random}"
  @template_content = Helpers::PageManagerHelper.update_template_title(@template, @template_title)
end

Then /^the Page Editor should be displayed with the templates details$/ do
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.title_text_box[:value].should == @template_name
end

Then /^the Page Editor should be displayed with the updated template design$/ do
  @wildfire.wildfireapp_page_manager_edit_mode.page_preview_content.should include @template_content
end

Then /^the Page Editor should be displayed with the updated template content$/ do
  @wildfire.wildfireapp_page_manager_edit_mode.sidebar.content_menu.title_text_box[:value].should include @template_title
end

Then /^the templates menu options should be$/ do |table|
  expected_options = table.raw.flatten
  actual_options = Helpers::PageManagerHelper.get_template_menu_options
  expected_options.should eql actual_options
end

Given /^I have created a valid template$/ do
  step 'I create a Blank Template'
  step 'the template should be listed in My Templates'
end

When /^I create a Blank Template$/ do
  @num_templates_before = @wildfire.wildfireapp_page_manager.content_div.templates.count
  @template_name = Helpers::PageManagerHelper.create_template
end

When /^I clone a template$/ do
  @num_templates_before = @wildfire.wildfireapp_page_manager.content_div.templates.count
  Helpers::PageManagerHelper.clone_template
end

When /^I delete the template$/ do
  Helpers::PageManagerHelper.delete_template @template_name
  @wildfire.wildfireapp_page_manager.sticky_label.text.should include 'You have successfully deleted the template.'
end

Then /^the template should be listed in My Templates$/ do
  div = @wildfire.wildfireapp_page_manager.content_div
  div.templates.count.should == (@num_templates_before += 1)
  div.get_template_by_title(@template_name).title_div.text.should include @template_name
end

Then /^an additional template should be listed in My Templates$/ do
  div = @wildfire.wildfireapp_page_manager.content_div
  div.templates.count.should == (@num_templates_before += 1)
end

When /^I publish the template$/ do
  Helpers::PageManagerHelper.publish_completed_page
end

Then /^the template should be removed My Templates$/ do
  @wildfire.wildfireapp_page_manager.content_div.templates.select {|t| t.title_div.text == @template_name}.count.should == 0
end
