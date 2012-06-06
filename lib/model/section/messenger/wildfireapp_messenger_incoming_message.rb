class Model::Section::Messenger::WildfireappMessengerIncomingMessage < SitePrism::Section
  element :assigned_to, 'div.assigned_to'
  element :flagged, 'div.flagged_message_icon'
  element :input, 'input'
  element :date_time, 'div.posted_at'
  element :body, 'div.body'
  element :assigned_avatar, 'div.assigned_to a img'
  element :view_replies_link, 'a.show_replies'
  root_element :assigned_to_bubbletip , 'body > div.wf_bubbletip'
  elements :replies, 'div.twitter_reply'

  def is_assigned?
    has_assigned_to?
  end

  def is_flagged?
    has_flagged?
  end

  def select
    input.click
  end

  def hover_over_assigned_to
    page.execute_script("$('a[data-bubbletip-id=\"assigned_users_bubbletip_incoming_message_#{input[:value]}\"] img').mouseover()")
  end

  def assigned_to_bubbletip_visible?
    assigned_to_bubbletip[:style].include? 'display: block;'
  end
end
