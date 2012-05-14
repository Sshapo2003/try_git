Given /^I am logged in to Facebook as a page administrator$/ do
  facebook.home.login('alistair.hutchison@wildfireapp.com', 'w1ldf1r3')
  page.should have_content('Alistair Wildfire')
end

Then /^the updates to the "(.*)" page should be visible$/ do |page|
  @facebook.countdown_application.header_text_should_be(@updated_countdown_app_title).should be_true
end

Then /^the published template should be visible on my facebook page$/ do
  page.driver.browser.close
  page.driver.new_browser

  @facebook.timeline.visit_my_timeline
  @facebook.timeline.navigate_to_app('AllTemplates')

  Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.displayed? != true }
  Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.has_iframe? != true }
  begin
    Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.iframe_body.include?(@template_name) != true }
  rescue
    puts "Timed out while waiting for iframe to contain #{@template_name}. Page Body:"
    puts @facebook.wildfire_app_page.iframe_body
  end


  @facebook.wildfire_app_page.iframe_body.should include @template_name
end

Then /^the message should be visible on my facebook page$/ do
  @facebook.timeline.visit_my_timeline
  @facebook.timeline.facebook_timeline_units.select {|t| t.has_message? }.select {|t| t.status_message.text.include? @message_body }.count.should eql 1
  @matching_message = @facebook.timeline.facebook_timeline_units.select {|t| t.has_message? }.select {|t| t.status_message.text.include? @message_body }.first
end

Then /^the message on my facebook page should have the links title and text$/ do
   @matching_message.link_title.text.should include @attachment[:link_title]
   @matching_message.link_url.text.should include @attachment[:url]
end
