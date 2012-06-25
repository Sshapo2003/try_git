class Model::Page::Facebook::Timeline < SitePrism::Page
  section :timeline_nav_div, Model::Section::Facebook::TimelineNavDiv, 'div#timelineNavContent'
  sections :facebook_timeline_units, Model::Section::Facebook::TimelineUnit, 'div.timelineUnitContainer'

  element :current_user_username_span, 'span.headerTinymanName'
  element :user_nav_drop_down, 'div#userNavigationLabel'
  element :user_nav_drop_down_log_out_option, 'input[value^="Log"]'
  element :post_message_textarea , 'textarea[title="Write something..."]'
  element :post_message_share_button, 'input[value="Share"]'
  element :username_textbox, 'input#email'
  element :password_textbox, 'input#pass'
  element :login_button, 'label#loginbutton input'
  elements :status_units, 'div.statusUnit'
  elements :status_units_text_content, 'div.timelineUnitContainer .statusUnit'
  elements :status_units_with_image_text_content, '.uiStreamMessage span'


  def visit_timeline page_name
    visit "http://www.facebook.com/#{page_name}"
  end

  def visit_my_timeline user_credentials=nil
    visit(Helpers::Config['facebook_page_url'])
    if user_credentials != nil
      login user_credentials
      unless page.current_url.include? Helpers::Config['facebook_page_url'] then visit(Helpers::Config['facebook_page_url']) end
    end
  end

  def login user_credentials
    if logged_in? then logout end
    username_textbox.set user_credentials[:username]
    password_textbox.set user_credentials[:password]
    login_button.click
  end

  def navigate_to_app app_name
    timeline_nav_div.navigate_to_app(app_name)
  end

  def post_message message
    wait_for_post_message_textarea
    post_message_textarea.click
    post_message_textarea.set message
    wait_for_post_message_share_button
    
    retries = 0
    max_retries = 5
    clicked = false
    while (retries < max_retries) and (not clicked)
      retries += 1
      begin
        post_message_share_button.click
        clicked = true
      rescue Selenium::WebDriver::Error::ElementNotVisibleError
        sleep 1
      end
    end
    msg = "Expected facebook timeline messages to include #{message}."
    Timeout.timeout_and_raise(60, msg) { sleep 0.1 while not timeline_units_contain_message? message }
  end

  def timeline_units_contain_message? message
    all_status_units = status_units_text_content | status_units_with_image_text_content
    all_status_units.select {|su| su.text.include? message}.count > 0
  end

  def messages_on_page
    facebook_timeline_units.collect {|u| u.text }
  end

  def messages_with_attachments
    facebook_timeline_units.select {|u| u.has_attachment? }
  end

  def logged_in?
    has_current_user_username_span?
  end

  def logout
    user_nav_drop_down.click
    wait_for_user_nav_drop_down_log_out_option
    user_nav_drop_down_log_out_option.click
  end
end
