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
