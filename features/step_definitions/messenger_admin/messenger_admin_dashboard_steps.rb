Given /^I am logged into the messenger admin site$/ do
  step "I navigate to the messenger admin login page"
  if !@messengeradmin.login.is_logged_in? then @messengeradmin.login.login(Helpers::Config.admin_login, Helpers::Config.admin_password) end
  # @messengeradmin.login.confirm
end

Then /^the following tabs should be visible on the messenger admin page$/ do |table|
  # table is a Cucumber::Ast::Table
  @messengeradmin.dashboard.messenger_admin_header_navigation_bar.navigation_links.map {|a| a.text}.should eql table.raw.flatten
end