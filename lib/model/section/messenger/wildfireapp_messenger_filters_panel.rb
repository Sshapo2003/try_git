class Model::Section::Messenger::WildfireappMessengerFiltersPanel < SitePrism::Section
  element :create_new_filter_button, 'div.controls a'
  sections :filters, Model::Section::Messenger::WildfireappMessengerFilter, 'div.message_filter'
end
