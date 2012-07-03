Then /^the message should be visible on my twitter page$/ do
  Helpers::TwitterHelper.wait_for_message_to_appear_on_my_twitter_page_messages @message_body
end

When /^the message receives a reply$/ do
  creds = { :username => Helpers::Config['default_twitter_poster_username'], :password => Helpers::Config['default_twitter_poster_password'] }
  @reply = Helpers::TwitterHelper.post_reply_to_message_as_user(@message_body, creds)
  Helpers::TwitterHelper.wait_for_message_to_appear_on_posters_twitter_page_messages @reply
end

Given /^I have a tweet with no replies$/ do
  creds = { :username => Helpers::Config['twitter_property_name'], :password => Helpers::Config['shared_password'] }
  @tweet_content = "#{String.random} #{String.random} #{String.random}"
  Helpers::TwitterHelper.post_a_tweet_as_user(@tweet_content, creds)
end

Given /^I have a twitter message with multiple replies from another user$/ do
  creds = { :username => Helpers::Config['default_twitter_poster_username'], :password => Helpers::Config['default_twitter_poster_password'] }
  Helpers::TwitterHelper.visit_my_page_as_user creds
  twitter = Model::Twitter.new
  @tweet_content = twitter.home.tweets.first.body.text
  tweet = twitter.home.tweets.select {|t| t.body.text.include? @tweet_content}.first
  @reply_one = tweet.post_reply
  sleep 5
  tweet = twitter.home.tweets.select {|t| t.body.text.include? @tweet_content}.first
  @reply_two = tweet.post_reply
  sleep 5
end
