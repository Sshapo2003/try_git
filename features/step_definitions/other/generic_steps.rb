Given /^I'm logged in to google as a wildfireapp\.com domain user$/ do
  if ENV['CONFIG'] != 'am-test'
    google = Model::Page::GoogleAppsLogin.new
    google.load
    google.login
  end
end

Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_content(message)
end