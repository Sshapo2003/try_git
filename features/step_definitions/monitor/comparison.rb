When /^I follow the Walmart vs target vs amazon\.com comparison link$/ do
  @wildfire.monitor.facebook_comparisson_link.click
end

When /^I follow the Domino's Pizza vs Papa John's Pizza vs Pizza Hut comparison link$/ do
  @wildfire.monitor.twitter_comparisson_link.click
end

Then /^the monitor page should be loaded with these Facebook properties$/ do |table|
  # table is a Cucumber::Ast::Table
  expected_properties = table.raw.flatten
  Timeout.timeout(30) { sleep 0.1 until @wildfire.comparison.facebook_comparison_item_names.select {|n| n.text == "" }.count == 0 }
  facebook_comparison_item_names_text = @wildfire.comparison.facebook_comparison_item_names.collect {|n| n.text}
  expected_properties.should eql facebook_comparison_item_names_text
end

Then /^the monitor page should be loaded with these Twitter properties$/ do |table|
  # table is a Cucumber::Ast::Table
  expected_properties = table.raw.flatten
  Timeout.timeout(30) { sleep 0.1 until @wildfire.comparison.twitter_comparison_item_names.select {|n| n.text == "" }.count == 0 }
  twitter_comparison_item_names_text = @wildfire.comparison.twitter_comparison_item_names.collect {|n| n.text}
  twitter_comparison_item_names_text.should eql expected_properties
end

Then /^the facebook chart should be loaded$/ do
  @wildfire.comparison.should have_facebook_comparison_chart
end

Then /^the facebook data table should be loaded$/ do
  @wildfire.comparison.should have_facebook_comparison_table
end

Then /^the twitter chart should be loaded$/ do
  @wildfire.comparison.should have_twitter_comparison_chart
end

Then /^the twitter data table should be loaded$/ do
  @wildfire.comparison.should have_twitter_comparison_table
end
