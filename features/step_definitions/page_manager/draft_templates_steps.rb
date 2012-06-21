When /^I create a page in Drafts$/ do
  @wildfire.wildfireapp_page_manager.archived_pages_panel.create_page
end

When /^I view the menu for a Draft Template$/ do
  @wildfire.wildfireapp_page_manager.content_div.templates.first.drop_down_menu.click
end

Then /^the following menu options should be available for the draft template$/ do |table|
  # table is a Cucumber::Ast::Table
  expected = table.raw.flatten
  actual = @wildfire.wildfireapp_page_manager.content_div.template_menu_options.map {|o| o.text}
  actual.should eql expected
end
