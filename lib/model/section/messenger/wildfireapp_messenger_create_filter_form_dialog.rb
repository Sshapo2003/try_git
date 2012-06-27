class Model::Section::Messenger::WildfireappMessengerCreateFilterFormDialog < SitePrism::Section
    element :name, 'input#message_filter_name'
    element :keywords, 'textarea#message_filter_keyword_text'
    element :save_button, 'button[value="Save"]'
    element :social_properties_input_field, "input[value='Select Some Options']"
    element :error_explaination_div, 'div.errorExplanation'
    elements :properties_in_select_list, 'ul.chzn-results li'
    sections :selected_properties, Model::Section::Messenger::WildfireappMessengerCreateFilterFormDialogSelectedProperty, 'li.search-choice'

    def add_property property_name
      social_properties_input_field.click
      wait_for_properties_in_select_list(30)
      properties_in_select_list.select {|p| p.text.include? property_name }.first.click
      save_button.click
    end

    def remove_property property_name
      selected_properties.select {|p| p.text.include? property_name }.first.delete_button.click
      save_button.click
    end
end
