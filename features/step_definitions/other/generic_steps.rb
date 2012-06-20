Given /^I'm logged in to google as a wildfireapp\.com domain user$/ do
  # Admin pages aren't restrocted on am-test, so need to login there. Loading the messenger admin page
  # currently handles logging in to google apps with the test automation user, if required
  Model::Page::MessengerAdmin::MessengerAdminPage.new.load unless ENV['CONFIG'] == 'am-test'
end

Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_content(message)
end