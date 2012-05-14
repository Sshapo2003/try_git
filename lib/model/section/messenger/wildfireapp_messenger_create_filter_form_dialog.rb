class Model::Section::Messenger::WildfireappMessengerCreateFilterFormDialog < SitePrism::Section
    element :name, 'input#message_filter_name'
    element :keywords, 'textarea#message_filter_keyword_text'
    element :save_button, 'button[value="Save"]'
end
