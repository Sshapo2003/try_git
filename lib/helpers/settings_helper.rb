class Helpers::SettingsHelper
  class << self
    def reconnect_property property_name
      wildfire = Model::Wildfire.new
      property = wildfire.your_properties.properties.select {|p| p.name.text.downcase.include? property_name.downcase}.first
      wildfire.your_properties.visit property.reconnect_button[:href]
      Model::Page::TwitterOauth.new.authorise(Helpers::Config['twitter_property_name'], 'th1sismypassword')
    end
  end
end
