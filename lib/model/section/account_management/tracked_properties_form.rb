class Model::Section::AccountManagement::TrackedPropertiesForm < SitePrism::Section
  include Capybara::DSL
  
  def tracked_properties
    return [] unless has_properties?
    all('div.integration').collect do |row|
      {:name => row.first('div.name a').text, :property_type => row.first('div.name div.details').text}
    end
  end
  
  def has_properties?
    using_wait_time(0.5) { has_content?("You haven't added any properties yet") ? false : true }
  end
end