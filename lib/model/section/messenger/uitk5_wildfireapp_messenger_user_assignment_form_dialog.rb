class Model::Section::Messenger::Uitk5WildfireappMessengerUserAssignmentFormDialog < SitePrism::Section
  element :save_button, '.btn-primary'
  sections :select_boxs, Model::Section::Messenger::Uitk5WildfireappMessengerUserAssignmentFormUsers, 'label'

  def select_me
    select_box = select_boxs.select {|s| s.text.include?("(me)")}.first
    select_box.input.click
  end
end
