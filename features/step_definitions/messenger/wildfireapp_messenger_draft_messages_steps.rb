Given /^I have a valid draft message$/ do
  unless @wildfire.wildfireapp_messenger.draft_messages_panel.messages.size > 0
    step 'I compose a new Mesenger message'
    step 'I save the message as a draft'
    step 'I click the "Drafts" tab on the left navigation menu on wildfire app messenger page'
  end
  
  unless @wildfire.wildfireapp_messenger.draft_messages_panel.messages.size > 0 then raise "No draft messages could be found in the messenger inbox" end

  @draft_message = @wildfire.wildfireapp_messenger.draft_messages_panel.messages.first
  @draft_message_content = @draft_message.body.text
end

Given /^I have a valid unique draft message$/ do
  step 'I compose a new Mesenger message'
  step 'I save the message as a draft'
  step 'I click the "Drafts" tab on the left navigation menu on wildfire app messenger page'
  
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
  @wildfire.wildfireapp_messenger.click_tab 'Drafts'
  @wildfire.wildfireapp_messenger.draft_messages_panel.messages.select {|m| m.body.text.include? @draft_message_content }.count.should eql 0
end

Given /^I have more than (\d+) draft messages$/ do |number_of_messages|
  Timeout.timeout(600) do
    while @wildfire.wildfireapp_messenger.draft_messages_panel.pagination_message_total_text.to_i <= number_of_messages.to_i
      step 'I compose a new Mesenger message'
      step 'I save the message as a draft'
      step 'I click the "Drafts" tab on the left navigation menu on wildfire app messenger page'
    end
  end
end

Then /^(\d+) drafts should be displayed in the Drafts Panel$/ do |number_of_messages|
  @drafts = @wildfire.wildfireapp_messenger.draft_messages_panel.messages.collect {|d| d.body.text }
  @drafts.count.should eql number_of_messages.to_i
end

Then /^the Drafts Panel paging message should include "(.*?)"$/ do |paging_message|
  @wildfire.wildfireapp_messenger.draft_messages_panel.pagination_current_page_indicator_text.should include paging_message
end

Then /^the right paging icon should be enabled in the Drafts Panel$/ do
  @wildfire.wildfireapp_messenger.draft_messages_panel.should have_enabled_next_page_button
end

When /^I click the right paging icon in the Drafts Panel$/ do
  @wildfire.wildfireapp_messenger.draft_messages_panel.click_enabled_next_page_button
end

When /^I view the next page of draft messages$/ do
  @wildfire.wildfireapp_messenger.draft_messages_panel.click_enabled_next_page_button
end

Then /^more drafts should be displayed$/ do
  @more_drafts = @wildfire.wildfireapp_messenger.draft_messages_panel.messages.collect {|d| d.body.text }
  @intersection = @more_drafts & @drafts
  @intersection.size.should eql 0
end

Then /^the left paging icon should be enabled in the Drafts Panel$/ do
  @wildfire.wildfireapp_messenger.draft_messages_panel.should have_enabled_previous_page_button
end
