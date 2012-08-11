class Model::Section::Messenger::Uitk5WildfireappMessengerFilter < SitePrism::Section

  elements :table_cells, 'td'
  element :edit_link, '.edit_filter'

  def name
    table_cells[0]
  end

  def keyword_count
    table_cells[1]
  end

  def assigned_properties
    table_cells[2]
  end

  def assigned?
    assigned_properties.text.include? 'Applied to 0 properties'
  end

  def edit
    edit_link.click
  end

  def delete
    delete_link.click
    page.accept_alert
  end
end
