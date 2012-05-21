Given /^I have no current notifications$/ do
  unless @wildfire.wildfireapp_messenger.notifications_trigger.text == "0" then @wildfire.wildfireapp_messenger.notifications_trigger.click end
  @wildfire.wildfireapp_messenger.notifications_trigger.text.should eql "0"
end

When /^a notification event is triggered$/ do
    Helpers::FacebookHelper.post_message_matching_filter
    Helpers::MessengerAdminHelper.refresh_a_social_property 'Palo Alto Foodies'
    @wildfire.wildfireapp_messenger.load
end

Then /^I should have notifications$/ do
  @wildfire.wildfireapp_messenger.notifications_trigger.text.should_not eql "0"
end