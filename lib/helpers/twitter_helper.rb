class Helpers::TwitterHelper
  class << self
    def wait_for_message_to_appear_on_my_twitter_page_messages message
      twitter = Model::Twitter.new
      go_to_my_page
      wait_for_message_to_appear message
      twitter.home.tweets.collect {|t| t.body.text }
    end

    def wait_for_message_to_appear_on_posters_twitter_page_messages message
      twitter = Model::Twitter.new
      go_to_posters_page
      wait_for_message_to_appear message
      twitter.home.tweets.collect {|t| t.body.text }
    end

    def post_reply_to_message_as_user message_body, creds
      twitter = Model::Twitter.new
      login creds
      go_to_my_page
      wait_for_message_to_appear message_body
      tweet = twitter.home.tweets.select {|t| t.body.text.include? message_body }.first
      tweet.post_reply
    end

    def post_a_tweet_as_user message_body, creds
      twitter = Model::Twitter.new
      login creds
      tweet message_body
    end

    def visit_my_page_as_user creds
      twitter = Model::Twitter.new
      login creds
      go_to_my_page
    end

    private

    def login creds
      twitter = Model::Twitter.new
      twitter.home.login creds
    end

    def go_to_my_page
      twitter = Model::Twitter.new
      twitter.home.visit_my_page
      twitter.home.wait_for_tweets(5)
    end

    def go_to_posters_page
      twitter = Model::Twitter.new
      twitter.home.visit_twitter_posters_page
      twitter.home.wait_for_tweets(5)
    end

    def wait_for_message_to_appear message
      twitter = Model::Twitter.new
      msg = "Time out occured waiting for message to appear in twitter. Message => #{message}"
      Timeout.timeout_and_raise(300, msg) do
        while twitter.home.tweets.select {|t| t.body.text.include? message }.count == 0 do
          twitter.home.page.driver.refresh
          twitter.home.wait_for_tweets(5)
        end
      end
    end

    def tweet tweet
      twitter = Model::Twitter.new
      twitter.home.post_tweet tweet
    end
  end
end
