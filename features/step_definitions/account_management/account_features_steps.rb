Then /^I (should|should not) have access to Messenger$/ do |expectation|
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.send(expectation.parameterize.underscore, be_active)
end

Then /^I (should|should not) have access to (?:Analytics|Dashboard)$/ do |expectation|
  @wildfire.wildfireapp_analytics.load
  @wildfire.wildfireapp_analytics.send(expectation.parameterize.underscore, be_active)
end

Then /^I (should|should not) have access to Page Manager$/ do |expectation|
  @wildfire.page_manager.load
  if expectation == 'should'
    @wildfire.page_manager.should_not be_locked
  else
    @wildfire.page_manager.should be_locked
  end
end

Then /^I (should|should not) have access to Promotion Builder$/ do |expectation|
  @wildfire.wildfireapp_promotion_builder.load
  @wildfire.wildfireapp_promotion_builder.send(expectation.parameterize.underscore, be_active)
end

Then /^I (should|should not) have access to Monitor$/ do |expectation|
 @wildfire.wildfireapp_monitor.load
 @wildfire.wildfireapp_monitor.send(expectation.parameterize.underscore, be_active)
end

Then /^I should have access to the following applications:$/ do |table|
  table.raw.flatten.each do |app|
    step "I should have access to #{app}"
  end
end