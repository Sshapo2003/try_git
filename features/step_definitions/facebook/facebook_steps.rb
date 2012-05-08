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
  Timeout.timeout(30) { sleep 0.1 while@facebook.wildfire_app_page.iframe_body.include?(@template_name) != true }
  
  @facebook.wildfire_app_page.iframe_body.should include @template_name
end

Then /^the message should be visible on my facebook page$/ do
  @facebook.timeline.visit_my_timeline
  @facebook.timeline.status_units.select {|s| s.text.include? @message_body }.count.should eql 1
end
