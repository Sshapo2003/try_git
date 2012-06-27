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

Given /^I have created a valid template$/ do
  step 'I create a Blank Template'
  step 'the template should be listed in My Templates'
  @template = @wildfire.wildfireapp_page_manager.content_div.templates.select {|t| t.title_div.text.include? @template_name}.first
end

When /^I create a Blank Template$/ do
  @wildfire.wildfireapp_page_manager.content_div.wait_for_templates(30)
  @num_templates_before = @wildfire.wildfireapp_page_manager.content_div.templates.count
  @template_name = Helpers::PageManagerHelper.create_template
end

When /^I clone a template$/ do
  div = @wildfire.wildfireapp_page_manager.content_div
  div.show_all_templates
  @num_templates_before = div.templates.count
  Helpers::PageManagerHelper.clone_template
end

When /^I delete the template$/ do
  Helpers::PageManagerHelper.delete_template @template_name
  @wildfire.wildfireapp_page_manager.sticky_label.text.should include 'You have successfully deleted the template.'
end

Then /^the template should be listed in My Templates$/ do
  div = @wildfire.wildfireapp_page_manager.content_div
  div.get_template_by_title(@template_name).title_div.text.should include @template_name
end

Then /^an additional template should be listed in My Templates$/ do
  div = @wildfire.wildfireapp_page_manager.content_div
  div.show_all_templates
  div.templates.count.should == (@num_templates_before += 1)
end

When /^I publish the template$/ do
  Helpers::PageManagerHelper.publish_completed_page
end

Then /^the template should be removed My Templates$/ do
  @wildfire.wildfireapp_page_manager.content_div.templates.select {|t| t.title_div.text == @template_name}.count.should == 0
end

When /^I upload a new template$/ do
  @template_name = Helpers::PageManagerHelper.upload_new_template
end

Given /^I have a valid uploaded template$/ do
  @wildfire.wildfireapp_page_manager.content_div.wait_for_templates(30)
  @template = @wildfire.wildfireapp_page_manager.content_div.templates.select {|t| t.title_div.text.include? 'Uploaded Template'}.first
  @template_name = @template.title_div.text
end

When /^I upload a new version of the template$/ do
  Helpers::PageManagerHelper.upload_new_version_of_template @template_name
  @template_content = 'Follow me on Twitter! Updated'
end

Then /^the template should be available for selection in My Templates$/ do
  @wildfire.wildfireapp_page_manager.content_div.get_template_by_title(@template_name).title_div.text.should include @template_name
end

Then /^the template should have a valid download option$/ do
  download_link_regex = /.*\/page_templates\/(\d*)\/download/
  href = Helpers::PageManagerHelper.template_download_link @template.title_div.text
  download_link_regex.match(href).should be_true
end
