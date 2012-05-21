Given /^I have no current notifications$/ do
  unless @wildfire.wildfireapp_messenger.notifications_trigger.text == "0" then @wildfire.wildfireapp_messenger.notifications_trigger.click end
  @wildfire.wildfireapp_messenger.notifications_trigger.text.should eql "0"
end

When /^a notification event is triggered$/ do
  @message_body = Helpers::FacebookHelper.post_message_matching_filter
  Helpers::MessengerAdminHelper.refresh_a_social_property 'Palo Alto Foodies'
  @wildfire.wildfireapp_messenger.load
end

Then /^I should have notifications$/ do
  Timeout.timeout(60) { sleep 0.1 until @wildfire.wildfireapp_messenger.notifications_trigger.text != "0" }
  @wildfire.wildfireapp_messenger.notifications_trigger.text.should_not eql "0"
end

When /^I click the notifications link$/ do
  @wildfire.wildfireapp_messenger.notifications_trigger.click
end

Then /^I should see the recently triggered notification details$/ do
  range = Chronic.parse('10 minutes ago')..Time.now
  posted_time_string = @wildfire.wildfireapp_messenger.notifications.first.time.text
  posted_time = Chronic.parse(posted_time_string[4..posted_time_string.length])
  range.cover?(posted_time).should eql true
end
