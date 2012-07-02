When /^I create a page in Drafts$/ do
  @wildfire.page_manager.wait_for_archived_pages_panel(180)
  @wildfire.page_manager.archived_pages_panel.create_page
end

When /^I view the menu for a Draft Template$/ do
  @wildfire.page_manager.content_div.wait_for_templates(180)
  @wildfire.page_manager.content_div.templates.first.drop_down_menu.click
end

Then /^the following menu options should be available for the draft template$/ do |table|
  # table is a Cucumber::Ast::Table
  expected = table.raw.flatten
  actual = @wildfire.page_manager.content_div.template_menu_options.map {|o| o.text}
  actual.should eql expected
end

When /^I archive a Template$/ do
  @wildfire.page_manager.content_div.wait_for_templates(180)
  @template_name = @wildfire.page_manager.content_div.templates.first.title_div.text
  @num_templates_before = @wildfire.page_manager.content_div.templates.count
  @wildfire.page_manager.content_div.templates.first.archive_template
  msg = "Time out occurred waiting for template #{@template_name} to disappear."
  Timeout.timeout_and_raise(10, msg) {sleep 0.1 while @wildfire.page_manager.content_div.templates.count == @num_templates_before }
end

Then /^there should be one less template in Drafts$/ do
  @wildfire.page_manager.content_div.wait_for_templates(180)
  @wildfire.page_manager.content_div.templates.count.should eql (@num_templates_before - 1)
end

Then /^the template should be listed in Drafts$/ do
  step 'I view "Drafts" in the left hand nav bar of Page Manager'
  @wildfire.page_manager.content_div.wait_for_templates(180)
  @wildfire.page_manager.content_div.templates.first.title_div.text.should eql @template_name
end
