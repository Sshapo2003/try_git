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
  @wildfire.wildfireapp_messenger.messages_div.header.text.should eql header_text
end
