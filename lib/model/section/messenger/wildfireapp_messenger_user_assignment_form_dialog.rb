class Model::Section::Messenger::WildfireappMessengerUserAssignmentFormDialog < SitePrism::Section
  element :save_button, 'button'
  sections :select_boxs, Model::Section::Messenger::WildfireappMessengerUserAssignmentFormUsers, 'div.user'

  def select_me
    select_box = select_boxs.select {|s| s.label.text.include?("(me)")}.first
    select_box.input.click
  end
end
