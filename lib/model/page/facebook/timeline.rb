class Model::Page::Facebook::Timeline < SitePrism::Page
  section :timeline_nav_div, Model::Section::Facebook::TimelineNavDiv, 'div#timelineNavContent'
  section :first_recent_comment_facebook_timeline_unit, Model::Section::Facebook::TimelineUnit, 'div#pagelet_timeline_recent li.firstUnit'
  sections :facebook_timeline_units, Model::Section::Facebook::TimelineUnit, 'li.fbTimelineUnit'

  element :post_message_textarea , 'textarea[title="Write something..."]'
  element :post_message_share_button, 'input[value="Share"]'
  element :username_textbox, 'input#email'
  element :password_textbox, 'input#pass'
  element :login_button, 'label#loginbutton input'
  elements :status_units, 'div.statusUnit'

  def visit_my_timeline
    visit(Helpers::Config['facebook_page_url'])
  end

  def navigate_to_app app_name
    timeline_nav_div.navigate_to_app(app_name)
  end

  def post_message message
    post_message_textarea.click
    post_message_textarea.set message
    post_message_share_button.click
    Timeout.timeout(30) { sleep 0.1 while not first_recent_comment_facebook_timeline_unit.status.text.include?(message) }
  end

  def login user_credentials
    username_textbox.set user_credentials[:username]
    password_textbox.set user_credentials[:password]
    login_button.click
  end

  def messages_on_page
    facebook_timeline_units.collect {|u| u.text }
  end
end
