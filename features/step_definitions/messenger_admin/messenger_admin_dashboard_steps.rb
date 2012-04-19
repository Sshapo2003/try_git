Given /^I am logged into the messenger admin site$/ do
  step "I navigate to the messenger admin login page"
  if !@messengeradmin.login.is_logged_in? then @messengeradmin.login.login('nathan.bain', 'xxxxxx') end
  # @messengeradmin.login.confirm
end

Then /^the following tabs should be visible on the messenger admin page$/ do |table|
  # table is a Cucumber::Ast::Table
  table.raw.flatten.should eql @messengeradmin.dashboard.messenger_admin_header_navigation_bar.navigation_links.map {|a| a.text}
end