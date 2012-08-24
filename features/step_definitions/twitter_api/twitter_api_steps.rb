Given /^I have an active twitter account$/ do
  Helpers::TwitterHelper.user 'palo_alto_foodie'
end

Given /^the poster is the active twitter account$/ do
  Helpers::TwitterHelper.user 'burger_with_cheez'
end

When /^I request the first message using the twitter API$/ do
  @first_message = Helpers::TwitterHelper.user_timeline.first
end

Given /^I have a twitter message with multiple replies from another user$/ do
  step 'I have an active twitter account'
  step 'I request the first message using the twitter API'
  step 'the poster is the active twitter account'
  @reply_one_content = "@#{Helpers::Config['twitter_property_name']} #{String.random} Tasty foods for me! #{Time.unix_gmt}"
  Helpers::TwitterHelper.reply_to_tweet(@first_message, @reply_one_content)
  @reply_two_content = "@#{Helpers::Config['twitter_property_name']} #{String.random} Tasty foods for me! #{Time.unix_gmt}"
  Helpers::TwitterHelper.reply_to_tweet(@first_message, @reply_two_content)
end

Then /^I should get a valid message$/ do
  @first_message.user.name.should == 'Pa Fd'
end

When /^I send a message using the twitter API$/ do
  @tweet_content = "#{String.random} Tasty foods for me! #{Time.unix_gmt}"
  Helpers::TwitterHelper.update(@tweet_content)
end

Then /^the message should be visible on my timeline$/ do
  Timeout.timeout(30) { sleep 2.0 until Helpers::TwitterHelper.user_timeline.collect {|r| r.text}.include? @tweet_content }
  @reply_to_tweet = Helpers::TwitterHelper.user_timeline.select {|r| r.text == @tweet_content}.first
end

When /^I reply to another users message$/ do
  @first_message = Helpers::TwitterHelper.user_timeline_for_user(Helpers::Config['twitter_property_name']).first
  @tweet_content = "@#{Helpers::Config['twitter_property_name']} #{String.random} Tasty foods for me! #{Time.unix_gmt}"
  Helpers::TwitterHelper.reply_to_tweet(@first_message, @tweet_content)
end

Then /^the reply should be visible on the users timeline$/ do
  step 'the message should be visible on my timeline'
  @reply_to_tweet[:in_reply_to_screen_name].should eql Helpers::Config['twitter_property_name']
  @reply_to_tweet[:in_reply_to_status_id].should eql @first_message[:id]
end

Given /^I have a tweet with no replies$/ do
  step 'I have an active twitter account'
  @tweet_content = "#{String.random} Do you like Thai food? #{Time.unix_gmt}"
  Helpers::TwitterHelper.update @tweet_content
  step 'the message should be visible on my timeline'
end

Then /^the message should be visible on my twitter page$/ do
  @responses = Helpers::TwitterHelper.user_timeline_for_user(Helpers::Config['twitter_property_name'])
  @responses.collect {|r| r.text}.should include @message_body
end
