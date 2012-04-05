Then /^the updates to the "(.*)" page should be visible$/ do |page|
  @facebook.countdown_application.header_text_should_be(@updated_countdown_app_title).should be_true
end
