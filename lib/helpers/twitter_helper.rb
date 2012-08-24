class Helpers::TwitterHelper
  class << self
    def user user
      configure_for user
    end

    def user_timeline
      Twitter.user_timeline
    end

    def user_timeline_for_user user
      Twitter.user_timeline(user)
    end

    def update text
      Twitter.update(text)
    end

    def reply_to_tweet(tweet, reply_text)
      Twitter.update(reply_text, {"in_reply_to_status_id" => tweet[:id]})
    end

    private

    def configure_for user
      case user
      when 'palo_alto_foodie'
        Twitter.configure do |config|
          config.consumer_key = '8FS521Q7Bku7zLmIvpItQ'
          config.consumer_secret = '5ODBwJTtYJIvvFmDKqIknLuwIpnilvdq6luCb7aveFs'
          config.oauth_token = '621376472-94XJGWULeeivoEZQbCw79gQJsk9nyAXrXr4QWJpL'
          config.oauth_token_secret = 'h2QYioOZ7jwwz5Y7cofd39gKZIROm6TYew2R7MHCbc'
        end
      when 'burger_with_cheez'
        Twitter.configure do |config|
          config.consumer_key = '17lLL53uGoF5C2JGt9iAw'
          config.consumer_secret = '6AgELf5S2ucYzL7tSvMfwGFyQDlZXmdSxIbb1opB4Xw'
          config.oauth_token = '593440321-58gcBow0hY7TtSm4PaaZvnDBteAGHpwJUYmo5PqJ'
          config.oauth_token_secret = 'Il1CA3wqG83LITMrxjoAp0ZYYszmxVaCE2ZKiVGNlh4'
        end
      else
        raise "No Twitter API configuration details available for user: #{user}"
      end
    end
  end
end
