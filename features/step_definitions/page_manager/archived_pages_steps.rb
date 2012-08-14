When /^I create a page in Archived$/ do
  @wildfire.page_manager.draft_pages_panel.create_page
end

Then /^the page should be listed in Archived$/ do
  step 'I view "Archived" in the left hand nav bar of Page Manager'
  @wildfire.page_manager.archived_pages_panel.pages.first.name.text.should eql @page_name
end

When /^I delete the archived page$/ do
  @num_pages_before = @wildfire.page_manager.archived_pages_panel.pages.count
  page = @wildfire.page_manager.archived_pages_panel.get_page_by_title @page_name
  page.delete_page
  msg = "Time out occurred waiting for page #{@page_name} to disappear."
  Timeout.timeout_and_raise(10, msg) {sleep 0.1 while @wildfire.page_manager.archived_pages_panel.pages.count == @num_pages_before }
end

Then /^there should be one less page in Archived$/ do
  @wildfire.page_manager.archived_pages_panel.pages.count == @num_pages_before
end

When /^I unarchive the archived page$/ do
  @num_pages_before = @wildfire.page_manager.archived_pages_panel.pages.count
  page = @wildfire.page_manager.archived_pages_panel.get_page_by_title @page_name
  page.unarchive_page
  msg = "Time out occurred waiting for page #{@page_name} to disappear."
  Timeout.timeout_and_raise(10, msg) {sleep 0.1 while @wildfire.page_manager.archived_pages_panel.pages.count == @num_pages_before }
end
