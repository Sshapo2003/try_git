class Helpers::FacebookHelper
  class << self
    def post_message_matching_filter
      login
      @facebook.timeline.post_message("#{String.random} #{Helpers::Config['default_flag_filter_keyword']}")
    end

    def login
      creds = { :username => Helpers::Config['default_facebook_poster_username'], :password => Helpers::Config['default_facebook_poster_password'] }
      @facebook.timeline.visit_my_timeline(creds)
    end
  end
end
