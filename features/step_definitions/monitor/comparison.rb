When /^I follow the Walmart vs target vs amazon\.com comparison link$/ do
  @wildfire.monitor.facebook_comparisson_link.click
end

Then /^the monitor page should be loaded with these Facebook properties$/ do |table|
  # table is a Cucumber::Ast::Table
  expected_properties = table.raw.flatten
  facebook_comparison_item_names_text = @wildfire.comparison.facebook_comparison_item_names.collect {|n| n.text}
  expected_properties.should eql facebook_comparison_item_names_text
end

Then /^the facebook chart should be loaded$/ do
  @wildfire.comparison.should have_facebook_comparison_chart
end

Then /^the facebook data table should be loaded$/ do
  @wildfire.comparison.should have_facebook_comparison_table
end
