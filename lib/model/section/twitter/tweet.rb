class Model::Section::Twitter::Tweet < SitePrism::Section
  element :body, 'p.js-tweet-text'
  element :reply_link, 'div.tweet a[title="Reply"]'
  root_element :reply_text_area, '.inline-reply-tweetbox .tweet-box'
  root_element :twitter_dialog, 'div.twttr-dialog'
  root_element :tweet_button, '.inline-reply-tweetbox .primary-btn'
  root_element :tweet_div, 'div.original-tweet'

  def post_reply(message="Had any good food recently? #{Time.hours_mins_seconds}")
    tweet_id = @root_element["data-tweet-id"]
    sleep 2
    tweet = page.find("div.tweet[data-tweet-id='#{tweet_id}']")
    tweet.click
    sleep 2
    tweet_reply_link = page.find("div.tweet[data-tweet-id='#{tweet_id}'] a[title='Reply']")
    tweet_reply_link.click
    sleep 2
    reply_text_area.set "@#{Helpers::Config['twitter_property_name']} #{message}"
    tweet_button.click
    return message
  end
end
