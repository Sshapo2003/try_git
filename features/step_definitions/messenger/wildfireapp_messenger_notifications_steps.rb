Given /^I have no current notifications$/ do
  clear_notifications = ->{ unless @wildfire.wildfireapp_messenger.notifications_trigger.text == "0" then @wildfire.wildfireapp_messenger.notifications_trigger.click end }
  msg = "Expected 0 noticifaction but there were #{@wildfire.wildfireapp_messenger.notifications_trigger.text}"
  Timeout.timeout_and_raise(30, msg) { clear_notifications.call }
end

When /^a notification event is triggered$/ do
  creds = { :username => Helpers::Config['default_facebook_poster_username'], :password => Helpers::Config['default_facebook_poster_password'] }
  @facebook.timeline.visit_my_timeline(creds)
  @message_body = @facebook.timeline.post_message("#{String.random} #{Helpers::Config['default_flag_filter_keyword']}")
  @messengeradmin.refresh_a_social_property.load
  @messengeradmin.refresh_a_social_property.refresh_property Helpers::Config['facebook_property_name']
  @wildfire.wildfireapp_messenger.load
end

Then /^I should have notifications$/ do
  Timeout.timeout(600) { sleep 0.1 until @wildfire.wildfireapp_messenger.notifications_trigger.text != "0" }
end

When /^I click the notifications link$/ do
  @wildfire.wildfireapp_messenger.notifications_trigger.click
end

Then /^I should see the recently triggered notification details$/ do
  range = Chronic.parse('10 minutes ago')..Time.now
  posted_time_string = @wildfire.wildfireapp_messenger.notifications.first.time.text
  posted_time = Chronic.parse(posted_time_string[4..posted_time_string.length])
  notifications = @wildfire.wildfireapp_messenger.notifications.collect {|n| n.text}.join(" ")
  msg = "Expected a notification with timestamp around#{posted_time_string} in #{notifications}"
  range.cover?(posted_time).should(be_true, msg)
end

Given /^I should have no current notifications$/ do
  @wildfire.wildfireapp_messenger.notifications_trigger.text.should eql "0"
end
