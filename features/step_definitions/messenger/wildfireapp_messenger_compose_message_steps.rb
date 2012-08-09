When /^I compose and send a valid message$/ do
  @wildfire.wildfireapp_messenger.load
  @wildfire.wildfireapp_messenger.click_tab 'Compose'
  @message_body = @wildfire.wildfireapp_messenger.compose_and_send_a_valid_message
end

Given /^I have a twitter message$/ do
  @message_body = Helpers::MessengerHelper.compose_and_send_a_valid_twitter_message_to_my_twitter_property
end

When /^I compose and send a valid message for my twitter property$/ do
  @message_body = Helpers::MessengerHelper.compose_and_send_a_valid_twitter_message_to_my_twitter_property
end

Given /^I compose a new Mesenger message$/ do
  unless @wildfire.wildfireapp_messenger.displayed? then @wildfire.wildfireapp_messenger.load end
  @wildfire.wildfireapp_messenger.click_tab 'Compose'
  @message_body = @wildfire.wildfireapp_messenger.compose_a_valid_message
end

When /^I add a link to the message$/ do
  @attachment = { :type => :link, :url => 'www.wildfireapp.com' }
  @wildfire.wildfireapp_messenger.attach_to_message(@attachment)
end

When /^I schedule the message to be sent at some point in the distant future$/ do
  @wildfire.wildfireapp_messenger.schedule_message Chronic.parse('in one year').strftime("%m/%d/%Y")
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
  when "Please enter a time in the future."
    @wildfire.wildfireapp_messenger.compose_message_panel.date_error.text.should include error_message
  when "Please enter a message."
    @wildfire.wildfireapp_messenger.compose_message_panel.message_error.text.should include error_message
  else raise "Don't know where the error message would be displayed on the compose message page => #{error_message}"
  end
end

When /^I select the "(.*)" radio button on wildfire app messenger page$/ do |button|
  @wildfire.wildfireapp_messenger.compose_message_panel.later_button.click
end

When /^I set the Messenger message date in the past$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.later_button.click
  @wildfire.wildfireapp_messenger.compose_message_panel.date_field.set Chronic.parse('yesterday').strftime("%m/%d/%y")
end

Then /^the "(.*?)" button should be displayed on wildfire app messenger page$/ do |button_label|
  if ENV['CONFIG'] == 'am-test'
    @wildfire.wildfireapp_messenger.compose_message_panel.send_button[:value].should include button_label
  else
    @wildfire.wildfireapp_messenger.compose_message_panel.send_button.text.should include button_label
  end
end

Then /^the time should be set for about now$/ do
  date = @wildfire.wildfireapp_messenger.compose_message_panel.date_field[:value]
  hours = @wildfire.wildfireapp_messenger.compose_message_panel.hours_select_value.text
  minutes = @wildfire.wildfireapp_messenger.compose_message_panel.minutes_select_value.text

  (date == Time.now.strftime("%m/%d/%y")).should be_true, "Expected the date to be #{Time.now.strftime("%m/%d/%y")} but was #{date}. Is your system clock correct?"
  (hours ==Time.now.strftime("%l").strip).should be_true, "Expected the hours to be #{Time.now.strftime("%l").strip} but was #{hours}. Is your system clock correct?"
  
  min_minutes = (Time.now.strftime("%M").to_i - 10)
  max_minutes = (Time.now.strftime("%M").to_i + 10)
  time_within_threshold = (min_minutes...max_minutes) === minutes.to_i
  time_within_threshold.should be_true, "Expected the minutes to be #{} but was #{minutes}. Is your system clock correct?"
end

Given /^I add a long link to the message$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.link_shortner_field.set 'http://www.thisisareallylonglink.com'
end

When /^I click the shorten link$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.link_shortner_link.click
end

Then /^the link should have the following properties$/ do |table|
  preview = @wildfire.wildfireapp_messenger.compose_message_panel.attachments_section.attachment_preview
  table.rows_hash.each do |key, value|
    case key.downcase
    when "image"
      preview.wait_for_image
      preview.image_url.should include value
    when "title"
      preview.wait_for_title
      preview.title.text.should include value
    when "body"
      preview.wait_for_body
      preview.body.text.should include value
    when "buttons"
      if value == "Left and Right"
        preview.wait_for_previous_button
        preview.should have_previous_button
        preview.should have_next_button
      else
        raise "Unknown button type #{value}"
      end
    else raise "Unknown property #{key}"
    end
  end
end

When /^I click the close button on the link attachment panel$/ do
  @wildfire.wildfireapp_messenger.compose_message_panel.attachments_section.attachment_preview.close_button.click
end

Then /^the link attachment panel should not be visible$/ do
  sleep 2
  @wildfire.wildfireapp_messenger.compose_message_panel.attachments_section.attachment_preview_div[:style].should include 'display: none;'
end

Then /^the reply should be visible in my wildfire messenger messages$/ do
  Helpers::MessengerAdminHelper.refresh_my_twitter_account
  step 'I navigate to the wildfire app messenger page'
  message = Helpers::MessengerHelper.wait_for_message_to_appear @message_body
  replies = Helpers::MessengerHelper.replies_for_message message
  replies.select {|r| r.text.include? @reply }.count.should be > 0
end
