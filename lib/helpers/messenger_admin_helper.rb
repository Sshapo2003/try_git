class Helpers::MessengerAdminHelper
  class << self
    def refresh_a_social_property property_name
      login
      @messengeradmin.refresh_a_social_property.refresh_property "Palo Alto Foodies"
    end

    def login
      @messengeradmin = Model::Messengeradmin.new
      @messengeradmin.refresh_a_social_property.load
    end
  end
end
