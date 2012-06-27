class Model::Section::Messenger::WildfireappMessengerIncomingMessage < SitePrism::Section
  element :assigned_to, 'div.assigned_to'
  element :flagged, 'div.flagged_message_icon'
  element :input, 'input'
  element :date_time, 'div.posted_at'
  element :body, 'div.body'
  element :assigned_avatar, 'div.assigned_to a img'
  element :view_replies_link, 'a.show_replies'
  element :view_comments_link, 'a.show_comments'
  element :comment_entry_field, 'input.comment_body'
  element :add_comment_button, "button[value='Add Comment']"
  element :twitter_replies_area, '.twitter_replies'
  element :service, '.service'
  element :property_name, '.property_name'
  element :sender_name, '.sender_name'
  root_element :assigned_to_bubbletip , 'body > div.wf_bubbletip'
  sections :replies, Model::Section::Messenger::MessageReply, '.twitter_reply'
  sections :comments, Model::Section::Messenger::MessageComment, '.comment'

  def is_assigned?
    has_assigned_to?
  end

  def is_flagged?
    has_flagged?
  end

  def is_facebook_message?
    service.text == 'Facebook'
  end

  def is_twitter_message?
    service.text == 'Twitter'
  end

  def select
    input.click
  end

  def view_comments
    unless has_comments? then view_comments_link.click end
    wait_for_comment_entry_field
  end

  def view_replies
    unless has_replies? then view_replies_link.click end
    wait_for_twitter_replies_area
    Timeout.timeout(Capybara.default_wait_time) { sleep 0.1 while twitter_replies_area.text.include? 'Loading...' }
    sleep 1
  end

  def like_comment comment_text
    comment = comments.select {|c| c.body.text.include? comment_text}.first
    comment.like
  end

  def hover_over_assigned_to
    page.execute_script("$('a[data-bubbletip-id=\"assigned_users_bubbletip_incoming_message_#{input[:value]}\"] img').mouseover()")
  end

  def assigned_to_bubbletip_visible?
    assigned_to_bubbletip[:style].include? 'display: block;'
  end

  def wait_for_comment_entry_field
    Timeout.timeout(Capybara.default_wait_time) { sleep 0.1 while has_comment_entry_field? == false }
  end
end
