class Model::Section::Messenger::Uitk5WildfireappMessengerFiltersPanel < SitePrism::Section
  element :create_new_filter_button, '#keyword_filter_button'
  sections :filters, Model::Section::Messenger::Uitk5WildfireappMessengerFilter, 'tbody tr'

  def filter_by_name filter_name
    filters.select {|f| f.name.text.include? filter_name}.first
  end
end
