When /^I click the "(.*)" tab on the left navigation menu on wildfire app messenger page$/ do |tab|
  @wildfire.wildfireapp_messenger.click_tab(tab)
end

When /^I compose and send a valid message$/ do
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.load_compose_message_panel
  @message_body = @wildfire.wildfireapp_messenger.compose_and_send_a_valid_message
end

When /^I compose and send a valid message for my twitter property$/ do
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.load_compose_message_panel
  @message_body = @wildfire.wildfireapp_messenger.compose_and_send_a_valid_message_to_twitter
end

Given /^I compose a new Mesenger message$/ do
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.load_compose_message_panel
  @message_body = @wildfire.wildfireapp_messenger.compose_a_valid_message
end

When /^I add a link to the message$/ do
  @attachment = { :type => :link, :url => 'www.wildfireapp.com', :link_title => 'Wildfire - Wildfire App - Social Media Marketing Software Suite' }
  @wildfire.wildfireapp_messenger.attach_to_message(@attachment)
end

When /^I send the message$/ do
  @wildfire.wildfireapp_messenger.send_message
end

When /^I save the message as a draft$/ do
  @wildfire.wildfireapp_messenger.save_as_draft
end

Given /^I have a valid draft message$/ do
  unless @wildfire.wildfireapp_messenger.draft_messages_panel.messages.size > 0
    step 'I compose a new Mesenger message'
    step 'I save the message as a draft'
  end
  
  unless @wildfire.wildfireapp_messenger.draft_messages_panel.messages.size > 0 then raise "No draft messages could be found in the messenger inbox" end

  @draft_message = @wildfire.wildfireapp_messenger.draft_messages_panel.messages.first
  @draft_message_content = @draft_message.body.text
end

When /^I delete the draft message$/ do
  @draft_message.delete_first_draft
end

When /^I edit the draft$/ do
  @message_body = @draft_message.edit_first_draft
end

When /^I send the draft message$/ do
  @wildfire.wildfireapp_messenger.send_draft_message
end

Then /^I should be informed that the draft has been deleted$/ do
  Timeout.timeout(30) { sleep 0.1 until @wildfire.wildfireapp_messenger.sticky_header_text.text.should include "Draft was successfully deleted." }
  @wildfire.wildfireapp_messenger.sticky_header_text.text.should include "Draft was successfully deleted."
end

Then /^the message should not be visible in the drafts folder$/ do
  unless @wildfire.wildfireapp_messenger.is_drafts_panel? then @wildfire.wildfireapp_messenger.load_drafts_panel end
  @wildfire.wildfireapp_messenger.draft_messages_panel.messages.select {|m| m.body.text.include? @draft_message_content }.count.should eql 0
end

Then /^the header in the messages area should be "(.*)"$/ do |header_text|
  @wildfire.wildfireapp_messenger.messages_div_header.text.should eql header_text
end

Then /^I should be informed that the message has been sent succesfully$/ do
  @wildfire.wildfireapp_messenger.sticky_header_text.text.should include "Message successfully sent"
end

Then /^I should be informed that the draft message has been sent succesfully$/ do
  @wildfire.wildfireapp_messenger.sticky_header_text.text.should include "Message successfully scheduled"
end

Then /^I should be informed that the message has been saved as a draft$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.header.text.should include "Edit Draft Message - Saved on "
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
  @unassigned_message_content = @unassigned_message.body.text
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
  @flagged_message_content = @flagged_message.body.text
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

Then /^the message should be visible in the "(.*)" folder$/ do |folder|
  Timeout.timeout(60) do
    while @wildfire.wildfireapp_messenger.messages_in_folder(folder).select {|m| m.include? @message_body }.count < 1 
      sleep 5.0
      @wildfire.wildfireapp_messenger.click_tab folder
    end
  end
  @wildfire.wildfireapp_messenger.messages_in_folder(folder).select {|m| m.include? @message_body }.count.should eql 1
end