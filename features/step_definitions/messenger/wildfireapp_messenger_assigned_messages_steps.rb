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

When /^I hover over the assigned user icon$/ do
  @assigned_message.hover_over_assigned_to
end

Then /^the assigned user bubbletip should be displayed$/ do
  @assigned_message.assigned_to_bubbletip_visible?.should be_true
end

Then /^the assigned icon is displayed$/ do
  @assigned_message.assigned_avatar[:src].should include '/images/assigned-inactive-badge.png?'
end
