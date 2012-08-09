class Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessage < Model::Section::Messenger::WildfireappMessengerIncomingMessage
  element :assigned_to, '.assigned_to'
  element :assigned_avatar, '.status_icons .assigned_to a img'
  element :facebook_icon, '.facebook'
  element :twitter_icon, '.twitter'
  element :add_comment_button, "input[value='Add Comment']"
  root_element :assigned_to_bubbletip, '.popover'

  def is_assigned?
    has_assigned_to?
  end

  def is_facebook_message?
    has_facebook_icon?
  end

  def is_twitter_message?
    has_twitter_icon?
  end

  def hover_over_assigned_to
    page.execute_script %{$('tr[id="#{root_element[:id]}"] .status_icons img').mouseover()}
  end
end
