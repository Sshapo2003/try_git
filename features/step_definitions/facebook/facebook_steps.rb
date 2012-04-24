Given /^I am logged in to Facebook as a page administrator$/ do
  facebook.home.login('alistair.hutchison@wildfireapp.com', 'w1ldf1r3')
  page.should have_content('Alistair Wildfire')
end

Then /^the updates to the "(.*)" page should be visible$/ do |page|
  @facebook.countdown_application.header_text_should_be(@updated_countdown_app_title).should be_true
end
