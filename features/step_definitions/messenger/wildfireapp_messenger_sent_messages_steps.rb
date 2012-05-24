Given /^I have more than (\d+) sent messages$/ do |number_of_messages|
  Timeout.timeout(600) do
    while @wildfire.wildfireapp_messenger.sent_messages_panel.pagination_message_total_text.to_i <= number_of_messages.to_i
      step 'I compose and send a valid message'
      step 'I click the "Sent" tab on the left navigation menu on wildfire app messenger page'
    end
  end
end

Then /^(\d+) messages should be displayed in the Sent Panel$/ do |number_of_messages|
  @sent = @wildfire.wildfireapp_messenger.sent_messages_panel.messages.collect {|d| d.body.text }
  @sent.count.should eql number_of_messages.to_i
end

Then /^the Sent Panel paging message should include "(.*?)"$/ do |paging_message|
  @wildfire.wildfireapp_messenger.sent_messages_panel.pagination_current_page_indicator_text.should include paging_message
end

Then /^the right paging icon should be enabled in the Sent Panel$/ do
  @wildfire.wildfireapp_messenger.sent_messages_panel.should have_enabled_next_page_button
end

When /^I click the right paging icon in the Sent Panel$/ do
  @wildfire.wildfireapp_messenger.sent_messages_panel.click_enabled_next_page_button
end

When /^I view the next page of sent messages$/ do
  @wildfire.wildfireapp_messenger.sent_messages_panel.click_enabled_next_page_button
end

Then /^more messages should be displayed in the Sent Panel$/ do
  @more_sent = @wildfire.wildfireapp_messenger.sent_messages_panel.messages.collect {|d| d.body.text }
  @intersection = @more_sent & @sent
  @intersection.size.should eql 0
end

Then /^the left paging icon should be enabled in the Sent Panel$/ do
  @wildfire.wildfireapp_messenger.sent_messages_panel.should have_enabled_previous_page_button
end