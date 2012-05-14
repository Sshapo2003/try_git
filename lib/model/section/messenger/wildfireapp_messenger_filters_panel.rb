class Model::Section::Messenger::WildfireappMessengerFiltersPanel < SitePrism::Section
  element :create_new_filter_button, 'div.controls a'
  sections :filters, Model::Section::Messenger::WildfireappMessengerFilter, 'div.message_filter'

  def filter_by_name filter_name
    filters.select {|f| f.name.text.include? filter_name }.first
  end
end
