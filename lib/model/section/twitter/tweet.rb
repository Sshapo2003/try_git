class Model::Section::Twitter::Tweet < SitePrism::Section
  element :body, 'p.js-tweet-text'
  element :reply_link, 'div.tweet a[title="Reply"]'
  root_element :reply_text_area, 'div.twttr-dialog-inside textarea.twitter-anywhere-tweet-box-editor'
  root_element :twitter_dialog, 'div.twttr-dialog'
  root_element :tweet_button, 'div.twttr-dialog-inside a.tweet-button'
  root_element :tweet_div, 'div.original-tweet'

  def post_reply(message="Had any good food recently? #{Time.hours_mins_seconds}")
    tweet_id = @root_element["data-tweet-id"]
    page.execute_script(%{$$("div.tweet[data-tweet-id='#{tweet_id}']")[0].click()})
    page.execute_script(%{$$("div.tweet[data-tweet-id='#{tweet_id}'] a[title='Reply']").click()})
    reply_text_area.set "@#{Helpers::Config['twitter_property_name']} #{message}"
    tweet_button.click
    return message
  end
end
