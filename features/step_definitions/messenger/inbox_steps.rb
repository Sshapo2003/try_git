When /^I view the replies for the twitter message$/ do
  Timeout.timeout_and_raise(180, "Timed out while waiting for tweet #{@tweet_content} to appear in the messenger inbox.") do
    while @wildfire.wildfireapp_messenger.messages_panel.messages.select {|m| m.body.text.include? @tweet_content }.count < 1 do
      sleep 5.0
      page.driver.refresh
    end
  end
  @message = @wildfire.wildfireapp_messenger.messages_panel.messages.select {|m| m.body.text.include? @tweet_content}.first
  @message.view_replies
end

Then /^I should be informed that there are no replies$/ do
  @message.twitter_replies_area.text.should include 'No Replies'
end

Then /^each of the replies should be visible in wildfire messenger in chronological order$/ do
  @message.replies[0].body.text.should include @reply_two
  @message.replies[1].body.text.should include @reply_one
end

Then /^each of the replies should have a Reply button$/ do
  @message.replies[0].should have_reply_button
  @message.replies[1].should have_reply_button
end

When /^I click the reply button for one of the messages$/ do
  @message.replies[0].reply_button.click
end

Then /^the reply field should be prepopulated with the other users name$/ do
  @message.replies[0].reply_text_entry_field.text.should include "@#{Helpers::Config['default_twitter_poster_username']}"
end

When /^I enter a message with more than (\d+) characters$/ do |num_chars|
  @message.replies[0].reply_text_entry_field.set String.random(num_chars.to_i + 1)
end

Then /^the character count should become a negative value$/ do
  @message.replies[0].char_count_down.text.should include '-'
end

Then /^the Tweet button should be disabled$/ do
  @message.replies[0].post_reply_button[:disabled].should eql 'true'
end

When /^I enter a message with a valid number of characters$/ do
  @message_body = "@#{Helpers::Config['default_twitter_poster_username']} #{String.random} #{String.random} #{String.random}"
  @message.replies[0].reply_text_entry_field.set @message_body
end

Then /^the character count should become a positive value$/ do
  @message.replies[0].char_count_down.text.should_not include '-'
end

Then /^the Tweet button should be enabled$/ do
  @message.replies[0].post_reply_button[:disabled].should eql nil
end

When /^I send the reply to the twitter message$/ do
  @message.replies[0].post_reply_button.click
  msg = 'Time Out occured waiting for "Reply sent!" to appear.'
  Timeout.timeout(30, msg) {sleep 0.1 while not @message.replies[0].reply_form.text.include? 'Reply sent!' }
end

Then /^I should be informed that the reply has been sent$/ do
  @message.replies[0].reply_form.text.should include 'Reply sent!'
end
