Then /^the message should be visible on my twitter page$/ do
  @twitter.home.visit_my_page
  @twitter.home.wait_for_tweets(5)

  Timeout.timeout(90) do
    while @twitter.home.tweets.collect {|t| t.text }.include? @message_body == false do
      page.driver.refresh
      @twitter.home.wait_for_tweets(5)
    end
  end
  @twitter.home.tweets.collect {|t| t.text }.should include @message_body
end