Given /^I am logged in to Facebook as a page administrator$/ do
  previous_url = current_url
  credentials = {:username => 'alistair.hutchison@wildfireapp.com', :password => 'w1ldf1r3'}
  @facebook.home.load
  @facebook.home.login(credentials)
  visit(previous_url) unless previous_url == "about:blank"
end

When /^I view the "(.*)" app page$/ do |app_name|
  @facebook.timeline.navigate_to_app app_name
end

Then /^the updates to the "(.*)" app should be visible$/ do |page|
  @facebook.countdown_application.header_text_should_be(@updated_countdown_app_title).should be_true
end

Then /^the published template should be visible on my facebook page$/ do
  step %{the published template should be visible on my facebook page with the title "#{@template_name}"}
end

Then /^the published template should be visible on my facebook page with the title "(.*)"$/ do |page_title|
  page.driver.browser.close
  page.driver.new_browser

  @facebook.timeline.visit_my_timeline
  @facebook.timeline.navigate_to_app Helpers::Config['create_template_property_name']

  Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.displayed? != true }
  Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.has_iframe? != true }
  Timeout.timeout_and_raise(30, "Timed out while waiting for iframe to contain #{page_title}. Page Body: #{@facebook.wildfire_app_page.iframe_body}") do 
    sleep 0.1 while @facebook.wildfire_app_page.iframe_body.include?(page_title) != true
  end
end


Then /^the message should be visible on my facebook page$/ do
  @facebook.timeline.visit_my_timeline
  @facebook.timeline.facebook_timeline_units.select {|t| t.has_message? }.select {|t| t.status_message.text.include? @message_body }.count.should eql 1
  @matching_message = @facebook.timeline.facebook_timeline_units.select {|t| t.has_message? }.select {|t| t.status_message.text.include? @message_body }.first
end

Then /^the reply should be visible in facebook$/ do
  @facebook.timeline.visit_my_timeline
  matching_messages = @facebook.timeline.facebook_timeline_units.select {|t| t.has_message? }.select {|t| t.status_message.text.include? @message_body }
  
  if matching_messages == nil
    messages = @facebook.timeline.facebook_timeline_units.select {|t| t.has_message? }.collect {|t| t.status_message.text}
    raise "No messages found with body #{@message_body}. Messages found: #{messages.each {|m| print "#{m}, "}} }"
  end

  @matching_message = matching_messages.first
  @matching_message.expand_comments
  @matching_message.comments.select {|m| m.body.text.include? @message_comment_text}.count.should == 1
end

Then /^the like is visible in facebook$/ do
  @matching_message.comments.select {|m| m.body.text.include? @message_comment_text}.first.should be_liked
end

Then /^the message on my facebook page should have the links title and text$/ do
   @matching_message.link_url.text.should include @attachment[:url]
end

When /^I send a facebook message which matches a "(.*)" filter$/ do |filter_type|
  case filter_type
  when "Flag" then filter_keyword = Helpers::Config['default_flag_filter_keyword']
  when "Delete" then filter_keyword = Helpers::Config['default_delete_filter_keyword']
  else raise "Unknown filter type #{filter_type}"
  end
  @flagged_message_random_part = String.random
  @flagged_message_content = "#{@flagged_message_random_part} #{filter_keyword}"

  creds = { :username => Helpers::Config['default_facebook_poster_username'], :password => Helpers::Config['default_facebook_poster_password'] }
  
  @facebook.timeline.visit_my_timeline creds

  @facebook.timeline.post_message @flagged_message_content

  @messengeradmin.refresh_a_social_property.load
  @messengeradmin.refresh_a_social_property.refresh_property Helpers::Config['facebook_property_name']
end
