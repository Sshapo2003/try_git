Given /^I have more than (\d+) scheduled messages$/ do |number_of_messages|
    Timeout.timeout(600) do
      while @wildfire.wildfireapp_messenger.scheduled_messages_panel.pagination_message_total_text.to_i <= number_of_messages.to_i
      step 'I compose a new Mesenger message'
      step 'I schedule the message to be sent at some point in the distant future'
      step 'I schedule the message'
      step 'I should be informed that the message has been scheduled succesfully'
      step 'I click the "Scheduled" tab on the left navigation menu on wildfire app messenger page'
    end
  end
end

Then /^(\d+) messages should be displayed in the Scheduled Panel$/ do |number_of_messages|
  @messages = @wildfire.wildfireapp_messenger.scheduled_messages_panel.messages.collect {|d| d.body.text }
  @messages.count.should eql number_of_messages.to_i
end

Then /^the message should be visible on the last page of the "Scheduled" folder$/ do
  @wildfire.wildfireapp_messenger.click_tab "Scheduled"
  @wildfire.wildfireapp_messenger.scheduled_messages_panel.go_to_scheduled_messages_last_page

  Timeout.timeout_and_raise(180, "Timed out while waiting for message #{@message_body} to appear in 'Scheduled' folder.") do
    while @wildfire.wildfireapp_messenger.scheduled_messages_panel.messages.select {|m| m.body.text.include? @message_body }.count < 1 do
      sleep 5.0
      page.driver.refresh
    end
  end
  @wildfire.wildfireapp_messenger.scheduled_messages_panel.messages.select {|m| m.body.text.include? @message_body }.count.should eql 1
end

Then /^the Scheduled Panel paging message should include "(.*?)"$/ do |paging_message|
  @wildfire.wildfireapp_messenger.scheduled_messages_panel.pagination_current_page_indicator_text.should include paging_message
end

Then /^the right paging icon should be enabled in the Scheduled Panel$/ do
  @wildfire.wildfireapp_messenger.scheduled_messages_panel.should have_enabled_next_page_button
end

When /^I click the right paging icon in the Scheduled Panel$/ do
  @wildfire.wildfireapp_messenger.scheduled_messages_panel.enabled_next_page_button.click
end

Then /^more messages should be displayed$/ do
  @more_messages = @wildfire.wildfireapp_messenger.scheduled_messages_panel.messages.collect {|d| d.text }
  @intersection = @more_messages & @messages
  @intersection.size.should eql 0
end

Then /^the left paging icon should be enabled in the Scheduled Panel$/ do
  @wildfire.wildfireapp_messenger.scheduled_messages_panel.should have_enabled_previous_page_button
end
