When /^I create a page in Drafts$/ do
  @wildfire.page_manager.wait_for_archived_pages_panel(180)
  @wildfire.page_manager.archived_pages_panel.create_page
end

When /^I view the menu for a draft page$/ do
  @wildfire.page_manager.draft_pages_panel.wait_for_pages(180)
  @wildfire.page_manager.draft_pages_panel.pages.first.actions_drop_down.click
end

Then /^the following menu options should be available for the draft page$/ do |table|
  # table is a Cucumber::Ast::Table
  expected = table.raw.flatten
  actual = @wildfire.page_manager.draft_pages_panel.pages.first.actions_drop_down_options.map {|o| o.text}
  actual.should eql expected
end

When /^I archive a page$/ do
  @wildfire.page_manager.draft_pages_panel.wait_for_pages(180)
  @num_pages_before = @wildfire.page_manager.draft_pages_panel.pages.count
  page = @wildfire.page_manager.draft_pages_panel.pages.first
  @page_name = page.name.text
  page.archive_page
  msg = "Time out occurred waiting for page #{@page_name} to disappear."
  Timeout.timeout_and_raise(10, msg) {sleep 0.1 while @wildfire.page_manager.draft_pages_panel.pages.count == @num_pages_before }
end

Then /^there should be one less page in Drafts$/ do
  @wildfire.page_manager.draft_pages_panel.pages.count.should eql (@num_pages_before - 1)
end

Then /^the page should be listed in Drafts$/ do
  step 'I view "Drafts" in the left hand nav bar of Page Manager'
  @wildfire.page_manager.draft_pages_panel.wait_for_pages(180)
  @wildfire.page_manager.draft_pages_panel.pages.first.name.text.should eql @page_name
end
