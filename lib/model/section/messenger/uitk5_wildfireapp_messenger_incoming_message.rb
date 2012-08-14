class Model::Section::Messenger::Uitk5WildfireappMessengerIncomingMessage < Model::Section::Messenger::WildfireappMessengerIncomingMessage
  element :assigned_to,                '.assigned_to'
  element :assigned_avatar,            '.status_icons .assigned_to a img'
  element :add_comment_button,         "input[value='Add Comment']"
  element :flagged,                    '.flagged_message_icon'
  element :body,                       'div.body'
  root_element :assigned_to_bubbletip, '.popover'
  element :disabled_post_reply_button, '.tweet_button.disabled'
  element :reply_sent_div,             '.reply_sent'


  sections :replies, Model::Section::Messenger::MessageReply, '.twitter_reply'

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
end
