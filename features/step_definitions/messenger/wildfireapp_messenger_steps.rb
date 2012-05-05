When /^I click the "(.*)" tab on the left navigation menu on wildfire app messenger page$/ do |tab|
  case tab
  when "Messages" 
    @wildfire.wildfireapp_messenger.load_messages_panel
  when "Flagged Messages" 
    @wildfire.wildfireapp_messenger.load_flagged_messages_panel
  when "Assigned Messages" 
    @wildfire.wildfireapp_messenger.load_assigned_messages_panel
  when "Deleted Messages" 
    @wildfire.wildfireapp_messenger.load_deleted_messages_panel
  else raise "Unknown tab #{tab}"
  end
  sleep 2
end

Given /^I compose a new Mesenger message$/ do
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.load_compose_message_panel
  @message_body = @wildfire.wildfireapp_messenger.compose_a_valid_message
end

Then /^the header in the messages area should be "(.*)"$/ do |header_text|
  @wildfire.wildfireapp_messenger.messages_div_header.text.should eql header_text
end

When /^the "(.*)" is left blank during message composition$/ do |field|
  case field
  when "Destination"
    @wildfire.wildfireapp_messenger.compose_message_panel.select_recipient_by_name
  when "Message"
    @wildfire.wildfireapp_messenger.compose_message_panel.message_textbox.set ""
  else raise "Unknown field #{field}"
  end
end

When /^I attempt to send the message$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.send_message
end

Then /^the "(.*)" error message should be displayed on the message composition form$/ do |error_message|
  case error_message
  when "Please enter a destination."
    @wildfire.wildfireapp_messenger.compose_message_panel.recepients_error.text.should include error_message
  when "Please enter a message."
    @wildfire.wildfireapp_messenger.compose_message_panel.message_error.text.should include error_message
  else raise "Don't know where the error message would be displayed on the compose message page => #{error_message}"
  end
end

Given /^I have an unassigned message$/ do
  unless @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.size > 0
    @wildfire.wildfireapp_messenger.sidebar.compose_link.click
    @wildfire.wildfireapp_messenger.compose_message_panel.compose_and_send_a_valid_message
    @wildfire.wildfireapp_messenger.sidebar.messages_link.click
    @messengeradmin.refresh_a_social_property.load
    @messengeradmin.refresh_a_social_property.refresh_property "Palo Alto Foodies"
    @wildfire.wildfireapp_messenger.load
  end

  Timeout.timeout(60) do
    while @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.size < 1
      sleep 1.0 
      @wildfire.wildfireapp_messenger.sidebar.messages_link.click
    end
  end
  
  unless @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.size > 0 then raise "No unassigned messages could be found in the messenger inbox" end

  @unassigned_message = @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.first
  @unassigned_message_content = @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.first.body.text
end

Given /^I have an flagged message in Flagged Messages$/ do
  unless @wildfire.wildfireapp_messenger.messages_panel.flagged_messages.size > 0
    @facebook.timeline.visit_my_timeline
    creds = { :username => Helpers::Config['default_facebook_poster_username'], :password => Helpers::Config['default_facebook_poster_password'] }
    @facebook.timeline.login creds
    @facebook.timeline.post_message("#{String.random} #{Helpers::Config['default_filter_keyword']}")
    @messengeradmin.refresh_a_social_property.load
    @messengeradmin.refresh_a_social_property.refresh_property "Palo Alto Foodies"
    @wildfire.wildfireapp_messenger.load
    step "I click the \"Flagged Messages\" tab on the left navigation menu on wildfire app messenger page"
  end

  begin
    Timeout.timeout(30) do
      while @wildfire.wildfireapp_messenger.messages_panel.flagged_messages.count == 0
        sleep 2
        @wildfire.wildfireapp_messenger.sidebar.flagged_messages_link.click
      end
    end
  rescue Timeout::Error
    raise "No flagged messages found" 
  end

  @flagged_message = @wildfire.wildfireapp_messenger.messages_panel.flagged_messages.first
  @flagged_message_content = @wildfire.wildfireapp_messenger.messages_panel.flagged_messages.first.body.text
end

When /^I unflag the message$/ do
  @wildfire.wildfireapp_messenger.unflag_message @flagged_message
end

When /^I assign that message to myself$/ do
  @wildfire.wildfireapp_messenger.assign_message_to_me @unassigned_message
end

Then /^the message should be in my Assigned Messages$/ do
  sleep 2.0
  @wildfire.wildfireapp_messenger.sidebar.assigned_messages_link.click

  Timeout.timeout(60) do
    while @wildfire.wildfireapp_messenger.messages_div_header.text != 'Assigned Messages'
      sleep 5.0
      @wildfire.wildfireapp_messenger.sidebar.assigned_messages_link.click
    end
  end

  @content_of_each_message_in_assigned_panel = @wildfire.wildfireapp_messenger.assigned_messages_panel.messages.collect {|m| m.body.text }
  @content_of_each_message_in_assigned_panel.should include @unassigned_message_content
end

Then /^the message should not be displayed in Flagged$/ do
  @content_of_each_message_in_flagged_panel = @wildfire.wildfireapp_messenger.flagged_messages_panel.messages.collect {|m| m.body.text }
  @content_of_each_message_in_flagged_panel.should_not include @flagged_message_content
end