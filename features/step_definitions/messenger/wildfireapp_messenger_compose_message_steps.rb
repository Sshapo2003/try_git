When /^I compose and send a valid message$/ do
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.click_tab 'Compose'
  @message_body = @wildfire.wildfireapp_messenger.compose_and_send_a_valid_message
end

When /^I compose and send a valid message for my twitter property$/ do
  unless @wildfire.wildfireapp_messenger.displayed? then @wildfire.wildfireapp_messenger.load end
  @wildfire.wildfireapp_messenger.click_tab 'Compose'
  @message_body = @wildfire.wildfireapp_messenger.compose_and_send_a_valid_message_to_twitter
end

Given /^I compose a new Mesenger message$/ do
  unless @wildfire.wildfireapp_messenger.displayed? then @wildfire.wildfireapp_messenger.load end
  @wildfire.wildfireapp_messenger.click_tab 'Compose'
  @message_body = @wildfire.wildfireapp_messenger.compose_a_valid_message
end

When /^I add a link to the message$/ do
  @attachment = { :type => :link, :url => 'www.wildfireapp.com', :link_title => 'Wildfire - Wildfire App - Social Media Marketing Software Suite' }
  @wildfire.wildfireapp_messenger.attach_to_message(@attachment)
end

When /^I schedule the message to be sent at some point in the distant future$/ do
  @wildfire.wildfireapp_messenger.schedule_message Chronic.parse('in one year').strftime("%m/%d/%y")
end

When /^I send the message$/ do
  @wildfire.wildfireapp_messenger.send_message
end

When /^I schedule the message$/ do
  @wildfire.wildfireapp_messenger.send_message
end

When /^I save the message as a draft$/ do
  @wildfire.wildfireapp_messenger.save_as_draft
end

When /^the "(.*)" is left blank during message composition$/ do |field|
  case field
  when "Destination"
    @wildfire.wildfireapp_messenger.compose_message_panel.remove_all_recipients
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
