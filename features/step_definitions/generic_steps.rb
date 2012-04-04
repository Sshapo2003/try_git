Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_content(message)
end