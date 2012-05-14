class Model::Section::Messenger::WildfireappMessengerFilter < SitePrism::Section
  element :name, 'div.name'
  element :assigned_properties, 'div.assigned_properties'
  element :edit_link, 'a.edit'

  def assigned?
    assigned_properties.text.include? 'Applied to 0 properties'
  end

  def edit
    # Need to mouse over for edit_link element to become visible
    page.execute_script "$('.message_filter div.name:contains(\"#{name.text}\")').parent().trigger('mouseover')"
    edit_link.click
  end
end
