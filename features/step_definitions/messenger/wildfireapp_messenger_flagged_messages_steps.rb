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

Then /^the message should be listed in flagged folder$/ do
  Timeout.timeout_and_raise(30, "Timed out while waiting for message \"#{@flagged_message_content}\" to appear in flagged folder") do
    until @wildfire.wildfireapp_messenger.flagged_messages_panel.messages.collect {|m| m.body.text }.include? @flagged_message_content do
      sleep 2
      step 'I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page'
    end
  end
  @wildfire.wildfireapp_messenger.flagged_messages_panel.messages.collect {|m| m.body.text }.should include @flagged_message_content
end

Then /^the message should be listed in deleted folder$/ do
  Timeout.timeout_and_raise(30, "Timed out while waiting for message \"#{@flagged_message_content}\" to appear in deleted folder") do
    until @wildfire.wildfireapp_messenger.deleted_messages_panel.messages.collect {|m| m.body.text }.include? @flagged_message_content do
      sleep 2
      step 'I click the "Deleted Messages" tab on the left navigation menu on wildfire app messenger page'
    end
  end
  @wildfire.wildfireapp_messenger.deleted_messages_panel.messages.collect {|m| m.body.text }.should include @flagged_message_content
end

Then /^the message should not be displayed in Flagged$/ do
  @content_of_each_message_in_flagged_panel = @wildfire.wildfireapp_messenger.flagged_messages_panel.messages.collect {|m| m.body.text }
  @content_of_each_message_in_flagged_panel.should_not include @flagged_message_content
end
