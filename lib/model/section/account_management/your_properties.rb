class Model::Section::AccountManagement::YourProperties < SitePrism::Section
  element :social_properties_form, 'form#social_properties'
  
  def has_property?(name, type)
    social_properties.include?({:name => name, :type => type.downcase})
  end
  
  def social_properties
    social_properties_form.all('div.field').collect do |property|
      {:name => property.first('div.name a').text, :type => property.first('div.details').text.downcase}
    end
  end
end