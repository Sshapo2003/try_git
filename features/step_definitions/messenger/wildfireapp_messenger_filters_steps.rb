Given /^I have a filter$/ do
  @filters = @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.name.text.include? "test filter" }
  unless @filters.count > 0
    @wildfire.wildfireapp_messenger.create_and_save_a_valid_filter
    @filters = @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.name.contain? "test filter" }
  end
  @unassigned_filter_name = @filters.first.name.text
end

When /^I delete the filter$/ do
  @wildfire.wildfireapp_messenger.delete_filter @unassigned_filter_name
end

Then /^the filter should removed from the list of filters$/ do
  @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.name.text.include? @unassigned_filter_name }.count.should eql 0
end

Given /^I have an unassigned filter$/ do
  @unassigned_filters = @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.assigned? == true }
  unless @unassigned_filters.count > 0
    @wildfire.wildfireapp_messenger.create_and_save_a_valid_filter
    @unassigned_filters = @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.assigned? == true }
  end
  @unassigned_filter_name = @unassigned_filters.first.name.text
end

Given /^I have a filter with 1 keyword$/ do 
  @filters = @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.name.text.include? "test filter" }
  unless @filters.count > 0
    @wildfire.wildfireapp_messenger.create_and_save_a_valid_filter
    @filters = @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.name.contain? "test filter" }
  end
  @filter_name = @filters.first.name.text
  @wildfire.wildfireapp_messenger.update_filters_keywords(@filter_name, 'thisisakeyword')
end

When /^I add another keyword to the filter$/ do
  @wildfire.wildfireapp_messenger.update_filters_keywords(@filter_name, 'thisisakeyword;soisthis')
end

Then /^the filter page should show that the filter has 2 keywords$/ do
  filter = @wildfire.wildfireapp_messenger.filters_panel.filter_by_name(@filter_name)
  filter.keyword_count.text.include? "2 keywords"
end

When /^I create and save a valid filter$/ do
  @filter_name = @wildfire.wildfireapp_messenger.create_and_save_a_valid_filter
end

When /^I create a filter$/ do
  @filter_name = @wildfire.wildfireapp_messenger.create_a_filter
end

Given /^the "(.*)" field is left blank during filter creation$/ do |field_name|
  case field_name
  when "Name"
    @wildfire.wildfireapp_messenger.create_filter_dialog.name.set ""
  when "Keywords"
    @wildfire.wildfireapp_messenger.create_filter_dialog.keywords.set ""
  else raise "Unknown field #{field}"
  end
end

When /^I attempt to save the filter$/ do
  @wildfire.wildfireapp_messenger.create_filter_dialog.save_button.click
end

Then /^the "(.*)" error message should be displayed on the filter creation form$/ do |error_message|
  @wildfire.wildfireapp_messenger.create_filter_dialog.error_explaination_div.text.should include error_message
end

When /^I assign the filter to my company$/ do
  @wildfire.wildfireapp_messenger.assign_filter_to_my_company(@unassigned_filter_name)
end

Given /^I have a filter assigned to my company$/ do
  step 'I have an unassigned filter'
  step 'I assign the filter to my company'
  step 'the filter page should show that the filter is assigned to my company'
end

When /^I unassign the filter from my company$/ do
  @wildfire.wildfireapp_messenger.unassign_filter_from_my_company(@unassigned_filter_name)
end

Then /^the filter page should show that the filter is assigned to my company$/ do
  @wildfire.wildfireapp_messenger.filters_panel.wait_for_filters(30)
  sleep 1 # Wait for filters to render correctly on filters panel
  filters = @wildfire.wildfireapp_messenger.filters_panel.filters
  filter = filters.select {|f| f.name.text.include? @unassigned_filter_name}.first
  filter.assigned_properties.text.should include Helpers::Config['facebook_property_name']
end

Then /^the filter page should show that the filter is not assigned to my company$/ do
  @wildfire.wildfireapp_messenger.filters_panel.wait_for_filters(30)
  sleep 1 # Wait for filters to render correctly on filters panel
  filters = @wildfire.wildfireapp_messenger.filters_panel.filters
  filter = filters.select {|f| f.name.text.include? @unassigned_filter_name}.first
  filter.assigned_properties.text.should_not include Helpers::Config['facebook_property_name']
end

Then /^the filter should added to the list of filters$/ do
  @wildfire.wildfireapp_messenger.filters_panel.filters.select {|f| f.name.text.include? @filter_name }.count.should == 1
end
