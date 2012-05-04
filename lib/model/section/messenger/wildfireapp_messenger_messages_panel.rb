class Model::Section::Messenger::WildfireappMessengerMessagesPanel < SitePrism::Section
  element :actions_menu, 'div.wf_prompt_button_wpr a'
  element :actions_menu_assign_option, "ol#message_action a[href='Assign']"

  sections :messages, Model::Section::Messenger::WildfireappMessengerMessage, 'div.incoming_message'

  def assigned_messages
    messages.select {|m| m.is_assigned?}
  end

  def unassigned_messages
    messages.reject {|m| m.is_assigned?}
  end

  def flagged_messages
    messages.select {|m| m.is_flagged?}
  end
end
