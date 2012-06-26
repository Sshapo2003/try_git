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
