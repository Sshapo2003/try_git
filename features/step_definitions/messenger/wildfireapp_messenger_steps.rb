When /^I click the "(.*)" tab on the left navigation menu on wildfire app messenger page$/ do |tab|
  @wildfire.wildfireapp_messenger.click_tab(tab)
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

Then /^I should be informed that the message has been scheduled succesfully$/ do
  @wildfire.wildfireapp_messenger.sticky_header_text.text.should include "Message successfully scheduled"
end

Then /^I should be informed that the message has been saved as a draft$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.header.text.should include "Edit Draft Message - Saved on "
end

Given /^I have an assigned message$/ do
  unless @wildfire.wildfireapp_messenger.messages_panel.assigned_messages.size > 0
    step 'I have an unassigned message'
    @wildfire.wildfireapp_messenger.assign_message_to_me @unassigned_message
  end
  @assigned_message = @wildfire.wildfireapp_messenger.messages_panel.assigned_messages.first
end

Given /^I have an unassigned message$/ do
  unless @wildfire.wildfireapp_messenger.messages_panel.unassigned_messages.size > 0
    @wildfire.wildfireapp_messenger.sidebar.compose_link.click
    @wildfire.wildfireapp_messenger.compose_message_panel.compose_and_send_a_valid_message
    @wildfire.wildfireapp_messenger.sidebar.messages_link.click
    @messengeradmin.refresh_a_social_property.load
    @messengeradmin.refresh_a_social_property.refresh_property Helpers::Config['facebook_property_name']
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

Given /^I have a message with a comment$/ do
  @message = @wildfire.wildfireapp_messenger.messages_panel.messages.reject {|m| m.is_flagged?}.select {|m| m.is_facebook_message?}.reject {|m| m.has_sender_name?}.first
  @message_body = @message.body.text
  @message_comment_text = Helpers::MessengerHelper.comment_on_a_message @message
end

When /^I like the comment$/ do
  @comment = @message.comments.select {|m| m.body.text.include? @message_comment_text }.first
  @comment.like
end

When /^I reply to the comment$/ do
  @message = @wildfire.wildfireapp_messenger.messages_panel.messages.select {|m| m.body.text.include? @message_body}.first
  Helpers::MessengerHelper.comment_on_a_message @message
end

Then /^the comment should be liked$/ do
  @comment.should be_liked
end

When /^I assign that message to myself$/ do
  @wildfire.wildfireapp_messenger.assign_message_to_me @unassigned_message
end

Then /^the message should be visible in the "(.*)" folder$/ do |folder|
  Timeout.timeout_and_raise(600, "Timed out while waiting for message #{@message_body} to appear in #{folder} folder.") do
    while @wildfire.wildfireapp_messenger.messages_in_folder(folder).select {|m| m.include? @message_body }.count < 1 do
      sleep 5.0
      @wildfire.wildfireapp_messenger.click_tab folder
    end
  end
  @wildfire.wildfireapp_messenger.messages_in_folder(folder).select {|m| m.include? @message_body }.count.should eql 1
end

Given /^I have more than (\d+) messages in the Messages Panel$/ do |number_of_messages|
  Timeout.timeout_and_raise(600, "Timed out while waiting for #{number_of_messages} messages to be available.") do
    while @wildfire.wildfireapp_messenger.messages_panel.pagination_message_total_text.to_i <= number_of_messages.to_i do
      step 'I compose and send a valid message'
      step 'I navigate to the wildfire app messenger page'
    end
  end
end

Then /^(\d+) messages should be displayed in the Messages Panel$/ do |number_of_messages|
  @messages = @wildfire.wildfireapp_messenger.messages_panel.messages.collect {|d| d.body.text }
  @messages.count.should eql number_of_messages.to_i
end

Then /^the Messages Panel paging message should include "(.*?)"$/ do |paging_message|
  @wildfire.wildfireapp_messenger.messages_panel.wait_for_pagination_totals(30)
  @wildfire.wildfireapp_messenger.messages_panel.pagination_current_page_indicator_text.should include paging_message
end

When /^I click the right paging icon in the Messages Panel$/ do
  @wildfire.wildfireapp_messenger.messages_panel.click_enabled_next_page_button
end

Then /^the (.*) paging icon should be (.*) in the Messages Panel$/ do |direction, state|
  panel = @wildfire.wildfireapp_messenger.messages_panel
  case direction.downcase
  when "left"
    if state == 'disabled'
      panel.should_not have_enabled_previous_page_button
    elsif state == 'enabled'
      panel.should have_enabled_previous_page_button
    else 
      raise "Unknown state: #{state}"
    end
  when "right"
    if state == 'disabled'
      panel.should_not have_enabled_next_page_button
    elsif state == 'enabled'
      panel.should have_enabled_next_page_button
    else
      raise "Unknown state: #{state}"
    end
  else raise "Unknown arrow direction: #{direction}"
  end
end

Then /^more messages should be displayed in the Messages Panel$/ do
  @more_messages = @wildfire.wildfireapp_messenger.messages_panel.messages.collect {|d| d.text }
  @intersection = @more_messages & @messages
  @intersection.size.should eql 0
end

When /^I go to the last page of messages in the Messages Panel$/ do
  while @wildfire.wildfireapp_messenger.messages_panel.has_enabled_next_page_button? do
    @wildfire.wildfireapp_messenger.messages_panel.click_enabled_next_page_button
  end
end

When /^I navigate to the last page of of messages in the Messages Panel via the URL$/ do
  @original_pagination_total = @wildfire.wildfireapp_messenger.messages_panel.pagination_message_total_text
  @number_of_messages = @wildfire.wildfireapp_messenger.messages_panel.pagination_message_total_text.to_i
  @num_pages = (Float(@number_of_messages) / 25.0).ceil
  visit("#{Helpers::Config['wildfire_messenger_root']}/incoming_messages?page=#{@num_pages}")
end

Then /^the remaining messages should be displayed$/ do
  messages_displayed = @wildfire.wildfireapp_messenger.messages_panel.messages.count
  expected_messages_displayed = @number_of_messages - ((@num_pages -1) * 25)
  messages_displayed.should eql expected_messages_displayed
end

Then /^the actions drop down on the "(.*)" panel contains Assign, Delete and Unflag$/ do |panel|
  @wildfire.wildfireapp_messenger.messages_panel.actions_menu.click
  menu_items = @wildfire.wildfireapp_messenger.messages_panel.actions_menu_options
  ["Assign", "Delete", "Unflag"].each {|i| menu_items.text.should include i }
end

Then /^there should be no drop actions drop down on the "Deleted Messages" panel$/ do
  @wildfire.wildfireapp_messenger.messages_panel.has_actions_menu?.should be_false
end

Then /^there should be a "Clear Deleted Messages" button on the "Deleted Messages" panel$/ do
  @wildfire.wildfireapp_messenger.messages_panel.has_clear_deleted_messages_button?.should be_true
end
