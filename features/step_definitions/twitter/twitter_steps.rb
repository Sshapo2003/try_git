Then /^the message should be visible on my twitter page$/ do
  Helpers::TwitterHelper.wait_for_message_to_appear_on_my_twitter_page_messages @message_body
end

When /^the message receives a reply$/ do
  creds = { :username => Helpers::Config['default_twitter_poster_username'], :password => Helpers::Config['default_twitter_poster_password'] }
  @reply = Helpers::TwitterHelper.post_reply_to_message_as_user(@message_body, creds)
  Helpers::TwitterHelper.wait_for_message_to_appear_on_posters_twitter_page_messages @reply
end
