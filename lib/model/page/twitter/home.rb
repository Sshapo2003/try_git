class Model::Page::Twitter::Home < SitePrism::Page
  element :username_textbox, 'div.username input'
  element :password_textbox, 'div.password input'
  element :sign_in_button, 'table.password-signin button.submit'
  element :tweet_text_area, '.twitter-anywhere-tweet-box-editor'
  element :tweet_button, '.tweet-button'

  sections :tweets, Model::Section::Twitter::Tweet, 'div.tweet'

  def visit_my_page
    visit(Helpers::Config['twitter_page_url'])
  end

  def visit_twitter_posters_page
    visit(Helpers::Config['default_twitter_poster_url'])
  end

  def login creds
    visit 'https://twitter.com/'
    wait_for_and_set_username_textbox creds[:username]
    wait_for_and_set_password_textbox creds[:password]
    wait_for_and_click_sign_in_button
  end

  def post_tweet tweet
    wait_for_tweet_text_area
    tweet_text_area.set tweet
    tweet_button.click
    msg = "Timeout occured waiting for tweet '#{tweet} to appear"
    Timeout.timeout_and_raise(30, msg) {sleep 0.1 while tweets.select {|t| t.body.text.include? tweet}.count == 0}
  end
end
