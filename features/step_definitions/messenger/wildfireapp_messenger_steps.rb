When /^I click the "(.*)" tab on the left navigation menu on wildfire app messenger page$/ do |tab|
  case tab
  when "Messages" 
    @wildfire.wildfireapp_messenger.sidebar.messages_link.click
  when "Flagged Messages" 
    @wildfire.wildfireapp_messenger.sidebar.flagged_messages_link.click
  when "Assigned Messages" 
    @wildfire.wildfireapp_messenger.sidebar.assigned_messages_link.click
  when "Deleted Messages" 
    @wildfire.wildfireapp_messenger.sidebar.deleted_messages_link.click
  else raise "Unknown tab #{tab}"
  end
  sleep 2
end

Then /^the header in the messages area should be "(.*)"$/ do |header_text|
  @wildfire.wildfireapp_messenger.messages_div_header.text.should eql header_text
end

Given /^I have an unassigned message$/ do
  unless @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.size > 0
    @wildfire.wildfireapp_messenger.sidebar.compose_link.click
    @wildfire.wildfireapp_messenger.compose_message_panel.compose_and_send_a_valid_message
    @wildfire.wildfireapp_messenger.sidebar.messages_link.click
    @messengeradmin.refresh_a_social_property.load
    if @messengeradmin.login.is_login_page? then @messengeradmin.login.login(Helpers::Config.admin_login, Helpers::Config.admin_password) end
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