class Model::Section::Messenger::WildfireappMessengerIncomingMessage < SitePrism::Section
  element :assigned_to,                '.assigned_to'
  element :assigned_avatar,            '.status_icons .assigned_to a img'
  element :add_comment_button,         "input[value='Add Comment']"
  element :flagged,                    '.flagged_message_icon'
  element :body,                       'div.body'
  element :disabled_post_reply_button, '.tweet_button.disabled'
  element :reply_sent_div,             '.reply_sent'
  element :input,                      'input'
  element :date_time,                  'div.posted_at'
  element :view_replies_link,          'a.show_replies'
  element :view_comments_link,         'a.show_comments'
  element :comment_entry_field,        'input.comment_body'
  element :twitter_replies_area,       '.twitter_replies'
  element :service,                    '.service'
  element :property_name,              '.property_name'
  element :sender_name,                '.sender_name'
  element :select_checkbox,                'input.select_message'
  root_element :assigned_to_bubbletip, '.popover'
  root_element :permission_denied_popover, "div.popover:contains('Feature not available')"

  sections :comments, Model::Section::Messenger::MessageComment, '.comment'
  sections :replies, Model::Section::Messenger::MessageReply,    '.twitter_reply'

  def is_assigned?
    has_assigned_to?
  end

  def is_flagged?
    has_flagged?
  end

  def is_facebook_message?
    root_element[:class].include? 'facebook_page'
  end

  def is_twitter_message?
    root_element[:class].include? 'twitter_account'
  end

  def hover_over_assigned_to
    page.execute_script %{$('tr[id="#{root_element[:id]}"] .status_icons img').mouseover()}
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
    wait_for_twitter_replies_area(30)
    Timeout.timeout(Capybara.default_wait_time) { sleep 0.1 while twitter_replies_area.text.include? 'Loading...' }
    sleep 1
  end

  def like_comment comment_text
    comment = comments.select {|c| c.body.text.include? comment_text}.first
    comment.like
  end

  def wait_for_comment_entry_field
    Timeout.timeout(Capybara.default_wait_time) { sleep 0.1 while has_comment_entry_field? == false }
  end
  
  def add_comment(comment)
    view_comments
    comment_entry_field.set comment
    add_comment_button.click
  end
  
  def select
    select_checkbox.set(true)
  end
end
