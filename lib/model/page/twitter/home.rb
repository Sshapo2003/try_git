class Model::Page::Twitter::Home < SitePrism::Page
  element :username_textbox, 'div.username input'
  element :password_textbox, 'div.password input'
  element :sign_in_button, 'table.password-signin button.submit'

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
end
