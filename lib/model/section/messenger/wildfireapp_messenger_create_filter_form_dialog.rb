class Model::Section::Messenger::WildfireappMessengerCreateFilterFormDialog < SitePrism::Section
    element :name, 'input#message_filter_name'
    element :keywords, 'textarea#message_filter_keyword_text'
    element :save_button, 'button[value="Save"]'
    element :social_properties_input_field, "input[value='Select Some Options']"
    elements :properties, 'ul.chzn-results li'

    def add_property property_name
      social_properties_input_field.click
      wait_for_properties
      properties.select {|p| p.text.include? property_name }.first.click
      save_button.click
    end
end
