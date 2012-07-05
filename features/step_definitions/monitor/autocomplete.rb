When /^I type "(.*?)" in the facebook searchbox$/ do |text_to_text|
  @wildfire.track_your_competitors.facebook_comparisson_text_field_one.set text_to_text
  @wildfire.track_your_competitors.wait_for_comparisson_drop_down_selections
end

Then /^the first row should be 'Compare using "wildfire" OR choose a suggestion below'$/ do
  expected = %{Compare using "wildfire"\nOR choose a suggestion below}
  @wildfire.track_your_competitors.comparisson_drop_down_selections.first.text.should eql expected
end

Then /^every result should have "(.*?)" in the title$/ do |text_in_title|
  @wildfire.track_your_competitors.comparisson_drop_down_selections.each { |e| e.text.downcase.should include text_in_title }
end
