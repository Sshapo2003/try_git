When /^I create a page in Archived$/ do
  @wildfire.wildfireapp_page_manager.draft_pages_panel.create_page
end

Then /^the template should be listed in Archived$/ do
  step 'I view "Archived" in the left hand nav bar of Page Manager'
  @wildfire.wildfireapp_page_manager.content_div.templates.first.title_div.text.should eql @template_name
end

When /^I delete the archived template$/ do
  @num_templates_before = @wildfire.wildfireapp_page_manager.content_div.templates.count
  template = @wildfire.wildfireapp_page_manager.archived_pages_panel.get_template_by_title @template_name
  template.delete_template
  msg = "Time out occurred waiting for template #{@template_name} to disappear."
  Timeout.timeout_and_raise(10, msg) {sleep 0.1 while @wildfire.wildfireapp_page_manager.content_div.templates.count == @num_templates_before }
end

Then /^there should be one less template in Archived$/ do
  @wildfire.wildfireapp_page_manager.content_div.templates.count == @num_templates_before
end
