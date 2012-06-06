class Helpers::MessengerAdminHelper
  class << self
    def refresh_a_social_property property_name
      messengeradmin = Model::Messengeradmin.new
      messengeradmin.refresh_a_social_property.load
      messengeradmin.refresh_a_social_property.refresh_property property_name
    end

    def refresh_my_twitter_account
      refresh_a_social_property Helpers::Config['twitter_property_name']
    end

    def refresh_my_facebook_account
      refresh_a_social_property Helpers::Config['facebook_property_name']
    end
  end
end
